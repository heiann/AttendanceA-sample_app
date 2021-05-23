class User < ApplicationRecord
  has_many :bases, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :approvalas, dependent: :destroy
  # 「remember_token」という仮想の属性を作成します。
  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :affiliation, length: { in: 2..30 }, allow_blank: true
  validates :basic_time, presence: true
 
 
 def User.digest(string)
  cost = 
    if ActiveModel::SecurePassword.min_cost
      BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
   BCrypt::Password.create(string, cost: cost)
 end

 def User.new_token
  SecureRandom.urlsafe_base64
 end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def self.import(file)
    CSV.foreach(file.path, encoding: "CP932:UTF-8", headers: true) do |row|
      user = find_by(id: row["id"]) || new
      user.attributes = row.to_hash.slice(*updatable_attributes)
      user.save!
    end
  end

  def self.updatable_attributes
    ['name', 'email', 'affiliation', 'employee_number', 'card_id', 'basic_time', 'work_start_time', 'work_end_time', 'superior', 'admin','password' ]
  end
end
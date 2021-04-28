class User < ApplicationRecord
  # 「remember_token」という仮想の属性を作成します。
  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :department, length: { in: 2..30 }, allow_blank: true
 
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
    CSV.foreach(file.path, headers: true) do |row|
      user = find_by(id: row["id"]) || new
      user.attributes = row.to_hash.slice(*updatable_attributes)
      user.save!
    end
  end
   
  def self.generete_csv
    CSV.generete(headers: true, encoding: Encoding::SJIS) do |csv|
      csv << csv_attributes
      all.each do |part|
        csv << csv_attributes.map{|attr| part.send(attr)}
      end
    end
  end

  def self.updatable_attributes
    ['user.name', 'email', 'department', 'employee_number', 'card_id', 'basic_time', 'work_start_time', 'work_end_time', 'superior', 'admin', 'admin']
  end
end
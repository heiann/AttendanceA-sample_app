class Base < ApplicationRecord
  belongs_to :user
  validates :base_name, presence: true
end

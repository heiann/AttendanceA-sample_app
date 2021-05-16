class Base < ApplicationRecord
 belongs_to :user
 validates :base_id,  presence: true
 validates :base_name,  presence: true, length: { maximum: 50 }
 validates :base_type,  presence: true
end

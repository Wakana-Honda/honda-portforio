class Record < ApplicationRecord
  belongs_to :end_user,optional: true
  belongs_to :food, optional: true
  belongs_to :pet, optional: true
  
  validates :pet_id, presence: true
  validates :food_id, presence: true
  validates :amount, presence: true
  validates :memo, length: { maximum: 50 }

  default_scope -> { order(created_at: :desc) }
  
end

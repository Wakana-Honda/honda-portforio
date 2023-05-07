class Type < ApplicationRecord
 belongs_to :user,optional: true
 has_many :foods,dependent: :destroy
 has_many :types, through: :foods
 
 validates :name, presence: true,length: { minimum: 1, maximum: 10 }
end

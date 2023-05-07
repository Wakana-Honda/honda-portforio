class Genre < ApplicationRecord
 belongs_to :user, optional: true
 has_many :foods,dependent: :destroy
 has_many :types, through: :foods
 
 validates :name, presence: true,length: { minimum: 1, maximum: 10 }
 
end


# rails g model Food_genre food:references genre:references
# has_many :food_genres, dependent: :destroy
# has_many :foods, through: :food_genres, dependent: :destroy

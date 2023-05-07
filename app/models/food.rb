class Food < ApplicationRecord
  belongs_to :end_user,optional: true
  belongs_to :genres,optional: true
  belongs_to :types,optional: true
  
  has_many :records, dependent: :destroy
  has_many :pets, through: :records
  
  # has_many :genres, through: :food_genres, dependent: :destroy
  has_one_attached :food_image
  
   def get_food_image(width, height)
    unless food_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpeg')
     food_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    food_image.variant(resize:"#{width}x#{height}").processed
   end


  def previous
   end_user.foods.where("id < ?", self.id).order("id DESC").first
  end
  def next
   end_user.foods.where("id > ?", self.id).order("id ASC").first
  end
  
   validates :name, presence: true,length: { minimum: 1, maximum: 20 }
   validates :type_id, presence: true
   validates :genre_id, presence: true
   validates :memo, length: { maximum: 50 }

end


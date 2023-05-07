module FoodHelper
  
  def pet_foots_per(pet)
     pet.foods.group(:name).count.map do |key, value|
      [key, (value / pet.foods.count.to_f  * 100).to_i ] 
    end.to_h
  
    
  end
end

class FoodController < ApplicationController
 before_action :set_food, only: [:show,:edit, :update, :destroy]
 before_action :set_url, only: [:show,:edit, :update, :destroy]

  def new
   @food = Food.new
   
   # collection_select用
   @types = current_end_user.types
   @genres = current_end_user.genres
   
   # # モーダル用
   @genre = Genre.new
   @type = Type.new
  end
 
 def create
   @food = Food.new(food_params)
   @types = current_end_user.types
   @genres = current_end_user.genres
   @food.end_user_id = current_end_user.id
   if @food.save
    redirect_to food_index_path
   else
     render:new
   end
   
 end

  def index
   # binding.pry
   @foods = Food.all
   @foods = current_end_user.foods
  end

  def show
   @food = Food.find(params[:id])
   @foods = current_end_user.foods
   @type = Type.find(@food.type_id)
   @genre = Genre.find(@food.genre_id)
  end

  def edit
   @food = Food.find(params[:id])
   @types = current_end_user.types
   @genres = current_end_user.genres
  end
  
  def update
   @food = Food.find(params[:id])
   if @food.update(food_params)
    redirect_to food_path(@food.id)
   else
    render:edit
   end
  end
  
  def destroy
   @food = Food.find(params[:id])
   @food.destroy
   redirect_to food_index_path
  end
  
  private
  #直叩き防止
  def set_food
      @food = Food.find(params[:id])
  end

  def set_url
    if @food.end_user_id != current_end_user.id
      redirect_to new_end_user_session_path
    end
  end
  
  # ストロングパラメータ
  def food_params
    params.require(:food).permit(:type_id, :name,:memo,:food_image, :genre_id)
  end
  
end


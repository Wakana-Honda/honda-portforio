class PetController < ApplicationController
 before_action :set_pet, only: [:show, :edit, :update, :destroy]
 before_action :set_url, only: [:show, :edit, :update, :destroy]
 
  def new
   @pet = Pet.new
  end
 
 def create
   @pet = Pet.new(pet_params)
   @pet.end_user_id = current_end_user.id
   if @pet.save
    redirect_to pet_index_path
   else
    render:new
   end
 end

  def index
   @pets = Pet.all
   @pets = current_end_user.pets
  end
 
  def show
   @record = Record.find(params[:id])
   @pets = current_end_user.pets
   @foods = current_end_user.foods
   @pet = Pet.find(params[:id])
  end
  
  def edit
   @pet = Pet.find(params[:id])
  end
  
  def update
   @pet = Pet.find(params[:id])
   if @pet.update(pet_params)
    redirect_to pet_index_path(@pet.id)
   else
    render:edit
   end
  end
  
  def destroy
   @pet = Pet.find(params[:id])
   @pet.destroy
   redirect_to pet_index_path
  end
  
  private
  #直叩き防止
  def set_pet
      @pet = Pet.find(params[:id])
  end

  def set_url
    if @pet.end_user_id != current_end_user.id
      redirect_to new_end_user_session_path
    end
  end
  
  # ストロングパラメータ
  def pet_params
    params.require(:pet).permit(:name,:pet_image,:age,:birthday,:gender,:memo)
  end
  
end

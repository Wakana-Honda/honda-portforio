class RecordController < ApplicationController
 before_action :set_record, only: [:edit, :update, :destroy]
 before_action :set_url, only: [:edit, :update, :destroy]
 
  def new
   @record = Record.new
   @pets = current_end_user.pets
   @foods = current_end_user.foods
  end
  
  def create
   @record = Record.new(record_params)
   @pets = current_end_user.pets
   @foods = current_end_user.foods
   @record.end_user_id = current_end_user.id
   if @record.save
    redirect_to record_index_path
   else
    render:new
   end
  end

  def index
   @records = Record.page(params[:page])
   @records = current_end_user.records.page(params[:page])
   @pets = current_end_user.pets
   @record_cale = current_end_user.records.select("*, date(created_at)").group(:pet_id, "date(created_at)")
  end
  
  def search
   pet_id = params[:pet_id]
   @records = Record.where('pet_id LIKE?', "%#{pet_id}%")
   @records = @records.page(params[:page])
   @pets = current_end_user.pets
  end
  
  def calendar
   @record_cale = current_end_user.records.select("*, date(created_at)").group(:pet_id, "date(created_at)")
  end
  
  def show
   @record = Record.find(params[:id])
   @records = current_end_user.records
  end

  def edit
   @record = Record.find(params[:id])
   @pets = current_end_user.pets
   @foods = current_end_user.foods
  end
  
  def update
   @record = Record.find(params[:id])
   if @record.update(record_params)
     redirect_to record_index_path
   else
    render:edit
   end
   
  end
  
  def destroy
   @record = Record.find(params[:id])
   @record.destroy
   redirect_to record_index_path
  end
  
  private
  #直叩き防止
  def set_record
      @record = Record.find(params[:id])
  end

  def set_url
    if @record.end_user_id != current_end_user.id
      redirect_to new_end_user_session_path
    end
  end
  
  def record_params
    params.require(:record).permit(:amount,:memo,:pet_id,:food_id,:start_time)
  end
  
end

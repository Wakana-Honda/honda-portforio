class TypeController < ApplicationController
 before_action :set_type, only: [:edit, :update, :destroy]
 before_action :set_url, only: [:edit, :update, :destroy]
  
  def index
   @type = Type.new
   @types = Type.all
   @types = current_end_user.types
  end
 
 def create
   @types = Type.all
   @types = current_end_user.types
   @type = Type.new(type_params)
   @type.end_user_id = current_end_user.id
   respond_to do |format|
     if @type.save
      format.html { redirect_to type_index_path }
      format.js 
     else
      format.html { render :index } 
      format.js { render :errors } 
     end
   end
 end
 
 def edit
   @type = Type.find(params[:id])
 end

def update
   @type = Type.find(params[:id])
   @type.update(type_params)
   redirect_to type_index_path(@type.id)
end

def destroy
  @type = Type.find(params[:id])
  @type.destroy
  redirect_to type_index_path
end

private
#直叩き防止
  def set_type
      @type = Type.find(params[:id])
  end

  def set_url
    if @type.end_user_id != current_end_user.id
      redirect_to new_end_user_session_path
    end
  end
  
  def type_params
    params.require(:type).permit(:name)
  end
  
end

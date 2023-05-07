class GenreController < ApplicationController
 before_action :set_genre, only: [:edit, :update, :destroy]
 before_action :set_url, only: [:edit, :update, :destroy]

  def index
    @genre = Genre.new
    @genres = Genre.all
    @genres = current_end_user.genres
  end
 
  def create
    @genres = Genre.all
    @genres = current_end_user.genres
    @genre = Genre.new(genre_params)
    @genre.end_user_id = current_end_user.id
    respond_to do |format|
     if @genre.save
      format.html { redirect_to genre_index_path }
      format.js 
     else
      format.html { render :index } 
      format.js { render :errors } 
     end
    end
  end
 
  def edit
    @genre=Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genre_index_path(@genre.id)
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genre_index_path
  end

  private
  #直叩き防止
  def set_genre
      @genre = Genre.find(params[:id])
  end

  def set_url
    if @genre.end_user_id != current_end_user.id
      redirect_to new_end_user_session_path
    end
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end

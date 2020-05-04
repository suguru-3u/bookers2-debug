class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new(book_id: params[:book_id])
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  # @like = current_user.likes.create(post_id: params[:post_id])
    # redirect_back(fallback_location: root_path)

  def destroy
    if Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
      @favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
      @favorite.destroy
    end
    redirect_back(fallback_location: root_path)
  end

end

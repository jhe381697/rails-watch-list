class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new  # bookmark vide que l'on va alimenter
    @list = List.find(params[:list_id])  # list pleine qu'on a besoin
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

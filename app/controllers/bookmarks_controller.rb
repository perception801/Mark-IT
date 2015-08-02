class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_topic, only: [:show, :edit, :new, :create]
  before_action :get_bookmark, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmarks = Bookmark.all
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic
      

    if @bookmark.save
      flash[:notice] = "Bookmark was saved succesfully."
      redirect_to @topic
    else
      flash[:error] = "There was a problem saving the bookmark. Please try again."
      render :new
  end
end

  def edit   
  end

  def update
    authorize @bookmark
    if @bookmark.update_attributes(bookmark_params)
      redirect_to @topic, notice: "Bookmark was succesfully updated."
      else
      flash[:error] = "There was an error updating the bookmark, please try again."
      render :edit 
  end
end

  def destroy
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was succesfully deleted."
      redirect_to @topic
      else
      flash[:error] = "There was an error deleting the bookmark, please try again."
      render :show 
  end
end




  private

  def get_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
   
  def get_topic
    @topic = Topic.find(params[:topic_id])
  end
end

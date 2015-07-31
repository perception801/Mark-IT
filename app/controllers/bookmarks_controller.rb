class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_topic, only: [:show, :edit, :new]
  before_action :get_bookmark, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
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
    @bookmark = Bookmark.find(params[:id])
  end

  def update
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

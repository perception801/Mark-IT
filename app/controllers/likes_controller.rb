class LikesController < ApplicationController

  #def create
   # @bookmark = Bookmark.find(params[:bookmark_id])
    #like = current_user.likes.build(bookmark: @bookmark)
    #authorize like

    #if like.save
    #  flash[:notice] = "You like this bookmark!"
     # redirect_to [@bookmark.topic]
    #else
     # flash[:error] = "Something went wrong, please try again."
      #redirect_to [@bookmark.topic]
    #end
  #end



#  def destroy
 #   @bookmark = Bookmark.find(params[:bookmark_id])
  #  like = @bookmark.likes.find(params[:id])
   # authorize like
#
 #   if like.destroy
  #    flash[:notice] = "Bookmark is no longer liked"
   #   redirect_to [@bookmark.topic]
    #else
     # flash[:error] = "Something went wrong, please try again."
      #redirect_to [@bookmark.topic]
    #end
  #end
end

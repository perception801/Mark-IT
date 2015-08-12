class UsersController < ApplicationController
  def show
  @user_bookmarks = current_user.bookmarks.order(:topic_id)
  @liked_bookmarks = current_user.liked
  end
end

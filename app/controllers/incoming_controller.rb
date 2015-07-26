class IncomingController < ApplicationController

skip_before_action :verify_authenticity_token, only: [:create]

def create

@user = User.find_by(email: params[:sender])
@topic = Topic.find_by(email: params[:subject])
@url = params["body-plain"]
         
  if @user.nil?
    @user = User.new(email: params[:sender], password: "password")
    @user.skip_confirmation!
    @user.save!
  end

  if @topic.nil?
    @topic = @user.topics.create(title: params[:subject])
  end

  @bookmark = @user.bookmarks.create(url: @url, topic_id: @topic.topic_id)

    head 200
  end
end
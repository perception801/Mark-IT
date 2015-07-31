class TopicsController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_topic, only: [:show, :edit, :update, :destroy]


  def index
    @topics = Topic.all
  end

  def show
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def create
    @topics = Topic.all
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      flash[:notice] = "Topic succesfully created"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic, please try again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @topic.destroy
      flash[:notice] = "\"#{name}\" was succesfully removed."
      redirect_to topics_path
    else
      flash[:error] = "There was an error removing the topic, please try again."
      render :show
    end
  end

private

  def get_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title)
  end

end
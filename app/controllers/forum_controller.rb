class ForumController < ApplicationController
  before_filter :protect
  def list
    if(params[:id])
      @forum = Forum.find(params[:id])
      @topics = @forum.topics.sort {|x,y| x.updated_at <=> y.updated_at}.reverse
    end
  end

  def login
    @user = curuser
  end

end

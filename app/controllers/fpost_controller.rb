# -*- coding: utf-8 -*-
class FpostController < ApplicationController
  before_filter :login_required

  def new
    if request.post? and params[:post] and params[:id]
      @post = Fpost.new(params[:post])
      @post.topic =Topic.find(params[:id])
      @post.user = curuser
      @post.topic.updated_at=Time.now
      if @post.save and @post.topic.save
        
        flash[:notice]= "post został dodany"
#        redirect_to :controller => :topic, :action => :show, :id => params[:id]
      end
      redirect_to :controller => :topic, :action => :show, :id => params[:id]
    end
    
  end

  def delete
    if params[:id]
      @post = Fpost.find(params[:id])
      if @post.rights?(curuser)
        @post.delete
        flash[:notice]= "Pomyślnie usunięto posta"
      else
        flash[:error]= "Nie możesz usunąć tego posta"
      end

    end
    redirect_to :controller => 'topic', :action => 'show', :id => @post.topic
  end

  def edit
  end

  def show
    if params[:id]
      @post = Fpost.find(params[:id])
      redirect_to :controller => "topic", :action => "show", :id => @post.topic, :anchor => @post.id
    end
  end

end

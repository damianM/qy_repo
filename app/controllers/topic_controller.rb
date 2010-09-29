# -*- coding: utf-8 -*-
class TopicController < ApplicationController
  before_filter :login_required
  
  def new

    @forum = Forum.find(params[:id])
    if request.post? and params[:topic] and params[:fpost] and params[:id]
      @topic = Topic.new(params[:topic])
      @fpost = Fpost.new(params[:fpost])
      @topic.forum = Forum.find(params[:id])
      @fpost.topic = @topic
      @fpost.user=curuser
      if Topic.tr(@topic,@fpost)
        flash[:notice]="Utworzono temat"
        redirect_to :controller => "forum", :action => "list", :id => @topic.forum
      end
    end
  end

  def delete
    if params[:id]
      @topic = Topic.find(params[:id])
      if @topic.rights?(curuser)
        posts = @topic.posts
        for post in posts
          post.delete
        end
        @topic.delete
        flash[:notice]="Pomyślnie usunięto temat"
        redirect_to session[:prevpage]
      end
    end
  end

  def show
    if params[:id]
      @topic=Topic.find(params[:id])
    end
  end


  def t_add
    respond_to do |format|

      format.js do

        render :update do |page|

          @forum = params[:id]
          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_t"
          page.insert_html :after, "add_t", :partial => "topic/topicnew", :locals => {:forum => @forum}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def p_add
    respond_to do |format|

      format.js do

        render :update do |page|

          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_p"
          page.insert_html :after, "add_p", :partial => "topic/postnew", :locals => {:topic => params[:id]}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end
  def t_fold
    respond_to do |format|

      format.js do

        render :update do |page|


          page.remove "obj"
          page.visual_effect :blind_down, "add_t"
        end
      end
    end
  end
  def p_fold
    respond_to do |format|

      format.js do

        render :update do |page|


          page.remove "obj"
          page.visual_effect :blind_down, "add_p"
        end
      end
    end
  end
end

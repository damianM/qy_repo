# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  before_filter :login_required
  
  before_filter :find_comment, :only => [ :destroy ]
  before_filter :find_commentable, :only => [ :create ]

  
  def create
    @comment = @commentable.comments.build(params[:comment])    
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Dodano komentarz"
    else
      flash[:notice] = "Komentarz nie został dodany"
    end
    redirect_back_or_default(root_path)
  end
  
  def destroy
    @commentable = @comment.commentable
    @comment.destroy
    flash[:notice] = "Usunięto komentarz"
    redirect_to user_path(@commentable)
  end
  
  protected
  
  def find_comment
    begin
      @comment = Comment.find_by_id(params[:id])
      raise 'Komentarz nie został odnaleziony.' unless @comment
    rescue Exception => exception
      flash[:error] = exception.message
      redirect_to root_path
      return false
    end
  end
  
  def find_commentable
    begin
      @commentable = params[:commentable_type].constantize.find(params[:commentable_id])
      raise 'Obiekt nie został odnaleziony.' unless @commentable
    rescue Exception => exception
      flash[:error] = exception.message
      redirect_to root_path
      return false
    end
  end


end

class CommentController < ApplicationController
  before_filter :protect
  def new
    if request.post? and params[:id]
      @comment = Comment.new(params[:comment])
      @comment.sender = curuser
      @comment.receiver = User.find(params[:id])
      puts User.find(params[:id]).inspect
      if @comment.save
        flash[:notice]="Dodano komentarz"
        redirect_to session[:prevpage]
      end
    end
  end

  def delete
    if params[:id]
      @comment = Comment.find(params[:id])
      @comment.delete
      flash[:notice]="Usunięto komentarz"
      redirect_to session[:prevpage]
    end
  end

end

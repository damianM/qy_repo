class VcommentController < ApplicationController
  before_filter :protect
  def new
    if request.post? and params[:id]
      @pcomment = Vcomment.new(params[:comment])
      @pcomment.user = curuser
      @pcomment.video = Video.find(params[:id])
      if @pcomment.save
        flash[:notice]="Dodano komentarz"
        redirect_to session[:prevpage]
      end
    end
  end

  def delete
    if params[:id]
      @pcomment = Vcomment.find(params[:id])
      @pcomment.delete
      flash[:notice]="Usunięto komentarz"
      redirect_to session[:prevpage]
    end
  end

end

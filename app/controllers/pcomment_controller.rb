class PcommentController < ApplicationController
  before_filter :protect
  def new
    if request.post? and params[:id]
      @pcomment = Pcomment.new(params[:comment])
      @pcomment.user = curuser
      @pcomment.photo = Photo.find(params[:id])
      if @pcomment.save
        flash[:notice]="Dodano komentarz"
        redirect_to session[:prevpage]
      end
    end
  end

  def delete
    if params[:id]
      @pcomment = Pcomment.find(params[:id])
      @pcomment.delete
      flash[:notice]="Usunięto komentarz"
      redirect_to session[:prevpage]
    end
  end

end

class PrateController < ApplicationController
  def vote
    if params[:prate] and request.post?
      vote=params[:prate][:vote]
      photo=Photo.find(params[:id])
      pr=photo.prate
      pr.sum += vote.to_i
      pr.votes+=1
      Userprate.create(:user_id => curuser.id, :prate_id => pr.id)
      if pr.save
        flash[:notice] = "Dzięki za ocenę!"
      else
        flash[:error] = "Wystąpił błąd"
      end
      
    end
    redirect_to session[:prevpage]
  end

end

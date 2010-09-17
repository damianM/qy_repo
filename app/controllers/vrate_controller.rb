class VrateController < ApplicationController
  def vote
    if params[:vrate] and request.post?
      vote=params[:vrate][:vote]
      video=Video.find(params[:id])
      vr=video.vrate
      vr.sum += vote.to_i
      vr.votes+=1
      Uservrate.create(:user_id => curuser.id, :vrate_id => vr.id)
      if vr.save
        flash[:notice] = "Dzięki za ocenę!"
      else
        flash[:error] = "Wystąpił błąd"
      end
      
    end
    redirect_to session[:prevpage]
  end

end

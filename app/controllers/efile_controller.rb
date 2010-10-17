# -*- coding: utf-8 -*-
class EfileController < ApplicationController  

  def new
    if request.post? and params[:efile]

      v=params[:efile].clone
      
      puts v[:file].content_type
      @efile=Efile.new()
      @efile.event = Event.find(params[:id])

      sf = @efile.make v[:file],curuser

      if sf!=nil && sf.save
        flash[:notice]="Pomyślnie dodano plik"
      else
        flash[:error]="Wystąpił błąd"
      end


      redirect_to :controller => "events", :action => "show", :id => @efile.event.id
      
    end
  end

  def delete
  end

end

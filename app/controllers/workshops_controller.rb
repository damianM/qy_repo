# -*- coding: utf-8 -*-
class WorkshopsController < ApplicationController

  before_filter :login_required
  layout 'admin'
  
  def index
    @workshops = Workshop.all
  end
  
  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(params[:workshop])

    if @workshop.save
      flash[:notice] = "Serwis został dodany."

      redirect_to workshops_path
    else
      flash[:error]  = "Próba utworzenia serwisu nie powiodła się."
      render :action => 'new'
    end
  end
  
  def show
    @workshop = Workshop.find(params[:id])
  end
  
  def edit
    @workshop = Workshop.find(params[:id])
  end

  def update
    @workshop = Workshop.find(params[:id])

    if @workshop.update_attributes(params[:workshop])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to workshops_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit'
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    
    @workshop.destroy

    redirect_to workshops_path
  end

  def show_on_google_map
    @workshop = Workshop.find(params[:id])   
  end

end

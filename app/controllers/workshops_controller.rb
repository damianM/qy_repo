# -*- coding: utf-8 -*-
class WorkshopsController < ApplicationController

  before_filter :login_required

  def index
    @main_workshop = Workshop.find(:first, :conditions => {:main => 1})

    conditions = "states.label like '%#{params[:query]}%'" if params[:query]

    @workshops = Workshop.paginate :page => params[:page], :per_page => 10, :include => [:state], :conditions => conditions

    if request.xhr?
      return render :partial => 'workshops'
    else
      render :action => 'index'
    end

  end
    
  def new
    @workshop = Workshop.new
    @workshop.serial = Workshop.generate_serial
  end

  def create
    @workshop = Workshop.new(params[:workshop])

    if @workshop.save
      flash[:notice] = "Serwis został dodany."

      redirect_to home_workshops_path
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
    @workshop.serial = Workshop.generate_serial
  end

  def update
    @workshop = Workshop.find(params[:id])

    if @workshop.update_attributes(params[:workshop])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to home_workshops_path
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
  
  def make_main
    @workshop = Workshop.find(params[:id])
    
    Workshop.update_all({:main => 0})

    @workshop.update_attribute(:main,1)
    render :nothing => true
  end
end

# -*- coding: utf-8 -*-
class ShopsController < ApplicationController

  before_filter :login_required
  
  def home
    @main_shop = Shop.find(:first, :conditions => {:main => 1})

    conditions = "states.label like '%#{params[:query]}%'" if params[:query]

    @shops = Shop.paginate :page => params[:page], :per_page => 10, :include => [:state], :conditions => conditions

    if request.xhr?
      return render :partial => 'shops'
    else
      render :action => 'home'
    end

  end

  def index
    @shops = Shop.all
  end
  
  def new
    @shop = Shop.new
    @shop.serial = Shop.generate_serial
  end

  def create
    @shop = Shop.new(params[:shop])

    if @shop.save
      flash[:notice] = "Sklep został dodany."

      redirect_to shop_path(@shop)
    else
      flash[:error]  = "Próba utworzenia sklepu nie powiodła się."
      render :action => 'new'
    end
  end
  
  def show
    @shop = Shop.find(params[:id])
  end
  
  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop.update_attributes(params[:shop])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to shops_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit'
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    
    @shop.destroy

    redirect_to shops_path
  end

  def show_on_google_map
    @shop = Shop.find(params[:id])   
  end

  def make_main
    @shop = Shop.find(params[:id])
    
    Shop.update_all({:main => 0})

    @shop.update_attribute(:main,1)
    render :nothing => true
  end

end

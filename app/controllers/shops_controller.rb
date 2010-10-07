# -*- coding: utf-8 -*-
class ShopsController < ApplicationController

  layout 'admin'
  
  def index
    @shops = Shop.all
  end
  
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(params[:shop])

    if @shop.save
      flash[:notice] = "Sklep został dodany."

      redirect_to shops_path
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
    
    @address =@shop.street + ', ' +@shop.city+ ', Polska'
  end

end

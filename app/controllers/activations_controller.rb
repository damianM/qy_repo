# -*- coding: utf-8 -*-
 class ActivationsController < ApplicationController
   
    def new
      @user = User.find_using_perishable_token(params[:activation_code], 1.week)
      #raise Exception if @user.active?
    end

    def create
      @user = User.find(params[:id])

      #raise Exception if @user.active?

      if @user.activate!
        @user.deliver_greeting!
        
        flash[:notice]="Rejestracja zakończona pomyślnie,<br/>Witaj wśród quadomaniaków!"
        redirect_to :controller => "site", :action => "index"
      else
        render :action => :new
      end
    end

  end

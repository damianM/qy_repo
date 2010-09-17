class QuadController < ApplicationController
  def new
    if request.post? and params[:quad]
      @quad = Quad.new(params[:quad])
      @quad.user=curuser
      if @quad.save
        flash[:notice]="Pomyślnie dodano quada"
        redirect_to :controller => "user", :action => "show", :id => curuser.id
      end
    end
  end

  def delete
    if params[:id]
      @quad = Quad.find(params[:id])
      if @quad.rights?(curuser)
        @quad.delete
        @quad.gallery.delete unless @quad.gallery.nil?
        flash[:notice]="Pomyślnie usunięto quada"
        redirect_to session[:prevpage]
      end
      
    end
    
  end

  def edit
    if params[:id]
      @quad = Quad.find(params[:id])

      if request.post? and params[:quad]
        @quad.update_attributes(params[:quad])
        if @quad.save
          flash[:notice]="Pomyślnie zaktualizowano quada"
          redirect_to :controller => "user", :action => "show", :id => curuser.id
        end
      end
    end
    
  end

  def link
    if params[:id]
      @quad = Quad.find(params[:id])
      @galeria=Gallery.create(:name => "Galeria quada #{@quad.company} #{@quad.type}", :quad=>@quad, :user => curuser)
      redirect_to :controller => "gallery", :action => "index", :id => @galeria.id
    end
  end

  def new_quad
    respond_to do |format|

      format.js do

        render :update do |page|
          
         
          page.hide "n_quad"
          page.visual_effect :blind_down, "n_quad"
        end
      end
    end
  end

def delete_quad

    respond_to do |format|

      format.js do

        render :update do |page|

          page.visual_effect :blind_up, "n_quad"
          
          
          
        end
      end
    end
  end

end

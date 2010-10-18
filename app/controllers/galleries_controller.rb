# -*- coding: utf-8 -*-
class GalleriesController < ApplicationController
  before_filter :login_required
  
  def index
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @galleries = @galleriable.galleries
  end

  def new
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.build
  end

  def create
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])

    @gallery = Gallery.new(params[:gallery])
    @gallery.galleriable = @galleriable

    if @gallery.save
      flash[:notice] = "Dodano galerię"
      redirect_to eval("#{@galleriable.class.to_s.downcase}_galleries_path(@galleriable)") 
    else
      flash[:error] = "Galeria nie została dodana"
      render :action => "new"
    end
  end
  
  def edit
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id])
  end
 
  def update
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id])

    return redirect_to root_path unless @gallery.rights? current_user

    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Pomyślnie zmodyfikowano galerię"
      redirect_to eval("#{@galleriable.class.to_s.downcase}_galleries_path(@galleriable)")
    else
      flash[:error] = "Wystąpił błąd podczas edycji galerii"
      render :action => 'edit'
    end
  end
  
  def destroy
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id])

    @gallery.delete
    flash[:notice]="Pomyślnie usunięto galerię"
    redirect_to eval("#{@galleriable.class.to_s.downcase}_galleries_path(@galleriable)")
  end

  def show
    store_location

    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id], :include => [ :photos, :videos ])
  end

  def convert_file(p) #mało przenośne, uwaga windows!
    cd=IMAGE_PATH + "/" + curuser.id.to_s
    Dir.mkdir(cd) unless File.exist?(cd)
    time=(Time.now.to_f*1000).to_i.to_s
    name=cd+"/"+ time + ".png"
    tname=cd+"/t"+time + ".png"
    t80name=cd+"/80_t"+time + ".png"
    gname=cd+"/g"+time + ".png"
    File.open(name,"w"){|w|
      w.write(p.read)
    }
    system("convert #{name} -resize \"96x96>\" #{tname}")
    system("convert #{tname} -colorspace Gray #{gname}")
    system("convert #{name} -resize \"460x460>\" #{name}")
    system("convert #{tname} -resize \"80x80>\" -format 'roundrectangle 1,1 %[fx:w],%[fx:h] 10,10' -write info:tmp.mvg -matte \\( +clone -alpha transparent -background none -fill white -stroke none -strokewidth 0 -draw @tmp.mvg \\) -compose DstIn -composite #{t80name}")
    system("rm tmp.mvg")
    return "data/"+curuser.id.to_s+"/"+time + ".png", "data/"+curuser.id.to_s+"/t"+time + ".png"
  end

end

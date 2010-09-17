class GalleryController < ApplicationController
  before_filter :protect
  IMAGE_PATH="public/images/data"
  def list
    @curuser = curuser
    @user = params[:id].nil? ? @curuser : User.find(params[:id])
    @galleries = format_galleries(@user)

    @user.galleries.collect{|x| x.regenerate_thumb}
    tmp=[]
    while @galleries.length > 0
      tmp << @galleries[0...2]
      @galleries[0...2]=[]
    end
    @galleries= tmp

    if request.post? and params[:gallery]
      @gallery = Gallery.new(params[:gallery])
      @gallery.user = @user
      @gallery.generate_thumb
      if @gallery.save
        flash[:notice]="Dodano galerię"
        redirect_to :controller => "gallery" ,:action => "list"
      end
    end
  end

  
  def elist
    if request.post? and params[:gallery] and params[:id]
      @gallery = Gallery.new(params[:gallery])
      @gallery.event = Event.find(params[:id])
      @gallery.generate_thumb
      if @gallery.save
        flash[:notice]="Dodano galerię"
        redirect_to :controller => "gallery" ,:action => "elist", :id => params[:id]
      else
        flash[:error]="Błąd podczas dodawania galerii"
        redirect_to :controller => "gallery" ,:action => "elist", :id => params[:id]
      end
      return
    else
      @event = Event.find(params[:id])
      @galleries = format_galleries(@event)

      @event.galleries.collect{|x| x.regenerate_thumb}
      tmp=[]
      while @galleries.length > 0
        tmp << @galleries[0...2]
        @galleries[0...2]=[]
      end
      @galleries= tmp


    end
  end

    
  def delete
    @gallery = Gallery.find(params[:id])
    if @gallery.rights?(curuser)
      for photo in @gallery.photos
        photo.remove
        photo.delete
      end
      @gallery.delete
      flash[:notice]="Pomyślnie usunięto galerię"
    else
      flash[:error]="Napotkano błąd"
    end
    redirect_to :action => "list"
  end

  def index
    
    @gallery = Gallery.find(params[:id])
    @photos = (@gallery.photos.nil? ? [] : @gallery.photos) + (@gallery.videos.nil? ? [] : @gallery.videos)
    @photos.sort!{|x,y| x.created_at <=> y.created_at}
    unless @photos.nil?
      tmp=[]
      while @photos.length > 0
        tmp << @photos[0...3]
        @photos[0...3]=[]
      end
      @photos= tmp
    end
    
    if request.post? and params[:photo]
      
      p=params[:photo].clone
      p.delete(:file)
      @photo = Photo.new(p)
      if @photo.image?(params[:photo][:file])
        @photo.gallery=@gallery
        file,thumb = convert_file(params[:photo][:file])
        
        @photo.link=file
        @photo.thumb=thumb
        pr=Prate.new
        pr.photo_id=@photo
        pr.sum=0
        pr.votes=0
        pr.save!
        @photo.prate=pr
        @photo.counter=0
        if @photo.save
          @photo.gallery.regenerate_thumb
          flash[:notice]="Dodano zdjęcie"
          if params[:mark_as_main_photo]
            
            user = curuser
            user.update_attribute("photo", @photo)
            
            user.save
          end
        else
          flash[:error]="problem podczas dodawania zdjęcia"
        end
        redirect_to :action => "index", :id => params[:id]
      else
        flash[:error]="Wysłany plik nie jest zdjęciem"
      end
    end
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

  def edit
    if request.post? and params[:id]
      gallery = Gallery.find(params[:id])
      if(gallery.rights? curuser)
        gallery.update_attributes(params[:gallery])
        if gallery.save
          flash[:notice] = "Pomyślnie zmodyfikowano galerię"
        else
          flash[:error] = "Wystąpił błąd podczas edycji galerii"
        end
      else
        flash[:error] = "Nie możesz edytować tej galerii"
      end
    end
    redirect_to :action => "list"
  end

  def p_unfold
    @gallery = Gallery.find(params[:id])
    if @gallery.nil? or @gallery.user.nil?
      disable = true
    else
      disable = false
    end
    respond_to do |format|

      format.js do

        render :update do |page|


          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_obj"
          page.insert_html :after, "add_obj", :partial => "gallery/add_photo", :locals => {:gallery => params[:id], :disable_mamp => disable}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def v_unfold
    respond_to do |format|

      format.js do

        render :update do |page|


          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_obj"
          page.insert_html :after, "add_obj", :partial => "gallery/add_video", :locals => {:gallery => params[:id]}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def fold
    respond_to do |format|

      format.js do

        render :update do |page|


          page.remove "obj"
          page.visual_effect :blind_down, "add_obj"
        end
      end
    end
  end

  def foldg
    respond_to do |format|

      format.js do

        render :update do |page|


          page.remove "obj"
          page.visual_effect :blind_down, "add_g"
        end
      end
    end
  end

  def g_add
    respond_to do |format|

      format.js do

        render :update do |page|


          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_g"
          page.insert_html :after, "add_g", :partial => "gallery/add_gallery"
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def e_add
    respond_to do |format|

      format.js do

        render :update do |page|


          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_g"
          page.insert_html :after, "add_g", {:partial => "gallery/add_egallery", :locals => {:id => params[:id]}}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def g_edit
    respond_to do |format|

      format.js do

        render :update do |page|

          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_g"
          page.insert_html :after, "add_g", :partial => "gallery/edit_gallery", :locals => {:gallery => params[:id], :cname => Gallery.find(params[:id]).name}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def p_edit
    respond_to do |format|

      format.js do

        render :update do |page|
          
          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_obj"
          page.insert_html :after, "add_obj", :partial => "gallery/edit_photo", :locals => {:photo => params[:id], :cname => Photo.find(params[:id]).description}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def v_edit
    respond_to do |format|

      format.js do

        render :update do |page|

          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_obj"
          page.insert_html :after, "add_obj", :partial => "gallery/edit_video", :locals => {:video => params[:id], :cname => Video.find(params[:id]).description}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end
end

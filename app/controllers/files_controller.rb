class FilesController < ApplicationController
  session :off, :only => :progress
  skip_before_filter :verify_authenticity_token, :only => :progress

  def progress
    render :update do |page|
      @status = Mongrel::Uploads.check(params[:upload_id])
      page << "UploadProgress.update(#{@status[:size]}, #{@status[:received]})" if @status
    end
  end

  def upload
    if request.post? and params[:video]

      v=params[:video].clone
      params[:video].delete(:file)
      if !v[:file] or v[:file].content_type !~ /video/
        flash[:error]="Nieprawidłowy typ pliku"
        redirect_to session[:prevpage]
      else
        @video=Video.new(params[:video])
        vr=Vrate.new
        vr.video_id=@video
        vr.sum=0
        vr.votes=0
        vr.save!
        @video.vrate=vr
        @video.views=0
        @video.gallery=Gallery.find(params[:gid])
        c=@video.convert(v[:file],curuser)
        @video.counter=0
        if c and @video.save
          flash[:notice]="Pomyślnie dodano wideo"
        else
          flash[:error]="Wystąpił błąd"
        end

        #render :text => %(UPLOADED: #{params.inspect}.<script type="text/javascript">window.parent.UploadProgress.finish();</script>)
        redirect_to :controller => "gallery", :action => "index", :id => params[:gid]
      end
    end
  end
end


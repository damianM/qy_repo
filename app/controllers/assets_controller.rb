class AssetsController < ApplicationController
  before_filter :find_asset, :only => [ :destroy, :asset, :download ]
  filter_access_to :all
  
  def create
    params[:asset].merge!(:uploaded_data => params[:uploaded_data])

    if params[:asset_type] == "Image"
      @asset = Image.new(params[:asset])
    elsif params[:asset_type] == "Picture"
      @asset = Picture.new(params[:asset])
    elsif params[:asset_type] == "ForumAttachment"
      @asset = ForumAttachment.new(params[:asset])
    else
      @asset = Attachment.new(params[:asset])
    end

    if @asset.save
      render :json => {
        :success => true,
        :asset_id => @asset.id,
        :message => 'Załącznik został dodany.'
      }, :content_type => 'text/plain'
    else
      render :json => {
        :success => false,
        :message => 'Próba uploadu zalącznika nie powiodła się.'
      }, :content_type => 'text/plain'
    end
  end

  def asset
    render :json => { :success => true, :content => render_to_string(:partial => 'asset', :object => @asset) }
  end

  def download
    send_file "#{RAILS_ROOT}/public/#{@asset.public_filename()}"
  end

  def destroy
    @asset = Asset.find(params[:id])
    if @asset.destroy
      render :json => { :success => true, :id => @asset.id, :message => "Załącznik został pomyslnie usunięty." }
    else
      render :json => { :success => false, :message => "Próba usunięcia załącznika nie powiodła się." }
    end
  end

  protected

  def find_asset
    begin
      @asset = Asset.find_by_id(params[:id])
      raise 'Załącznik nie został odnaleziony.' unless @asset
    rescue Exception => exception
      if request.xhr?
        render :json => { :success => false, :message => exception.message }
      else
        flash[:error] = exception.message
        redirect_to root_path
      end
      return false
    end
  end


end

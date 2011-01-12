class WhatNewsController < ApplicationController

  before_filter :login_required

  layout 'admin'
  # GET /what_news
  # GET /what_news.xml
  def index
    @what_news = WhatNew.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @what_news }
    end
  end

  # GET /what_news/1
  # GET /what_news/1.xml
  def show
    @what_new = WhatNew.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @what_new }
    end
  end

  # GET /what_news/new
  # GET /what_news/new.xml
  def new
    @what_new = WhatNew.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @what_new }
    end
  end

  # GET /what_news/1/edit
  def edit
    @what_new = WhatNew.find(params[:id])
  end

  # POST /what_news
  # POST /what_news.xml
  def create
    @what_new = WhatNew.new(params[:what_new])

    respond_to do |format|
      if @what_new.save
        flash[:notice] = 'WhatNew was successfully created.'
        format.html { redirect_to(what_news_index_path) }
        format.xml  { render :xml => @what_new, :status => :created, :location => @what_new }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @what_new.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /what_news/1
  # PUT /what_news/1.xml
  def update
    @what_new = WhatNew.find(params[:id])

    respond_to do |format|
      if @what_new.update_attributes(params[:what_new])
        flash[:notice] = 'WhatNew was successfully updated.'
        format.html { redirect_to(what_news_index_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @what_new.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /what_news/1
  # DELETE /what_news/1.xml
  def destroy
    @what_new = WhatNew.find(params[:id])
    @what_new.destroy

    respond_to do |format|
      format.html { redirect_to(what_news_url) }
      format.xml  { head :ok }
    end
  end
end

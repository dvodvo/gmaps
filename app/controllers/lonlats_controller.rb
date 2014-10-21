class LonlatsController < ApplicationController
  # GET /lonlats
  # GET /lonlats.json
  def index
    @lonlats = Lonlat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lonlats }
    end
  end

  # GET /lonlats/1
  # GET /lonlats/1.json
  def show
    @lonlat = Lonlat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lonlat }
    end
  end

  # GET /lonlats/new
  # GET /lonlats/new.json
  def new
    @lonlat = Lonlat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lonlat }
    end
  end

  # GET /lonlats/1/edit
  def edit
    @lonlat = Lonlat.find(params[:id])
  end

  # POST /lonlats
  # POST /lonlats.json
  def create
    @lonlat = Lonlat.new(params[:lonlat])

    respond_to do |format|
      if @lonlat.save
        format.html { redirect_to @lonlat, notice: 'Lonlat was successfully created.' }
        format.json { render json: @lonlat, status: :created, location: @lonlat }
      else
        format.html { render action: "new" }
        format.json { render json: @lonlat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lonlats/1
  # PUT /lonlats/1.json
  def update
    @lonlat = Lonlat.find(params[:id])

    respond_to do |format|
      if @lonlat.update_attributes(params[:lonlat])
        format.html { redirect_to @lonlat, notice: 'Lonlat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lonlat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lonlats/1
  # DELETE /lonlats/1.json
  def destroy
    @lonlat = Lonlat.find(params[:id])
    @lonlat.destroy

    respond_to do |format|
      format.html { redirect_to lonlats_url }
      format.json { head :no_content }
    end
  end
end

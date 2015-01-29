class ItinerariosController < ApplicationController
  layout "itinerario", :except => [:new]
#  layout "newItinerario", :only => [:new]


  # GET /itinerarios
  # GET /itinerarios.json
  def index
    @itinerarios = Itinerario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itinerarios }
    end
  end

  # GET /itinerarios/1
  # GET /itinerarios/1.json
  def show
    @itinerario = Itinerario.find(params[:id])
    @lonlats = Lonlat.where(['itinerario_id = ?', params[:id]]).all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itinerario }
    end
  end

  # GET /itinerarios/new
  # GET /itinerarios/new.json
  def new
    @itinerario = Itinerario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itinerario }
    end
  end

  # GET /itinerarios/1/edit
  def edit
    @itinerario = Itinerario.find(params[:id])
  end

  # POST /itinerarios
  # POST /itinerarios.json
  def create
    @itinerario = Itinerario.new(params[:itinerario])
    json = 
    c = Center.new({:lat => json["center"]["lat"], :lng => json["center"]["lng"]})
    o = Overlay.new({:type => json["overlays"]["type"], :title => json["overlays"]["title"], :content => json["overlays"]["content"], :fillColor => json["overlays"]["fillColor"], :fillOpacity => json["overlays"]["fillOpacity"], :strokeColor => json["overlays"]["strokeColor"], :strokeOpacity => json["overlays"]["strokeOpacity"], :strokeWeight => json["overlays"]["strokeWeight"]})
    
    @itinerario.map_from_json = json
    @itinerario.center = c
    @itinerario.overlay = o
    @itinerario.paths = []
    json["paths"][0]["paths"].each do |path|
      @itinerario.paths << Path.new({:lat => path["lat"], :lng => path["lng"]})
    end
    @itinerario.save!


    respond_to do |format|
      if @itinerario.save
        format.html { redirect_to @itinerario, notice: 'Itinerario was successfully created.' }
        format.json { render json: @itinerario, status: :created, location: @itinerario }
      else
        format.html { render action: "new" }
        format.json { render json: @itinerario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itinerarios/1
  # PUT /itinerarios/1.json
  def update
    @itinerario = Itinerario.find(params[:id])
#    @map_data_json = ActiveSupport::JSON.decode(@itinerario.map_from_json)
    @map_data = JSON.parse @itinerario.map_from_json

    respond_to do |format|
      if @itinerario.update_attributes(params[:itinerario])
        @map_data = JSON.parse @itinerario.map_from_json
#        @itinerario.update_attributes(@surface_data)
        format.html { redirect_to @itinerario, notice: 'Itinerario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itinerario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerarios/1
  # DELETE /itinerarios/1.json
  def destroy
    @itinerario = Itinerario.find(params[:id])
    @itinerario.destroy

    respond_to do |format|
      format.html { redirect_to itinerarios_url }
      format.json { head :no_content }
    end
  end
end

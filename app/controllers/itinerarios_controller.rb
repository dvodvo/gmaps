class ItinerariosController < ApplicationController
  layout "itinerario", :except => [:new, :show]
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
#    @lonlats = Lonlat.where(['itinerario_id = ?', params[:id]]).all

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
    json = JSON.parse(params[:itinerario][:map_from_json])
    c = Center.new({:lat => json["center"]["lat"], :lng => json["center"]["lng"]})
    o = Overlay.new({:gmap_type => json["overlays"][0]["type"], :title => json["overlays"][0]["title"], :content => json["overlays"][0]["content"], :fillColor => json["overlays"][0]["fillColor"], :fillOpacity => json["overlays"][0]["fillOpacity"], :strokeColor => json["overlays"][0]["strokeColor"], :strokeOpacity => json["overlays"][0]["strokeOpacity"], :strokeWeight => json["overlays"][0]["strokeWeight"]})
    
    @itinerario.map_from_json = json
    @itinerario.zoom = json["zoom"]
    @itinerario.tilt = json["tilt"]
    @itinerario.map_type_id = json["mapTypeId"]
    @itinerario.center = c
    @itinerario.overlay = o
    @itinerario.paths = []
    json["overlays"][0]["paths"][0].each do |path|
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

    respond_to do |format|
      if @itinerario.update_attributes(params[:itinerario])
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

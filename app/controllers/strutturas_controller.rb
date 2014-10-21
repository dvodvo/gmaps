class StrutturasController < ApplicationController
  # GET /strutturas
  # GET /strutturas.json
  def index
    @strutturas = Struttura.all
    @hash = Gmaps4rails.build_markers(@strutturas) do |struttura, marker|
      marker.lat struttura.latitude
      marker.lng struttura.longitude
      marker.infowindow struttura.servizi
      marker.picture({
        "url" => "http://images.1-to-x.com/locationPointer.png",
        "width" =>  12,
        "height" => 20
      })
      marker.json({ title: struttura.nome })
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @strutturas }
    end
  end

  # GET /strutturas/1
  # GET /strutturas/1.json
  def show
    @struttura = Struttura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @struttura }
    end
  end

  # GET /strutturas/new
  # GET /strutturas/new.json
  def new
    @struttura = Struttura.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @struttura }
    end
  end

  # GET /strutturas/1/edit
  def edit
    @struttura = Struttura.find(params[:id])
  end

  # POST /strutturas
  # POST /strutturas.json
  def create
    @struttura = Struttura.new(params[:struttura])

    respond_to do |format|
      if @struttura.save
        format.html { redirect_to @struttura, notice: 'Struttura was successfully created.' }
        format.json { render json: @struttura, status: :created, location: @struttura }
      else
        format.html { render action: "new" }
        format.json { render json: @struttura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /strutturas/1
  # PUT /strutturas/1.json
  def update
    @struttura = Struttura.find(params[:id])

    respond_to do |format|
      if @struttura.update_attributes(params[:struttura])
        format.html { redirect_to @struttura, notice: 'Struttura was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @struttura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strutturas/1
  # DELETE /strutturas/1.json
  def destroy
    @struttura = Struttura.find(params[:id])
    @struttura.destroy

    respond_to do |format|
      format.html { redirect_to strutturas_url }
      format.json { head :no_content }
    end
  end
end

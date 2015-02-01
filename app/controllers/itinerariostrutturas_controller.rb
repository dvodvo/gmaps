class ItinerariostrutturasController < ApplicationController
  # GET /itinerariostrutturas
  # GET /itinerariostrutturas.json
  def index
    @itinerariostrutturas = Itinerariostruttura.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itinerariostrutturas }
    end
  end

  # GET /itinerariostrutturas/1
  # GET /itinerariostrutturas/1.json
  def show
    @itinerariostruttura = Itinerariostruttura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itinerariostruttura }
    end
  end

  # GET /itinerariostrutturas/new
  # GET /itinerariostrutturas/new.json
  def new
    @itinerariostruttura = Itinerariostruttura.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itinerariostruttura }
    end
  end

  # GET /itinerariostrutturas/1/edit
  def edit
    @itinerariostruttura = Itinerariostruttura.find(params[:id])
  end

  # POST /itinerariostrutturas
  # POST /itinerariostrutturas.json
  def create
    @itinerariostruttura = Itinerariostruttura.new(params[:itinerariostruttura])

    respond_to do |format|
      if @itinerariostruttura.save
        format.html { redirect_to @itinerariostruttura, notice: 'Itinerariostruttura was successfully created.' }
        format.json { render json: @itinerariostruttura, status: :created, location: @itinerariostruttura }
      else
        format.html { render action: "new" }
        format.json { render json: @itinerariostruttura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itinerariostrutturas/1
  # PUT /itinerariostrutturas/1.json
  def update
    @itinerariostruttura = Itinerariostruttura.find(params[:id])

    respond_to do |format|
      if @itinerariostruttura.update_attributes(params[:itinerariostruttura])
        format.html { redirect_to @itinerariostruttura, notice: 'Itinerariostruttura was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itinerariostruttura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerariostrutturas/1
  # DELETE /itinerariostrutturas/1.json
  def destroy
    @itinerariostruttura = Itinerariostruttura.find(params[:id])
    @itinerariostruttura.destroy

    respond_to do |format|
      format.html { redirect_to itinerariostrutturas_url }
      format.json { head :no_content }
    end
  end
end

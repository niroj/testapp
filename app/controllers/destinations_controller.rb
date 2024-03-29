class DestinationsController < ApplicationController
  # GET /destinations
  # GET /destinations.json
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @destinations = Destination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    @destination = Destination.find(params[:id])
    @reviews = @destination.reviews

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @destination }
      format.js
    end
  end

  # GET /destinations/new
  # GET /destinations/new.json
  def new
    @destination = Destination.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @destination }
    end
  end

  # GET /destinations/1/edit
  def edit
    @destination = Destination.find(params[:id])

    if @destination.user != current_user
      redirect_to destinations_path
      flash[:alert] = "You Are not authorized to do this action"
    end

  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = current_user.destinations.new(params[:destination])


    respond_to do |format|
      if @destination.save
        if params[:destination][:photo].present?
          render :template =>"destinations/crop"  and return

        else
        format.html { redirect_to destinations_path, notice: 'Destination was successfully created.' }
        format.json { render json: @destination, status: :created, location: @destination }
       end
      else
        format.html { render action: "new" }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /destinations/1
  # PUT /destinations/1.json
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
         if params[:destination][:photo].present?
            render :template =>"destinations/crop"  and return

          else
          format.html { redirect_to destinations_path, notice: 'Destination was successfully updated.' }
          format.js { render json: @destination, status: :created, location: @destination }
         end

      else
        format.html { render action: "edit" }
        format.json { render json: @destination.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination = Destination.find(params[:id])
    if @destination.user != current_user
      redirect_to destinations_path
      flash[:alert] = "You Are not authorized to do this action"
    else
      @destination.destroy
      respond_to do |format|
        format.html { redirect_to destinations_url }
        format.json { head :ok }
      end
    end
  end
end

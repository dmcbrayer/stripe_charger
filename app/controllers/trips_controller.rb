class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        flash[:success] = 'Trip was successfully created.'
        format.html { redirect_to @trip}
        format.json { render :show, status: :created, location: @trip }
      else
        flash[:danger] = 'Trip could not be created.'
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        flash[:success] = 'Trip was successfully updated.'
        format.html { redirect_to @trip }
        format.json { render :show, status: :ok, location: @trip }
      else
        flash[:danger] = 'Trip could not be updated.'
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip.destroy
    respond_to do |format|
      flash[:success] = 'Trip was successfully destroyed.' 
      format.html { redirect_to trips_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:title, :leader, :start_date, :end_date, :price)
    end
end

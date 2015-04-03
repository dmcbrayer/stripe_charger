class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]
  before_action :set_trip, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @attendees = @trip.attendees.all
  end

  def show
  end

  def new
    @attendee = @trip.attendees.new
  end

  def edit
  end

  def create
    @attendee = @trip.attendees.new(attendee_params)

    if @attendee.valid?
      begin
        @attendee.charge_stripe(params[:amount], params)
      rescue Stripe::CardError => e
        flash.now[:danger] = e.message
        render :new and return
      end
    end

    respond_to do |format|
      if @attendee.save
        flash[:success] = "You successfully signed up!"
        format.html { redirect_to root_url }
      else
        flash.now[:danger] = "Something went wrong with your registration.  Don't worry, we didn't charge your card."
        format.html { render :new }
      end
    end
  end

  def update

    respond_to do |format|
      if @attendee.update(attendee_params)
        flash[:success] = "Attendee was successfully updated."
        format.html { redirect_to root_url}
      else
        flash[:danger] = "Attendee could not be updated."
        format.html { render :new }
      end
    end
  end

  def destroy
    @attendee.destroy
    respond_to do |format|
      flash[:success] = "Attendee was destroyed.  Utterly."
      format.html { redirect_to trips_url}
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:name, :email, :phone, :trip_id)
    end

end

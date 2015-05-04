class TripMailer < ActionMailer::Base
  default from: "private-trips@vestigo.co"

  def notify_admin(trip)
    @trip = trip
    @url = "https://vestigo.herokuapp.com/trips/#{@trip.id}"
    mail(to: ["daniel@vestigo.co", "marshall@vestigo.co"])
  end
end

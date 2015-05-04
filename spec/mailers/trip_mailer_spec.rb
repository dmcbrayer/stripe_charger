require "rails_helper"

RSpec.describe TripMailer, :type => :mailer do

  let(:trip) {FactoryGirl.create :trip}
  
  describe 'notify admin' do
    let(:mail) {TripMailer.notify_admin(trip)}

    it 'renders the mail to me and marshall' do
      expect(mail.to).to eql(["daniel@vestigo.co","marshall@vestigo.co"])
    end

    it 'sends from private-trips' do
      expect(mail.from).to eql(['private-trips@vestigo.co'])
    end

    it 'contains the right content' do
      expect(mail.body).to include("https://vestigo.herokuapp.com/trips/#{trip.id}")
    end
  end
end

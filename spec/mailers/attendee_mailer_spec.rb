require "rails_helper"

RSpec.describe AttendeeMailer, :type => :mailer do
  describe 'instructions /' do
  	let!(:leader) {FactoryGirl.create :leader}
  	let(:trip) {FactoryGirl.create :trip}
  	let(:attendee) {trip.attendees.create(FactoryGirl.attributes_for :attendee)}

  	describe 'first message /' do
  		let(:mail) {AttendeeMailer.first_message(attendee)}

  		it 'renders the subject' do
  			expect(mail.subject).to eql("First sign up on the trip to #{attendee.trip.title}")
  		end

  		it 'renders the receiver emails' do
	      expect(mail.to).to eql(["daniel@vestigo.co","marshall@vestigo.co", attendee.trip.get_leader.email])
	    end
	 
	    it 'renders the sender email' do
	      expect(mail.from).to eql(['no-reply@vestigo.co'])
	    end

      it 'has the attachment' do
        expect(mail.attachments.count).to eq 1
      end

      it 'has the right attachment' do
        expect(mail.attachments[0].filename).to eql("Waiver.pdf")
      end
	 
  	end

  	describe 'new sign up' do
  		let(:mail) {AttendeeMailer.new_sign_up_message(attendee)}

  		it 'renders the subject' do
  			expect(mail.subject).to eql("New sign up on the trip to #{attendee.trip.title}")
  		end

  		it 'renders the receiver emails' do
	      expect(mail.to).to eql(["daniel@vestigo.co","marshall@vestigo.co", attendee.trip.get_leader.email])
	    end
	 
	    it 'renders the sender email' do
	      expect(mail.from).to eql(['no-reply@vestigo.co'])
	    end

      it 'contains the right content' do
        expect(mail.body).to include("Sweet!")
      end
  	end

  	describe 'attendee email' do
  		pending #some code that takes Mandrill's API into account
  	end
  end
end

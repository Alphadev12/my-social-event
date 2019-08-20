class ParticipationsController < ApplicationController
	def index
		event_id = params[:event_id]
		@event = Event.find(event_id)
	end

	def new
		event_id = params[:event_id]
		@event = Event.find(event_id)
	end

	def create
	# Amount in cents
		event_id = params[:event_id]
		@event = Event.find(event_id)
		
		@amount = 500
		
		customer = Stripe::Customer.create({
			email: params[:stripeEmail],
			source: params[:stripeToken],
		})
		
		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @amount,
			description: 'Rails Stripe customer',
			currency: 'usd',
		})

		participation = Attendance.new

		participation.stripe_customer_id = customer.id
		participation.event = @event
		participation.attendee = current_user

		if participation.save
			flash[:success] = "Félicitation, vous participez à l'évenement"
			redirect_to @event
		else
			render :new
		end

		# puts participation.errors
		# @event.attendees << current_user
		rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end
end
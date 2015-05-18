#encoding: utf-8
class DonationsController < ApplicationController
	include DonationsHelper
	def index

	end

	def new_donation

	end

	def create
		member = Member.find_by_email(params[:member][:email])
		donation = Donation.new
		if !member.nil?
			donation.member = member
		end

		donation.amount = params[:donation][:amount].tr('.-','')
		donation.receipt = norm_rut(params[:member][:rut])
		donation.email = params[:member][:email]
		donation.date_received = Time.now.strftime("%d/%m/%Y")

			if donation.save
				AdminMailer.thanks_donation(donation.email).deliver
				 redirect_to thank_you_donation_path(:notice => "¡Gracias por tu donación!") 
		    else
		        render action: "new_donation" 
		    end
	end

	def thank_you_donation
		@notice = params[:notice]
	end

end
class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
		user = User.new(name: params[:registration][:name], last_name: params[:registration][:last_name],
			email: params[:registration][:email], phone: params[:registration][:phone], password: params[:registration][:password],
address: params[:registration][:address])
		if user.save
			flash[:notice] = "Te has registrado correctamente"
			redirect_to root_path
		else
			flash[:notice] = "Datos incorrectos, no se registró"
			redirect_to registration_path
		end
	end
end

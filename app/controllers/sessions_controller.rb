class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.where(email: params[:session][:email],password: params[:session][:password])[0]
		if user != nil
			flash[:notice] = "Loggeado correctamente"
			session[:current_user_id] = user.id
			cookies["logged"] = user.id
			redirect_to "/users/"+String(user.id)
		else
			flash[:notice] = "Datos incorrectos"
			redirect_to root_path
		end
	end

	def destroy
		#complete this method
		session[:current_user_id] = nil
		flash[:notice] = "Has cerrado sesion"
	end
end

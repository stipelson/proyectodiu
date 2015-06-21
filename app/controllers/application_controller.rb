class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :set_locale

	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options(options={})
		{ locale: I18n.locale }
	end

	private

	def get_login
			#Verifica si el usuario está logueado. Primero pregunta si existe la session[:logueado] y además que este sea true, si existe devuelve la sesión sino existe devuelve false.
			if defined?(session[:logueado]) and session[:logueado]
				 #Está logueado.
				 return session;
				else
				 #No está logueado.
				 return false;
				end
			end

			def sesion_identi
				@sesion = get_login();
				if @sesion
					@current_nombre = @sesion[:nombre];
					@current_nombre.capitalize!
					@permiso_admin = @sesion[:admin];
					@current_user_id = @sesion[:usuario_id]
					return true;
				else
					return false;
			#redirect_to :controller => "login", :action => "iniciar_sesion";
		end
	end

end

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

	def notificaciones
		@current_user = User.find(@current_user_id)

		@articles = Article.where(:user => @current_user).order('created_at DESC');
		@petitions = Petition.all
	      # peticiones cuando los articulos que son iguales a el articulod e la peticion
	      @petitionesQueMeHacen = Petition.where(article: @articles)
	      # peticiones cuando el user de la peticion soy yo osea que hice
	      @petitionesQueHice = Petition.where(user: @current_user)


	      @contadorNotificaciones = 0

	      @contadorSolicitudes = 0


	      	@petitionesQueMeHacen.each do |petition|
	      		if petition.article.busca == true
	      			if petition.aprobado == nil
	      				@contadorNotificaciones += 1
	      			end
	      		else
	      			if petition.aprobado == nil
	      				@contadorSolicitudes += 1
	      			end
	      		end

	      	end



	      	@petitionesQueHice.each do |petition|
	      		if defined? petition.article.busca and petition.article.busca == false
	      			if petition.aprobado == true
	      				@contadorSolicitudes += 1
	      			end
	      		end
	      	end



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

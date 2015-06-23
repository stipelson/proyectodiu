class ArticlesController < ApplicationController
	before_action :find_article, only:[:show, :edit, :update, :destroy]

	def index
		if permiso_admin();
			@articles = Article.all.order("created_at DESC")
			notificaciones()
		else
			redirect_to objetos_path(1);
		end
	end

	def show

		if logueado()
			notificaciones()
			@user = User.find(@current_user_id)
			@peticiones = Petition.where(user: @user, article: @article)
		else
			@peticiones = {}
		end



	end

	def new

		if logueado()
			notificaciones()
			@user = User.find(@current_user_id)
			@categories = Category.all()
			@article = Article.new();
		else
			redirect_to new_user_path;
		end

	end

	def  create
		if logueado()
			@user = User.find(@current_user_id)
			@categories = Category.all()
		#@articlesdf = Article.find(params[:article_id])
		 #@comment = @articleasd.comments.create(comment_params)

		 @article = @user.articles.create(article_params)


		 if @article.save()
		 	redirect_to root_path, :notice => "green&El objeto ha sido subido";
		 else
		 	render "new";
		 end
		else
			redirect_to root_path;
		end

	end


	def destroy

		if permiso_admin();
			@article = Article.find(params[:id]);
			if @article.destroy()
				redirect_to articles_path, :notice => "red&El objeto ha sido eliminado";
			else
				redirect_to articles_path, :notice => "red&El objeto NO ha podido ser eliminado";
			end
		else
			redirect_to root_path;
		end

	end

	def find
		if logueado()
		notificaciones()
		end
		@categories = Category.all
		@loguin = logueado();
		@count= 0
		@articles = Article.where(nombre: params[:busqueda])
	end


	def edit
		    logueado();
		    notificaciones()
		    @categories = Category.all();
		    @article = Article.find(params[:id]);
		    @nombre = @article.nombre;
		    @marca = @article.marca;
		    @color = @article.color;
		    @descripcion = @article.descripcion;
		    @lugar = @article.lugar;
		    @category_id = @article.category_id	;
		    @user_id = @article.user_id;
				@busca = @article.busca;
	end

		def update
		logueado();
		if @article.update(article_params)
			@nombre_a = params[:article][:nombre];
			redirect_to articles_path, :notice => "green&El objeto #{@nombre_a} ha sido actualizado"
		else
			render "edit";
		end
	end

	private



	def regular
		if sesion_identi() and (!defined?(@permiso_admin) or !@permiso_admin)
			return true;
		else
			return false;
		end
	end

	def permiso_admin
		if sesion_identi() and defined?(@permiso_admin) and @permiso_admin
			return true;
		else
			return false;
		end
	end

	def logueado
		if sesion_identi()
			return true;
		else
			return false;
		end
	end



	def article_params
		params.require(:article).permit(:nombre, :marca, :color, :descripcion, :lugar, :category_id, :photo, :busca)
	end

	def find_article
		logueado()
		@article = Article.find(params[:id])
	end


end

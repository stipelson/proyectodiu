class InicioController < ApplicationController
	def bienvenido
		@loguin = logueado();
		@count= 0
		@countTwo = 0
		@current_pagina = 1
		@articles = Article.all.order("created_at DESC")
		@categories = Category.all.order("created_at ASC")
		@categoriesFour = @categories.first(4)
		respond_to do |format|
			format.html
			format.json
		end


	end

	def selection
		if params[:categoria]
			@loguin = logueado();
			@categories = Category.all.order("created_at ASC")
			@count= 0
			@category = Category.find(params[:categoria]);
			@articles = Article.all.order("created_at ASC")
		else
			redirect_to root_path;
		end
	end

	def selection_tipe
		if params[:tipo]
			@loguin = logueado();
			@categories = Category.all.order("created_at ASC")
			@count= 0
			@articles = Article.all
			if params[:tipo] == '1'
				@busca = 't'
			else
				@busca = 'f'
			end
			@articlesBuscados = Article.where("busca = '#{@busca}'").order("created_at ASC")
		else
			redirect_to root_path;
		end
	end

	private

	def logueado
		if sesion_identi() and defined?(@current_user_id)
			return true;
		else
			return false;
		end
	end
end

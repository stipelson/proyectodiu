class InicioController < ApplicationController
	def bienvenido
		@loguin = logueado();
		@count= 0
		@current_pagina = 1

		@articles = Article.all.order("created_at ASC")
		@categories = Category.all.order("created_at ASC")


	end

	def selection
		@loguin = logueado();
		@categories = Category.all.order("created_at ASC")
		@count= 0
		@category = Category.find(params[:id]);
		@articles = Article.all.order("created_at ASC")
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

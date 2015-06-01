class InicioController < ApplicationController
  def bienvenido
    @loguin = logueado();
    @count= 0
    @current_pagina = 1
    @articles = Article.all()
    @categories = Category.all.order("created_at ASC")
  end

  def selection

    @category = Category.find(params[:id])

    @articles = Article.where(category_id: @category.id );

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

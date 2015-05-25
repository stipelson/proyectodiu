class InicioController < ApplicationController
  def bienvenido
      	@loguin = logueado();

  	@current_pagina = 1
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

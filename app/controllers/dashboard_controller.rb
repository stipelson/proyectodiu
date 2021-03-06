class DashboardController < ApplicationController

	def index
    #hace referencia a los objetos que subi a la plataforma como encontrados
    if logueado()
      # 1 para la pagina de objetos subidos, 2 para la pagina de encontrados
      @pagina = ""+params[:id];
      notificaciones()

    else
    	redirect_to root_path;
    end

  end

  def solicitados
    #hace referencia a los objetos que solicite como mios y que encontre en la plataforma
    if logueado()

    else
    	redirect_to root_path;
    end
  end

  def noaprob
  	if logueado()
  		@petition = Petition.find(params[:id])
  		@petition.aprobado = 1
  		@petition.solicitado_a = 0

  		if @petition.update(petition_params)
  			redirect_to objetos_path(3), :notice => "yellow&La peticion fue marcada como no aprobada aprobada"
  		else
  			render "index";
  		end
  	else
  		redirect_to root_path;
  	end
  end

  def aprob
  	if logueado()
  		@petition = Petition.find(params[:id])
  		@petition.aprobado = 1
  		@petition.solicitado_a = 1

  		if @petition.update(petition_params)
  			redirect_to objetos_path(3), :notice => "green&La peticion fue aprbada"
  		else
  			render "index";
  		end
  	else
  		redirect_to root_path;
  	end
  end

  def aprobenviado
  	if logueado()
  		@petition = Petition.find(params[:id])
  		@petition.aprobado = 0

  		if @petition.update(petition_params)
  			redirect_to objetos_path(3)
  		else
  			render "index";
  		end
  	else
  		redirect_to root_path;
  	end
  end

  def aprobencontrado
  	  	if logueado()
  		@petition = Petition.find(params[:id])
  		@petition.aprobado = 1

  		if @petition.update(petition_params)
  			redirect_to objetos_path(4)
  		else
  			render "index";
  		end
  	else
  		redirect_to root_path;
  	end
  end


  private

  def petition_params
  	params.permit(:razon, :encontrado_a, :solicitado_a, :busca, :aprobado)
  end

  def logueado
  	if sesion_identi()
  		return true;
  	else
  		return false;
  	end
  end

end

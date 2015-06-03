class DashboardController < ApplicationController

  def index
    #hace referencia a los objetos que subi a la plataforma como encontrados
    if logueado()
      # 1 para la pagina de objetos subidos, 2 para la pagina de encontrados
      @pagina = ""+params[:id];
      @user = User.find(@current_user_id)
      @articles = Article.where(:user => @user).order('created_at DESC');
      @petitions  = Petition.all
      @petitionsDeMios = Petition.where(article: @articles)

      @petitionsDeOtros = Petition.where(user: @user)
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


  private

  def logueado
    if sesion_identi()
      return true;
    else
      return false;
    end
  end

end

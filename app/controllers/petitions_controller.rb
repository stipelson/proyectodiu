class PetitionsController < ApplicationController

  def index

  end

  def new
    if logueado()
			@user = User.find(@current_user_id)

      @article = Article.find(params[:article_id])
      @petition = Petition.new

		else
			redirect_to new_user_path;
		end
  end

  def create

    if logueado()
      @user = User.find(@current_user_id)
      if defined? params[:article_id]
      @article = Article.find(params[:article_id])
    #@articlesdf = Article.find(params[:article_id])
     #@comment = @articleasd.comments.create(comment_params)

     @petition = Petition.new(petition_params)
     @petition.article = @article
     @petition.user = @user


     if @petition.save()
       redirect_to root_path, :notice => "green&La solicitud ha sido enviada";
     else
       render "new";
     end
    else
      redirect_to root_path;
    end

  end
end


  def show

  end

  private

  def logueado
		if sesion_identi()
			return true;
		else
			return false;
		end
	end


	def petition_params
		params.require(:petition).permit(:razon, :encontrado_a, :solicitado_a)
	end

end

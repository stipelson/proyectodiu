class ArticlesController < ApplicationController
    before_action :find_article, only:[:show, :edit, :update, :destroy]

    def index
        @articles = Article.all.order("created_at DESC")
    end

    def new

        if logueado()
            @user = User.find(@current_user_id)
            @categories = Category.all()
            @article = Article.new();
        else
            redirect_to root_path;
        end

    end

    def  create
        if logueado()

            @user = User.find(@current_user_id)

    #@articlesdf = Article.find(params[:article_id])
     #@comment = @articleasd.comments.create(comment_params)

     @article = @user.articles.create(article_params)

     if @article.save()
        redirect_to root_path, :notice => "success&El producto  ha sido creado";
    else
        render "new";
    end
else
    redirect_to root_path;
end

end



def edit

end

private

def logueado
    if sesion_identi()
       return true;
   else
       return false;
   end
end

def article_params
    params.require(:article).permit(:nombre, :marca, :color, :descripcion, :lugar, :category_id)
end

def find_article
    @article = Article.find(params[:id])
end


end

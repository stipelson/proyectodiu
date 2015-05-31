class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    if permiso_admin();
    	@users = User.all()
        if params[:tipo];
          @tipo = params[:tipo];
        end
    else
      redirect_to :controller => "inicio", :action => "bienvenido";
    end
  end

  def show
    if regular() or permiso_admin();
  	 @user = User.find(params[:id]);
    else
     redirect_to :controller => "inicio", :action => "bienvenido";
    end
  end

  def new
    if regular();
           redirect_to :controller => "inicio", :action => "bienvenido";
    else
      @user = User.new();
    end
  end

  def edit
    logueado();
    @user = User.find(params[:id]);
      @nombre = @user.nombre;
      @apellido = @user.apellido;
      @usuario = @user.usuario;
      @password = @user.password;
      @correo = @user.correo;
      @admin = @user.admin;
  end

  def create
   logueado();

   @user = User.new(user_params)
   if @user.save()
      @nombre_u = params[:user][:nombre];
      redirect_to users_path, :notice => "green&El usuario #{@nombre_u} ha sido creado";
   else
      render "new";
   end

  end

  def update
    logueado();

    if @user.update(user_params)
      @nombre_u = params[:user][:nombre];
      redirect_to users_path, :notice => "green&El usuario #{@nombre_u} ha sido actualizado"
   else
      render "edit";
   end
  end

  def destroy
    if permiso_admin();
      @user = User.find(params[:id]);
      if @user.destroy()
        redirect_to users_path, :notice => "red&El usuario ha sido eliminado";
      else
        redirect_to users_path, :notice => "red&El usuario NO ha podido ser eliminado";
      end
    else
     redirect_to :controller => "inicio", :action => "bienvenido";
    end



  end

  private

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nombre,:apellido, :usuario, :password, :correo, :admin)
  end


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

end

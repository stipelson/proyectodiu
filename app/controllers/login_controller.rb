class LoginController < ApplicationController
  def iniciar_sesion
    @error_login = false;
    @noperfil = false;

	@sesion = get_login();

    if @sesion == false

        if request.post?

          #Verifica si el nombre de usuario y la contraseña son correctos.
         if login(params[:usuario], params[:password])
             #Los datos son correctos así que redirecciona a la página de bienvenida.
             redirect_to :controller => "inicio", :action => "bienvenido";
         else
             #Los datos son incorrectos así que setea la variable @error_login a true para mostrar el error por pantalla.
             @error_login = true;
         end

       end
    else
     #Verifica si se ha enviado el formulario.
       redirect_to :controller => "inicio", :action => "bienvenido";
    end
  end


  def cerrar_sesion

    @sesion = get_login();
    if @sesion

      logout();
    else
      redirect_to :controller => "login", :action => "iniciar_sesion";
    end
  end


private

 def login(usuario, pass)
      #Verifica que el nombre de usuario y la contraseña sean correctos

      if @user = User.find_by(usuario: usuario, password: pass)
         #Los datos son correctos entonces crea la sesión y devuelve true.
         session[:logueado] = true;
         session[:nombre] =  @user.nombre;
         session[:admin] = @user.admin;
         session[:usuario_id] = @user.id;
         return true;
     else
         #Los datos no son correctos entonces devuelve false.
         return false;
     end
 end
 def logout
      #Desloguea al usuario.
      session[:logueado] = false;
      session[:nombre] = nil;
      session[:admin] = nil;
      session[:usuario_id] = nil;
      @sesion = false;
  end
end

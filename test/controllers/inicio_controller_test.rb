require 'test_helper'

class InicioControllerTest < ActionController::TestCase
  test "should get bienvenido" do
    get :bienvenido
    assert_response :success
  end

end

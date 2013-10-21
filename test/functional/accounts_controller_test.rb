require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

  setup do
    @request.env["omniauth.auth"] = {
                  "provider"=>"vkontakte",
                  "uid"=>"1",
                  "info"=>
                  {
                    "name"=>"Павел Дуров",
                    "nickname"=>"",
                    "first_name"=>"Павел",
                    "last_name"=>"Дуров",
                    "image"=>"http://cs7001.vk.me/c7003/v7003079/374b/53lwetwOxD8.jpg",
                    "location"=>"Росiя, Санкт-Петербург",
                    "urls"=>{"Vkontakte"=>"http://vk.com/durov"}
                  },
                  "credentials"=>
                    {
                      "token"=>"187041a618229fdaf16613e96e1caabc1e86e46bbfad228de41520e63fe45873684c365a14417289599f3",
                      "expires_at"=>1381826003,
                      "expires"=>true
                    },
                  "extra"=>
                  {
                    "raw_info"=>
                      {
                        "id"=>1,
                        "first_name"=>"Павел",
                        "last_name"=>"Дуров",
                        "sex"=>2,
                        "nickname"=>"",
                        "screen_name"=>"durov",
                        "bdate"=>"10.10.1984",
                        "city"=>"2",
                        "country"=>"1",
                        "photo"=>"http://cs7001.vk.me/c7003/v7003079/374b/53lwetwOxD8.jpg",
                        "photo_big"=>"http://cs7001.vk.me/c7003/v7003736/3a08/mEqSflTauxA.jpg",
                        "online"=>1,
                        "online_app"=>"3140623",
                        "online_mobile"=>1
                      }
                  }
                }
  end

  test "should login" do
    get :login
    assert_not_nil session[:account_id]
    assert_redirected_to :root
  end

  test "should route login" do
    assert_routing '/accounts/login', {controller: "accounts", action: "login"}
  end

  test "should get logout" do
    get :logout
    assert_nil session[:account_id]
    assert_redirected_to :root
  end

  test "should route logout" do
    assert_routing '/accounts/logout', {controller: "accounts", action: "logout"}
  end

end

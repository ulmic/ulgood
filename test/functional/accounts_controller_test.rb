require 'test_helper'
require 'fixtures/providers'
class AccountsControllerTest < ActionController::TestCase

  include OmniauthTest

  test "should login vkontakte" do
    @request.env["omniauth.auth"] = oauth "vkontakte"
    get :login
    assert_not_nil session[:account_id]
    assert_not_nil current_user.accounts.find(session[:account_id])
    assert_redirected_to :root
  end

  test "should login facebook" do
    @request.env["omniauth.auth"] = oauth "facebook"
    get :login
    assert_not_nil session[:account_id]
    assert_not_nil current_user.accounts.find(session[:account_id])
    assert_redirected_to :root
  end

  test "should login twitter" do
    @request.env["omniauth.auth"] = oauth "twitter"
    get :login
    assert_not_nil session[:account_id]
    assert_not_nil current_user.accounts.find(session[:account_id])
    assert_redirected_to :root
  end

  test "should login google" do
    @request.env["omniauth.auth"] = oauth "google"
    get :login
    assert_not_nil session[:account_id]
    assert_not_nil current_user.accounts.find(session[:account_id])
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

require 'test_helper'

class MainControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_template :home
    assert_template layout: "layouts/not_logged"
  end

  test "should redirect if signed in" do
    account = FactoryGirl.create :account
    account_sign_in(account)
    get :home
    assert_redirected_to controller: "goods", action: "index"
  end

  test "should route to home" do
    assert_routing '/', {controller: "main", action: "home"}
  end

end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    account = FactoryGirl.create :account
    account_sign_in(account)
  end

  test "should get show" do
    get :show, id: current_user.id
    assert_response :success
    assert_template :show
    assert_template layout: "layouts/application"
  end

  test "should route to show" do
    assert_routing '/users/1', {controller: "users", action: "show", id: "1"}
  end

end

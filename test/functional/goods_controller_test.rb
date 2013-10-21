require 'test_helper'

class GoodsControllerTest < ActionController::TestCase

  setup do
    account = FactoryGirl.create :account
    account_sign_in(account)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template layout: "layouts/application"
    assert_template :index
  end

  test "should route index" do
    assert_routing '/goods', {controller: "goods", action: "index"}
  end

  test "should create good" do
    post :create, good: { text: 'Этот тест прошёлся!'}
    assert_redirected_to controller: "users", action: "show", id: current_user.id
  end

end
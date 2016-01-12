require 'test_helper'

class FinalisingsControllerTest < ActionController::TestCase
  setup do
    @finalising = finalisings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finalisings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finalising" do
    assert_difference('Finalising.count') do
      post :create, finalising: { coop_id: @finalising.coop_id, final_date: @finalising.final_date }
    end

    assert_redirected_to finalising_path(assigns(:finalising))
  end

  test "should show finalising" do
    get :show, id: @finalising
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finalising
    assert_response :success
  end

  test "should update finalising" do
    patch :update, id: @finalising, finalising: { coop_id: @finalising.coop_id, final_date: @finalising.final_date }
    assert_redirected_to finalising_path(assigns(:finalising))
  end

  test "should destroy finalising" do
    assert_difference('Finalising.count', -1) do
      delete :destroy, id: @finalising
    end

    assert_redirected_to finalisings_path
  end
end

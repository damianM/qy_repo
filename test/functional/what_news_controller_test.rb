require 'test_helper'

class WhatNewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:what_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what_new" do
    assert_difference('WhatNew.count') do
      post :create, :what_new => { }
    end

    assert_redirected_to what_new_path(assigns(:what_new))
  end

  test "should show what_new" do
    get :show, :id => what_news(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => what_news(:one).to_param
    assert_response :success
  end

  test "should update what_new" do
    put :update, :id => what_news(:one).to_param, :what_new => { }
    assert_redirected_to what_new_path(assigns(:what_new))
  end

  test "should destroy what_new" do
    assert_difference('WhatNew.count', -1) do
      delete :destroy, :id => what_news(:one).to_param
    end

    assert_redirected_to what_news_path
  end
end

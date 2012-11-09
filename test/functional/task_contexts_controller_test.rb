require 'test_helper'

class TaskContextsControllerTest < ActionController::TestCase
  setup do
    @task_context = task_contexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_contexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_context" do
    assert_difference('TaskContext.count') do
      post :create, task_context: @task_context.attributes
    end

    assert_redirected_to task_context_path(assigns(:task_context))
  end

  test "should show task_context" do
    get :show, id: @task_context.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_context.to_param
    assert_response :success
  end

  test "should update task_context" do
    put :update, id: @task_context.to_param, task_context: @task_context.attributes
    assert_redirected_to task_context_path(assigns(:task_context))
  end

  test "should destroy task_context" do
    assert_difference('TaskContext.count', -1) do
      delete :destroy, id: @task_context.to_param
    end

    assert_redirected_to task_contexts_path
  end
end

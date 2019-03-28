require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    get categories_path #get :index on Rails 4
    assert_response :success
  end

  test "should get new" do
    get new_category_path # get :new on Rails 4
    assert_response :success
  end

  test "should get show" do
    get category_path(@category) #Rails4 = get(:show, {'id' => @category.id})
    assert_response :success
  end
end

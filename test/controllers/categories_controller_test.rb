require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "Jesus", email: "jesus@example.com", password: "passwd", admin: true)
  end

  test "should get categories index" do
    get categories_path #get :index on Rails 4
    assert_response :success
  end

  test "should get new" do
    #session[:user_id] = @user.id #Rails4
    sign_in_as(@user, "passwd")
    get new_category_path # get :new on Rails 4
    assert_response :success
  end

  test "should get show" do
    get category_path(@category) #Rails4 = get(:show, {'id' => @category.id})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params:{category:{name:"sex"}}
      #post :create, category: {name:"sports"} #Rails4
    end
    assert_redirected_to categories_path
  end
end

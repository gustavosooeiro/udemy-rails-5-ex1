require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Jesus", email: "jesus@example.com", password: "passwd", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@user,"passwd")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params:{category:{name:"sports"}} # Rails4: post_via_redirect categories_path, category: {name: "sports"}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    sign_in_as(@user,"passwd")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params:{category:{name:" "}} # Rails4: post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end



end

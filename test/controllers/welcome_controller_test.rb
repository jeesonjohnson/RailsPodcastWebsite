require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "Get application cotact page" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'Podly'
    assert_select 'h1', 'Contact us for more information'
  end

  test "Get application homepage" do
    get '/'
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'Podly'
    assert_select 'h1', 'Welcome to the best podcast app'
  end

end

require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  # Display to the user the appropraite view to allow the user to contact the application adminstrator
  test "Get application cotact page" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'Podly'
    assert_select 'h1', 'Contact us for more information'
  end

  # If a user is not signed in the default homepage should be presented
  test "Get application homepage" do
    get '/'
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'Podly'
    assert_select 'h1', 'Welcome to the best podcast app'
  end

  # If a user is already logged in, the podcat app should be presented to the user.
  test "Redirect to application if signed in" do
    sign_in users(:one)
    get '/'
    assert_response :redirect
  end

end

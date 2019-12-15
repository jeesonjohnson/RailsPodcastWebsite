require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  # Display to the user the appropraite view to allow the user to contact the application adminstrator
  test "Get application cotact page" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', I18n.t('app_title')
    assert_select 'h1', I18n.t('contact.title')
  end

  # If a user is not signed in the default homepage should be presented
  test "Get application homepage" do
    get '/'
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', I18n.t('app_title')
    assert_select 'h1', I18n.t('app_desciption')
  end

  # If a user is already logged in, the podcat app should be presented to the user.
  test "Redirect to application if signed in" do
    sign_in users(:one)
    get '/'
    assert_response :redirect
    sign_out users(:one)
  end



  # If a user is not signed in the default homepage should be presented
  test "Get application about page" do
    get about_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', I18n.t('app_title')
  end

  # If a user is already logged in, the podcat app should be presented to the user.
  test "Redirect to application if signed in and tries to acess about page" do
    sign_in users(:one)
    get about_url
    assert_response :success
    sign_out users(:one)
  end

end

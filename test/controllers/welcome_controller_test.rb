require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'Podly'
    assert_select 'h1', 'Contact us for more information'
  end

end

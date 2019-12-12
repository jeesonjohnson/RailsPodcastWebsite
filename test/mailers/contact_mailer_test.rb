require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("elon@x.com",
    "Elon Musk", "0775879646", @message = "Hi this website is awsome")
    assert_equal ['info@podly.com'], mail.to
    assert_equal ['info@podly.com'], mail.from
  end
end

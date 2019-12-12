# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("elon@x.com",
    "Elon Musk", "0775879646", @message = "Hi this website is awsome")
  end
end

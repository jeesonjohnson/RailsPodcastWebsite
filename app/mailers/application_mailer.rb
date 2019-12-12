class ApplicationMailer < ActionMailer::Base
  default to: 'info@podly.com', from: 'info@podly.com'
  layout 'mailer'
end

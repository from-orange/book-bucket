class ApplicationMailer < ActionMailer::Base
  default from: "bucketter@example.com"
  layout 'mailer'
  add_template_helper(ApplicationHelper)
end

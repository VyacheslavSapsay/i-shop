# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'blog.on.rails.test@gmail.com'
  layout 'mailer'
end

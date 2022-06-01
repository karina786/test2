class DonarMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @donation = params[:donation]
    @url  = 'http://127.0.0.1:3000/'
    attachments.inline["donate.jpg"] = File.read("#{Rails.root}/app/assets/images/donate.jpg")
    mail(to: @donation.email, subject: 'Welcome your are successfully registered as donor')
  end
end

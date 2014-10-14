class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def fuckyou_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
         subject: "Your account's been deleted because you're an asshole.",
         template_path: 'notifications',
         template_name: 'deleted')
  end

end

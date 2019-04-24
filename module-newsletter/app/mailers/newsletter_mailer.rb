class NewsletterMailer < ApplicationMailer
  
	default from: "Module Newsletter - No Reply <no-replay@module-newsletter.com>"
	default template_path: -> (mailer) { "mailers/#{mailer.class.name.underscore}" }
  
  def automatic_answer(newsletter)
    @newsletter = newsletter
    mail(to: @newsletter.email, from: ["Module Newsletter - No Reply <no-replay@module-newsletter.com>"], cc: "lrs.estudos@gmail.com", subject: t('.thank_you_for_registration_newsletter'))
  end
  
  def cancel_newsletter(newsletter)
    @newsletter = newsletter
    mail(to: @newsletter.email, from: ["Module Newsletter - No Reply <no-replay@module-newsletter.com>"], cc: "lrs.estudos@gmail.com", subject: t('.cancel_newsletter'))
  end
  
  def send_email_newsletter(name, email, subject, body)
    @name = name
    @email = email
    @subject = subject
    @body = body
    mail(to: @email, from: ["New Newsletter - No Reply <no-replay@module-newsletter.com>"], cc: "lrs.estudos@gmail.com", subject: @subject)  
  end
  
  def manual_answer(newsletter, answer, admin)
    @newsletter = newsletter
    @answer = answer
    @admin = admin
    mail(to: @newsletter.email, from: ["Module Newsletter <#{@admin.email}>"], cc: "lrs.estudos@gmail.com", subject: t('.thank_you_for_registration_newsletter'))
  end
    
end

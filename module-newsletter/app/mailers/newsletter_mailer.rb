class NewsletterMailer < ApplicationMailer
  
	default from: "Module Newsletter - No Reply <no-replay@module-newsletter.com>"
	default template_path: -> (mailer) { "mailers/#{mailer.class.name.underscore}" }
  
  def automatic_answer(newsletter)
    @newsletter = newsletter
    mail(to: @newsletter.email, from: ["Module Newsletter - No Reply <no-replay@module-newsletter.com>"], cc: "lrs.estudos@gmail.com", subject: t('.thank_you_for_newsletter'))
  end
  
  def manual_answer(newsletter, answer, admin)
    @newsletter = newsletter
    @answer = answer
    @admin = admin
    mail(to: @newsletter.email, from: ["Module Newsletter <#{@admin.email}>"], cc: "lrs.estudos@gmail.com", subject: t('.thank_you_for_newsletter'))
  end
    
end

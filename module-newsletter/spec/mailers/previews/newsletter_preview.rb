# Preview all emails at http://localhost:3000/rails/mailers/newsletter
class NewsletterPreview < ActionMailer::Preview
    
  def automatic_answer_preview
    NewsletterMailer.automatic_answer(Newsletter.first)
  end
  
  def cancel_newsletter_preview
    NewsletterMailer.cancel_newsletter(Newsletter.first)
  end
  
  def manual_answer(newsletter, answer, subject_answer, admin)
    NewsletterMailer.manual_answer(newsletter.first, 'Body Test', 'Subject Test', Admin.first)
  end

end

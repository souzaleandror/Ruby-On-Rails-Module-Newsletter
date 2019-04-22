class HomeController < ApplicationController
  before_action :set_newsletter, only: [:destroy_newsletter]
  
  def index
    @newsletter = Newsletter.new
  end
  
  def create_newsletter
    @newsletter = Newsletter.new(newsletter_params)   
    @newsletter.update(:inactive => false)
    
    respond_to do |format|
      if @newsletter.save
        NewsletterMailer.automatic_answer(@newsletter).deliver
        format.html { redirect_to root_path, notice: "#{t('.thank_you_for_registration_newsletter')} \\n #{t('.we_will_send_you_news_soon')}" }
      else
        flash[:error] = "Your Message Not Send Was Successfully. Try again."
        format.html { redirect_to root_path }
      end
    end
  end
  
  def cancel_newsletter
    @newsletter = Newsletter.new
  end
  
  def destroy_newsletter
    respond_to do |format|
      if @newsletter.present? then
        NewsletterMailer.cancel_newsletter(@newsletter).deliver
        @newsletter.destroy
        format.html { redirect_to root_path, notice: 'Newsletter was successfully destroyed.' }
      else 
        flash[:error] = "Not Found."
        format.html { redirect_to home_cancel_newsletter_path }
      end
    end
  end
  
  private 

  # Never trust parameters from the scary internet, only allow the white list through.
  def newsletter_params
    params.require(:newsletter).permit(:name, :email, :accepted)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_newsletter
    @newsletter = Newsletter.find_by(:email => params[:newsletter][:email])
  end
  
end
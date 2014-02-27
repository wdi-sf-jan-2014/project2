class ShareMailer < ActionMailer::Base
  default from: "HeadDatePlanner@Wingman.com"

  def share_email(current_user, recipient, itinerary)
    @user = current_user
    @itinerary = itinerary

    mail(to: recipient, subject: 'View my date itinerary')
  end

end

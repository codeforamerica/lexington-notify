class NotificationsController < ActionController::Base
  layout 'application'

  def index
  end

  def new
  end

  def create
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    @client.account.messages.create(
      :from => ENV['SMS_FROM'],
      :to => '+1' + params[:number],
      :body => params[:message]
    )
    notice = "message: '#{params[:message]}' sent to #{params[:number]}"
    redirect_to new_notifications_path, flash: { notice: notice }
  end
end

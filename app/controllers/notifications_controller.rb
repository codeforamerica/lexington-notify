class NotificationsController < ActionController::Base
  layout 'application'

  def index
  end

  def new
    @users = User.all.includes(:phones)
  end

  def create
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    params[:number].each do |number|
      @client.account.messages.create(
        :from => ENV['SMS_FROM'],
        :to => '+1' + number,
        :body => params[:message]
      )
    end
    notice = "message: '#{params[:message]}' sent to #{params[:number].join(',')}"
    redirect_to new_notifications_path, flash: { notice: notice }
  end
end

class NotificationsController < ActionController::Base
  before_action :check_auth

  layout 'application'

  def index
  end

  def show
    redirect_to new_notifications_path
  end

  def new
    load_users
  end

  def create
    @notifier = Notifier.new

    if (@notifier.send_smses(params[:number], params[:message]))
      notice = "message: '#{params[:message]}' sent to #{params[:number].join(', ')}"
      redirect_to new_notifications_path, flash: { notice: notice }
    else
      load_users
      flash[:error] =  @notifier.error
      render :new
    end
  end

  def load_users
    @users = User.all.includes(:addresses)
  end

  def check_auth
    unless(params[:admin_secret] == ENV['ADMIN_SECRET'])
      redirect_to root_url
    end
  end
end

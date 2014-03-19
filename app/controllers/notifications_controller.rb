class NotificationsController < ActionController::Base
  layout 'application'

  def index
  end

  def new
    load_users
  end

  def create
    @notifier = Notifier.new

    if (@notifier.send_smses(params[:number], params[:message]))
      notice = "message: '#{params[:message]}' sent to #{params[:number].join(',')}"
      redirect_to new_notifications_path, flash: { notice: notice }
    else
      load_users
      flash[:notice] =  @notifier.error
      render :new
    end
  end

  def load_users
    @users = User.all.includes(:phones)
  end
end

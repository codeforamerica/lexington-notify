class CitizensController < ActionController::Base
  layout 'application'

  def index
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json {
        render json: User.all
      }
    end
  end

  def show
    @citizen = User.find(params[:id])
  end

  def new
    @citizen = CitizenForm.new
  end

  def create
    params.require(:citizen).permit!
    @citizen = CitizenForm.new(params[:citizen])
    if (@citizen.save)
      redirect_to citizen_url(@citizen.id)
    else
      flash.now[:error] = "Please enter valid phone number"
      render :new
    end
  end
end

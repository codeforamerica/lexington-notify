class CitizensController < ActionController::Base
  layout 'application'

  def show
    @citizen = User.find(params[:id])
  end

  def new
    @citizen = CitizenForm.new({address: {street: '332 Blackburn Ave'}})
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

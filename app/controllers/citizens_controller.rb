class CitizensController < ActionController::Base
  layout 'application'

  def show
    redirect_to new_citizens_path
  end

  def new
    @citizen = CitizenForm.new({address: {street: '332 Blackburn Ave'}})
  end

  def create
    params.require(:citizen).permit!
    @citizen = CitizenForm.new(params[:citizen])
    if (@citizen.save)
      redirect_to new_citizens_path, flash: {
        notice: "Saved phone number #{@citizen.phone_number}"}
    else
      flash.now[:error] = "Please enter valid phone number"
      render :new
    end
  end
end

class CitizensController < ActionController::Base
  layout 'application'

  def show
    redirect_to new_citizens_path
  end

  def new
  end

  def create
    params.require(:citizen).permit!
    citizen = CitizenForm.new(params[:citizen])
    if (citizen.save)
      redirect_to new_citizens_path, flash: {notice: "Please enter valid phone number"}
    else
      redirect_to new_citizens_path, flash: {notice: "Saved phone number #{citizen.phone_number}"}
    end
  end
end

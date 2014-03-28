class CitizensController < ActionController::Base
  layout 'application'

  def show
    redirect_to new_citizens_path
  end

  def new
  end

  def create
    params.require(:citizen).permit!
    if (params[:citizen][:phone][:number] == "9999")
      redirect_to new_citizens_path, flash: {notice: "Please enter valid phone number"}
    else
      citizen = CitizenForm.create(params[:citizen])
      redirect_to new_citizens_path, flash: {notice: "Saved phone number #{citizen.phone}"}
    end
  end
end

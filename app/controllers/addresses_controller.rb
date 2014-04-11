class AddressesController < ActionController::Base
  def index
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json {
        render json: Address.where(pickup: params[:pickup])
      }
    end
  end
end

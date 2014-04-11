require "spec_helper"

describe AddressesController do
  describe "GET index" do
    it "redirects to root for html requests" do
      get :index
      expect(response).to redirect_to(root_url)
    end

    it "returns addresses" do
      address = FactoryGirl.create(:address)
      get :index, format: :json
      expect(response.body).to eq([address].to_json);
    end

    it "narrows addresses based on pickup" do
      monday = FactoryGirl.create(:address, pickup: Address::PICKUP[:monday])
      tuesday = FactoryGirl.create(:address, pickup: Address::PICKUP[:tuesday])
      get :index, pickup: Address::PICKUP[:monday], format: :json
      expect(response.body).to eq([monday].to_json);
    end
  end
end

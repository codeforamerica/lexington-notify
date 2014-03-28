class PhoneNumber
  include Virtus.model

  attribute :number, String
end

class CitizenForm
  include Virtus.model
  attribute :phone, PhoneNumber

  def initialize(params)
    @phoney = params[:phone]
    super
  end

  def valid?
    phone_number == "9999"
  end

  def save
    @user = User.create
    @user.phones.create @phoney
    return false unless valid?
    puts phone
    true
  end

  def phone_number
    @user.phone
  end

  def self.create(params)
    new(params)
  end
end

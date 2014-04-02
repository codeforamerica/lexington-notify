class AddressInput
  include Virtus.model

  attribute :street, String
  attribute :mobile_number, String
  attribute :pickup, String
  attribute :lat, Float
  attribute :lon, Float

  def valid?
    mobile_number.present? && mobile_number =~ /^\d{3}-?\d{3}-?\d{4}$/
  end
end

class CitizenForm
  include Virtus.model

  attribute :email, String
  attribute :address, AddressInput

  def id
    @user ? @user.id : nil
  end

  def valid?
    address.valid?
  end

  def save
    return false unless valid?
    @user = User.create email: email
    @user.addresses.create address.attributes
  end

  def phone_number
    @user ? user_phone : submitted_phone
  end

  def user_phone
    @user.phone
  end

  def submitted_street
    address ? address.street : ''
  end

  def submitted_phone
    address ? address.mobile_number : ''
  end
end

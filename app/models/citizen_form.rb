class AddressInput
  include Virtus.model

  attribute :street, String
  attribute :mobile_number, String
  attribute :pickup, String
  attribute :lat, Float
  attribute :lon, Float

  def transform
    @mobile_number = mobile_number.gsub(/\D/, '') if (mobile_number.present?)
  end

  def valid?
    mobile_number && mobile_number =~ /^\d{10}$/
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
    address.transform
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

class PhoneNumberInput
  include Virtus.model

  attribute :number, String

  def valid?
    number.present? && number =~ /^\d{3}-?\d{3}-?\d{4}$/
  end
end

class AddressInput
  include Virtus.model

  attribute :street, String
end

class CitizenForm
  include Virtus.model

  attribute :email, String
  attribute :phone, PhoneNumberInput
  attribute :address, AddressInput

  def valid?
    phone.valid?
  end

  def save
    return false unless valid?
    @user = User.create email: email
    @user.phones.create phone.attributes
    @user.addresses.create address.attributes
  end

  def phone_number
    @user ? user_phone : submitted_phone
  end

  def submitted_street
    address ? address.street : ''
  end

  def submitted_phone
    phone ? phone.number : ''
  end

  def user_phone
    @user.phone
  end
end

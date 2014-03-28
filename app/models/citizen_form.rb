class PhoneNumber
  include Virtus.model

  attribute :number, String

  def valid?
    number.present? && number =~ /^\d{3}-?\d{3}-?\d{4}$/
  end
end

class CitizenForm
  include Virtus.model

  attribute :phone, PhoneNumber

  def valid?
    phone.valid?
  end

  def save
    return false unless valid?
    @user = User.create
    @user.phones.create phone.attributes
  end

  def phone_number
    @user ? user_phone : submitted_phone
  end

  def submitted_phone
    phone ? phone.number : ''
  end

  def user_phone
    @user.phone
  end
end

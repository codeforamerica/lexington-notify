class CitizenForm
  # include Virtus.model

  def self.create(params)
    user = User.create
    user.phones.create params[:phone]
    user
  end
end

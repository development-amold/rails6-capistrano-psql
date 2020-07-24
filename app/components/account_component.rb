class AccountComponent < ViewComponent::Base
  def initialize(name: nil, subdomain: nil)
    @name = name
    @subdomain = subdomain
  end

  def get_name_subdomain
    "#{@name}---#{@subdomain}"
  end
end

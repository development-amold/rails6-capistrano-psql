class AppointmentslimComponent < ViewComponent::Base
  def initialize(title: nil, content: nil)
    @title = title
    @content = content
  end
end

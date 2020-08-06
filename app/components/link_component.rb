class LinkComponent < ViewComponent::Base
  def initialize(href: nil)
    @href = href
  end

end

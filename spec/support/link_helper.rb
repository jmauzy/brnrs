module LinkHelper

  def generate_link
    Link.new(
      url: "http://www.google.com"
    )
  end
end

module LinkHelper

  def generate_valid_link
    Link.new(
      url: "http://www.google.com",
      redirect_count: 0,
      redirect_limit: 0,
    )
  end

  def generate_time_expired_link
    Link.new(
      url: "http://www.google.com",
      redirect_count: 0,
      redirect_limit: 1,
      expiration_time: Time.new.ago(30)
    )
  end

  def generate_redirect_expired_link
    Link.new(
      url: "http://www.google.com",
      redirect_count: 1,
      redirect_limit: 1,
    )
  end

end

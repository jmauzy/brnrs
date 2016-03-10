class Link < ActiveRecord::Base
  validates_presence_of :url
  after_initialize :generate_url_string, :set_default_expiration
    
  def is_active?
    return under_redirect_limit? && not_expired?
  end

  private
    def generate_url_string
      self.url_string = SecureRandom.base64(6).tr('+/=', 'N3w')
    end

    def set_default_expiration
      self.expiration ||= Time.now.next_year.round(0)
    end

    def under_redirect_limit?
      redirect_limit == 0 ? true : self.redirect_count < self.redirect_limit
    end

    def not_expired?
      Time.now < self.expiration
    end
  
end

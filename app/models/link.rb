class Link < ActiveRecord::Base
  validates_presence_of :url
  after_initialize :generate_url_string, :set_default_expiration
    
  def is_active?
    return under_max_redirects? && not_expired?
  end

  private
    def generate_url_string
      self.url_string = SecureRandom.base64(6).tr('+/=', 'N3w')
    end

    def set_default_expiration
      self.expiration ||= Time.now.next_year.round(0)
    end

    def under_max_redirects?
      max_redirects == 0 ? true : self.redirects < self.max_redirects
    end

    def not_expired?
      Time.now < self.expiration
    end
  
end

class Link < ActiveRecord::Base
  validates_presence_of :target_url
  before_create :generate_url_string, :set_default_expiration, :set_default_redirects
  before_save :add_url_protocol
    
  def is_active?
    return under_max_redirects? && not_expired?
  end

  private
    def generate_url_string
      self.url_string = SecureRandom.base64(6).tr('+/=', 'N3w')
    end

    def set_default_expiration
      self.expiration && self.expiration != 0 ? return : self.expiration = Time.now.next_year.round(0).to_f
    end

    def set_default_redirects
      self.max_redirects && self.max_redirects > 0 ? return : self.max_redirects = 0
    end

    def under_max_redirects?
      max_redirects == 0 ? true : (self.redirects < self.max_redirects)
    end

    def not_expired?
      Time.now.to_f < self.expiration
    end

    def add_url_protocol
      unless self.target_url[/\Ahttp(s)?:\/\//]
        self.target_url = "http://#{self.target_url}"
      end
    end

end

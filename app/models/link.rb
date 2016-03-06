class Link < ActiveRecord::Base
  validates_presence_of :url
  after_initialize :generate_hash, :set_default_expiration_time
    
  def is_active?
    return under_redirect_limit? && not_expired?
  end

  private
    def generate_hash
      self.url_hash = SecureRandom.base64(6).tr('+/=', 'N3w')
    end

    def set_default_expiration_time
      self.expiration_time ||= Time.now.next_year.round(0)
    end

    def under_redirect_limit?
      redirect_limit == 0 ? true : self.redirect_count < self.redirect_limit
    end

    def not_expired?
      Time.now < self.expiration_time
    end
  
end

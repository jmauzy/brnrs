class Link < ActiveRecord::Base
  validates_presence_of :url
  after_initialize :generate_hash, :set_default_expiration_time

  private
    def generate_hash
      self.url_hash = SecureRandom.base64(6).tr('+/=', 'N3w')
    end

    def set_default_expiration_time
      self.expiration_time = Time.now.next_year.round(0)
    end
  
end

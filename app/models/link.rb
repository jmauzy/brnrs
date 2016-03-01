class Link < ActiveRecord::Base
  validates_presence_of :url
  after_initialize :generate_hash

  private
    def generate_hash
      self.url_hash = SecureRandom.hex(4)
    end
  
end

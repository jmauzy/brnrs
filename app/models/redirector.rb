class Redirector

  def initialize(url_hash)
    @link = get_link(url_hash)
  end

  def target_url
    return @link.url
  end

  private

  def get_link(url_hash)
    Link.find_by(url_hash: url_hash)
  end
  
end



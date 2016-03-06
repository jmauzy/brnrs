class Redirector
  attr_reader :link

  def initialize(url_hash)
    @link = get_link(url_hash)
  end

  def target_url
    return @link.url
  end

  def process
    return nil if link == nil
    if @link.is_active?
      @link.increment!(:redirect_count)
      @link.url
    else
      @link.destroy
      nil
    end
  end

  private

  def get_link(url_hash)
      Link.find_by(url_hash: url_hash)
  end
  
end

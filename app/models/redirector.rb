class Redirector
  attr_reader :link

  def initialize(url_string)
    @link = get_link(url_string)
  end

  def process
    return nil if link == nil
    if @link.is_active?
      @link.increment!(:redirects)
      @link.target_url
    else
      @link.destroy
      nil
    end
  end

  private

  def get_link(url_string)
      Link.find_by(url_string: url_string)
  end
  
end

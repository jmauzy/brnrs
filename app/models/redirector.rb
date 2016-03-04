class Redirector

  def initialize(url_hash)
    begin
      @link = get_link(url_hash)
    rescue ActiveRecord::RecordNotFound => e
      raise e
    end
  end

  def target_url
    return @link.url
  end

  private

  def get_link(url_hash)
      Link.find_by!(url_hash: url_hash)
  end
  
end

class LinkController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @link = Link.create(link_params)
    render @link
  end

  private
    def link_params
      params.require(:link).permit(:target_url, :max_redirects, :expiration)
    end

end

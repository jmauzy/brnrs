class LinkController < ApplicationController
  def create
    @link = Link.create(link_params)
    render json: @link
    
  end

  private
    def link_params
      params.require(:link).permit(:target_url, :max_redirects)
    end

end

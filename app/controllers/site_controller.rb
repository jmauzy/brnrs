class SiteController < ApplicationController
  def main
  end

  def handle_link
    target = Redirector.new(params[:url_string]).process
    target != nil ? redirect_to(target) : render("missing")
  end

end

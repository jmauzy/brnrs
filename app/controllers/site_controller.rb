class SiteController < ApplicationController
  def main
  end

  def handle_link
    target = Redirector.new(params[:url_string]).process
    target != nil ? redirect_to(target) : render("missing")
  end

  def letsencrypt
    render text: "4gwojkxxbefSMp1TVkDw2TeTwszidpaNH29Mp1yjRc0.kRBwrDEGLTNWlZMN-DSgpj9uen6s-VvaqgDt8AK3wuo"
  end

end

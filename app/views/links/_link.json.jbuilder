def format_url string
  "brnrs.io/#{string}"
end

json.link do
  json.url format_url(@link.url_string)
  json.target_url @link.target_url
  json.max_redirects @link.max_redirects
  json.expiration @link.expiration
end

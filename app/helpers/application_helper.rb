module ApplicationHelper
  def url_with_params(url, params = {})
    uri = URI.parse(url)
    uri.query = URI.encode_www_form(params.to_a)
    uri.to_s
  end
end

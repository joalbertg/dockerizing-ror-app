module RequestHelper
  def json_body
    @json_body ||= JSON.parse(response.body)
  end

  def request(http_method, endpoint, parameters = nil)
    send(http_method, endpoint, params: parameters&.to_json || {}, headers: build_headers)
  end

  def build_headers
    { 'Content-Type': 'application/json' }
  end
end

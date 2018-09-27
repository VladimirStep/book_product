module RequestSpecHelpers
  def json
    JSON.parse(response.body, symbolize_names: true)
  end

  def json_headers
    {
      'ACCEPT' => 'application/json',
      'CONTENT_TYPE' => 'application/json'
    }
  end
end
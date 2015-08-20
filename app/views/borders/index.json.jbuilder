json.array!(@borders) do |border|
  json.extract! border, :id, :content, :user_id
  json.url border_url(border, format: :json)
end

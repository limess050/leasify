json.array!(@sites) do |site|
  json.extract! site, :id, :name, :subdomain
  json.url site_url(site, format: :json)
end

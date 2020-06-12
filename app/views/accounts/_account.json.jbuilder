json.extract! account, :id, :description, :balance, :active, :created_at, :updated_at
json.url account_url(account, format: :json)

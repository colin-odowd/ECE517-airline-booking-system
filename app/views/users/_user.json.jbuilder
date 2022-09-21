json.extract! user, :id, :name, :user_id, :credit_card, :address, :mobile, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

json.extract! newsletter, :id, :name, :email, :inactive, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)

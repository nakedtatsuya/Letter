json.extract! letter, :id, :from_name, :message, :to_name, :created_at, :updated_at
json.url letter_url(letter, format: :json)

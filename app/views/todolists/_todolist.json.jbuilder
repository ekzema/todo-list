json.extract! todolist, :id, :user_id, :name, :priority, :created_at, :updated_at
json.url todolist_url(todolist, format: :json)

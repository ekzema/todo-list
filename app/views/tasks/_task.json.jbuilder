json.extract! task, :id, :name, :to_perfom, :priority, :completed, :todolist_id, :created_at, :updated_at
json.url task_url(task, format: :json)

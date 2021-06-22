json.extract! employee, :id, :first_name, :last_name, :document_number, :gender, :birth_date, :created_at, :updated_at
json.url employee_url(employee, format: :json)

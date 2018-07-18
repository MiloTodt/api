class Types::UserType < Types::BaseObject
  field :id, Integer, null:true
  field :fname, String, null: true
  field :lname, String, null: true
  field :email, String, null: true
  field :phone_number, String, null: true
  field :last_sign_in_at, String, null: true
  field :circle_id, Integer, null: true

end

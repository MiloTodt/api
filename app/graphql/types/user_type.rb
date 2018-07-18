class Types::UserType < Types::BaseObject
  field :fname, String, null: true
  field :lname, String, null: true
  field :email, String, null: true
  field :last_sign_in_at, String, null: true
end

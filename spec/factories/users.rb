# This will guess the User class
FactoryGirl.define do
  factory :user do
    username "John"
    email  "someone@example.com"
    password 'f4k3p455w0rd'
  end
end
  # This will use the User class (Admin would have been guessed)
#  factory :admin, class: User do
#  t.string   "email",                  default: "", null: false
#  t.string   "encrypted_password",     default: "", null: false
#  t.string   "reset_password_token"
#  t.datetime "reset_password_sent_at"
#  t.datetime "remember_created_at"
#  t.integer  "sign_in_count",          default: 0,  null: false
#  t.datetime "current_sign_in_at"
#  t.datetime "last_sign_in_at"
#  t.inet     "current_sign_in_ip"
#  t.inet     "last_sign_in_ip"
#  t.datetime "created_at"
#  t.datetime "updated_at"
#  t.string   "username"
#  t.string   "avatar_file_name"
#  t.string   "avatar_content_type"
#  t.integer  "avatar_file_size"
#  t.datetime "avatar_updated_at"

class Teacher < ApplicationRecord
  include User

  has_secure_password
end

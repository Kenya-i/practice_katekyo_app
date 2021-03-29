class Student < ApplicationRecord
  belongs_to :parent

  has_secure_password
end

class User < ApplicationRecord
  has_secure_password
  has_many :course_roles, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}".strip
  end
end

class User < ApplicationRecord
  has_secure_password
# <<<<<<< HEAD
# =======
#   has_many :course_roles, dependent: :nullify

#   def full_name
#     "#{first_name} #{last_name}".strip
#   end
# >>>>>>> a889d09a2608e5e11fdbacbb0abdd00adcaac988

end

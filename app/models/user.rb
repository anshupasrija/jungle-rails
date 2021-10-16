class User < ActiveRecord::Base
  has_secure_password
  class User < ActiveRecord::Base
   
    validates :email, presence: true
   
    validates :password, presence: true
  end

end

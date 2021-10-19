class User < ActiveRecord::Base
  has_secure_password  
    validates :email, presence: true , uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 4 }
    def authenticate_with_credentials(email, password)
      @user = User.find_by_email(email)
      if @user && @user.authenticate(password)
        @user
      else
        nil
      end
    end

  end



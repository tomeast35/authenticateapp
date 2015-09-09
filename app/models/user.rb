class User < ActiveRecord::Base
	validates :email, presence: {message: "必須入力項目です"}
	validates :password, presence: {message: "必須入力項目です"}, length: {minimum:8, message: "8文字以上入力して下さい"}
	validates :password_confirmation, length: {minimum:8, message: "8文字以上入力して下さい"}

	has_secure_password

end

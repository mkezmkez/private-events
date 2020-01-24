class User < ApplicationRecord
    validates :name, :email, :username, presence:true
end

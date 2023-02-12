class User < ApplicationRecord
    validates_presence_of :name, :username, :email, :phone, :address, :pic_url
end

class User < ApplicationRecord 
    validates_presence_of :email 
    validates_uniqueness_of :email 
    validates_presence_of :zip_code
    validates_presence_of :name
end 
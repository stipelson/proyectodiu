class User < ActiveRecord::Base
    validates_uniqueness_of :usuario, :case_sensitive => false, :message => " ya esta en uso"
end

class User < ActiveRecord::Base
    has_many :articles
    validates_uniqueness_of :usuario, :case_sensitive => false, :message => " ya esta en uso"
end

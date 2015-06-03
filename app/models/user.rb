class User < ActiveRecord::Base
    has_many :articles
    has_many :petition
    validates_uniqueness_of :usuario, :case_sensitive => false, :message => " ya esta en uso"
end

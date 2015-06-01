class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

    has_attached_file :photo, styles: { small: "150x150>" }
    validates_attachment :photo,
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end

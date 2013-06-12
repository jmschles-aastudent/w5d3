class Link < ActiveRecord::Base
  attr_accessible :body, :title, :url, :author_id, :sub_id, :sub

  validates :title, :body, :presence => true
  validates :sub, :presence => true

  belongs_to :author, :class_name => "User"
  belongs_to :sub
end

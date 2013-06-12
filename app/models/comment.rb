# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  link_id    :integer
#  parent_id  :integer
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_id, :link_id

  validates :body, :presence => true
  validates :link_id, :presence => true

  belongs_to :link
  belongs_to :author, :class_name => "User"
end

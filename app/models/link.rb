# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

class Link < ActiveRecord::Base
  attr_accessible :body, :title, :url, :author_id, :sub_ids

  validates :title, :body, :presence => true

  belongs_to :author, :class_name => "User"

  has_many :link_subs
  has_many :subs, :through => :link_subs
end

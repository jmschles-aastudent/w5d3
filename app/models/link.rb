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

  before_create :set_default_score

  validates :title, :body, :presence => true

  belongs_to :author, :class_name => "User"

  has_many :link_subs
  has_many :subs, :through => :link_subs
  has_many :comments, :inverse_of => :link

  has_many :user_votes

  def set_default_score
  	self.score ||= 0
  end
end

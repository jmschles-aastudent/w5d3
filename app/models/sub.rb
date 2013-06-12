# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  moderator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  attr_accessible :name, :links, :links_attributes

  validates :name, :presence => true
  								 # :uniqueness => true

  validates :moderator_id, :presence => true

  belongs_to :moderator, :class_name => "User"

  has_many :link_subs, :inverse_of => :sub

  has_many :links, :through => :link_subs
  accepts_nested_attributes_for :links, :reject_if => lambda { |attributes| attributes['url'].blank? }
end

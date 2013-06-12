class Sub < ActiveRecord::Base
  attr_accessible :name, :links, :links_attributes

  validates :name, :presence => true
  								 # :uniqueness => true

  validates :moderator_id, :presence => true

  belongs_to :moderator, :class_name => "User"
  has_many :links, :inverse_of => :sub
  accepts_nested_attributes_for :links, :reject_if => lambda { |attributes| attributes['url'].blank? }
end

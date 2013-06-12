# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sub_id     :integer
#  link_id    :integer
#

class LinkSub < ActiveRecord::Base
  attr_accessible :link_id, :sub_id

  belongs_to :link
  belongs_to :sub
end

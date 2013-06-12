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

require 'test_helper'

class LinkSubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

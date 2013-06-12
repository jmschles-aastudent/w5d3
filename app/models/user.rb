# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :password, :session_token, :username

  validates :username, :presence => true,
  										 :uniqueness => true

  validates :password_digest, :presence => true

  has_many :moderated_subs, :class_name => "Sub", :foreign_key => :moderator_id
  has_many :authored_links, :class_name => "Link", :foreign_key => :author_id

  def password=(password)
  	self.password_digest = BCrypt::Password.create(password)
  end

  def correct_password?(password_attempt)
  	BCrypt::Password.new(self.password_digest) == password_attempt
  end

  def generate_session_token!
  	self.session_token = SecureRandom.urlsafe_base64(16)
  	self.save!
  end

  def destroy_session_token!
  	self.session_token = nil
  	self.save!
  end
end

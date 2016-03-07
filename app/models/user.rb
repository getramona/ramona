# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime
#  updated_at                      :datetime
#  activation_state                :string
#  activation_token                :string
#  activation_token_expires_at     :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  failed_logins_count             :integer          default(0)
#  lock_expires_at                 :datetime
#  unlock_token                    :string
#  last_login_at                   :datetime
#  last_logout_at                  :datetime
#  last_activity_at                :datetime
#  last_login_from_ip_address      :string
#  name                            :string
#  username                        :string           not null
#  role                            :integer          default(0)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  enum role: [:user, :admin]

  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships, source: :group, source_type: 'Organization'
  has_many :organizations, through: :memberships, source: :group, source_type: 'Team'

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end

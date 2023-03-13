# == Schema Information
#
# Table name: interns
#
#  id              :integer          not null, primary key
#  email           :string
#  firstname       :string
#  lastname        :string
#  major           :string
#  password_digest :string
#  university      :string
#  year            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Intern < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end

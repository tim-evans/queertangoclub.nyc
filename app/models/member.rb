class Member < ActiveRecord::Base
  has_many :attendees
  has_many :sessions, through: :attendees

  def formatted_email
    "\"#{name}\" <#{email}>"
  end
end

class Referral < ActiveRecord::Base
  has_many :users
  has_many :requests
  has_many :pledges

  def tag
    "#{source}:#{medium}"
  end
end

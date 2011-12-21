class Request < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :book
end

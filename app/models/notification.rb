class Notification < ActiveRecord::Base
  belongs_to :user
  acts_as_readable :on => :created_at
end

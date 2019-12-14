class Friendship < ApplicationRecord
  # Friendship association is when a given user, is associated to another user
  belongs_to :user
  belongs_to :friend, :class_name => 'User'


end

class UserPodcast < ApplicationRecord
  # A podcast can belong to an associated user account
  belongs_to :user
  belongs_to :podcast
end

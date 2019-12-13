require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test 'Ensure users can create friends' do
    assert_equal Friendship.count, 1
  end
end

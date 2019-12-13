require 'test_helper'

class UserPodcastTest < ActiveSupport::TestCase
  def setup
    @user=users(:one)
  end

  test 'Ensure user asosication to podcasts can be made' do
    assert_equal UserPodcast.count, 4
  end
end

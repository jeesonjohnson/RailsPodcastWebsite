require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new({:email  => 'guy@gmail.com', :first_name  => 'guy',:last_name  => 'guy2', :password  => 'password', :password_confirmation  => 'password' })
  end

  test 'Default database structure' do
    assert_equal 3, User.count
  end

  test 'Check default user is valid' do
    assert @user.valid?
  end

  test 'Validate presence and length constraint of user first_name' do
    # Check presence of  first_name for a given user account
    @user.first_name = ''
    assert_not @user.valid?
    # Check restriction on below 2 character for first_name
    @user.first_name = 'a'
    assert_not @user.valid?
    # Check max user first_name length
    @user.first_name = 'a'*31
    assert_not @user.valid?
  end


  test 'Validate presence and length constraint of user last_name' do
    # Check presence of  last_name for a given user account
    @user.last_name = ''
    assert_not @user.valid?
    # Check restriction on below 2 character for last_name
    @user.last_name = 'a'
    assert_not @user.valid?
    # Check max user last_name length
    @user.last_name = 'a'*31
    assert_not @user.valid?
  end

  test 'Ensure uniqueness of email' do
    @user.save
    user2 = User.new({:email  => 'guy@gmail.com', :first_name  => 'guy',:last_name  => 'guy2', :password  => 'password', :password_confirmation  => 'password' })
    assert_not user2.valid?
    @user.destroy
  end



end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=User.new(username: "fatima", email: "fatima@g.com", password: "qwerty0000")
  end

  test "username shouldn't be empty" do
    @user.username=" "
    assert_not @user.valid?
  end

  test "username shouldn't be more than 50 chars long" do
    @user.username="a"*51
    assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user=@user.dup
    duplicate_user.save
    duplicate_user.reload
    assert_equal @user.save, false
  end

  test "email shouldn't be empty" do
    @user.email=" "
    assert_not @user.valid?
  end

  test "email shouldn't be more than 140 chars long" do
    @user.email="a"*141
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user=User.new(username: "John Smith", email: "john@smith.com", password:"123456789")
    duplicate_user.email=@user.email
    duplicate_user.save
    duplicate_user.reload
    assert_equal @user.save, false
  end

  test "email should be valid" do
    @user.email="john.smith"
    assert_not @user.valid? 
  end

  test "password shouldn't be empty" do
    @user.password=""
    assert_not @user.valid?
  end

  test "password shouldn't be more than 20 chars long" do
    @user.password="q"*21
    assert_not @user.valid?
  end

  test "password shouldn't be less than 8 chars long" do
    @user.password="q"*5
    assert_not @user.valid?
  end
end

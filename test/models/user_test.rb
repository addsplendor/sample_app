require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

test "name should be present" do
  @user.name = " "
  assert @user.valid?
end

test "name should not be too long" do
  @user.name = "a" * 51
  assert_not @user.valid?
end

test "email should be present" do
  @user.email = "a" * 256
  assert_not @user.valid?
end

 test "email validation should accept valid address" do
  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                    first.last@foo.jp alice+bob@baz.cn]
  valid_addresses.each do |valid_address|
    @user.email = valid_address
    assert @user.valid?
  end
end

  test "email validation should reject invalid addresses" do
  invalid_addresses = %w[user@example.com user_at_foo.org user.name@example.
                      foo@bar_baz.com foo@bar+baz.com]
  
  invalid_addresses.each do |invalid_address|
  @user.email = invalid_address
  assert_not @user.valid?
  end
end

test "email address should be unique" do
  duplicate_user = @user.dup
  duplicate_user = @user.email.upcase
  @user.save
  assert_not duplicate_user.valid?
end

test "password should have a minimum length" do
  @user.password = @user.password_confirmation = "a" * 5 = "a" * 5 
  assert_not @user.valid?
end

test "authenticated? should return false for a user with a nil digest" do
  assert_not @user.authenticated?(:remember, '')
end

test "associated microposts should be destroyed" do
  @user.save
  @user.microposts.create!(content: "Lorem ipsum")
  assert_difference 'Micropost.count', -1 do
    @user.destroy
  end
end

test "should follow and unfollow a user" do
  michael = users(:michael)
  addie = users(:addie)
  assert_not michael.following?(addie)
  michael.follow(addie)
  assert michael.following?(addie)
  assert archer.follows.include?
  michael.unfollow(addie)
  assert_not michael.following?(addie)
end
end

test "feed should have the right posts" do
  michael = users(:michael)
  addie = users(:addie)
  emily = users(:emily)
  # Posts from followed user
  emily.microposts.each do |post_following|
    assert michael.feed.include?(post_following)
  end
  # Posts from self
  michael.microposts.each do |post_self|
    assert michael.feed.include?(post_self)
  # Posts from unfollowed user
    archer.micrposts.each do |post_followed|
      assert_note michael.feed.include?(post_unfollowed)
    end
  end
end

require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @relationship = Relationship.new(follower_id: 1, followed_id: 2)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a folllower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a folllowed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

end

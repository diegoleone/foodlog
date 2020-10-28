require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test "updating an entry" do
    entry = create(:entry, meal_type: "Supper", calories: 200)

    assert_equal entry.fats, 20

    entry.fats = 50

    assert entry.save

    assert_equal entry.fats, 50
  end

  test "is valid with valid attributes" do
    # create => User.new(...).save | create
    category = create(:category)
    user = create(:user)

    # build => Entry.new
    entry = build(:entry,
                  meal_type: "Breakfast",
                  calories: 300,
                  user: user,
                  category: category)

    assert entry.save, entry.errors.full_messages.join(', ')
  end
end

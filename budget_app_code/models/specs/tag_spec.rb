require('minitest/autorun')
require('minitest/rg')
require_relative('../tag')
require( 'pry-byebug' )

class TagTest < Minitest::Test



  def setup
    options = {
      'id' => 1,
      'tag_name' => 'Groceries'
    }

    @tag1 = Tag.new(options)
  end

  def test_tag_has_name
    assert_equal("Groceries", @tag1.tag_name)
  end

#  test for save
  # run seeds.rb and see if seeds appear in tags table

  def test_find_by_id
    assert_equal("Groceries", Tag.find(1).tag_name)
  end

  def test_self_all
    assert_equal("Travel", Tag.all().last.tag_name)
  end

end

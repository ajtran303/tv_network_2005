require "./lib/network"
require "./lib/show"
require "./lib/character"
require "minitest/autorun"
require "minitest/pride"

class NetworkTest < MiniTest::Test

  def setup
    @nbc = Network.new("NBC")
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_it_exists_and_has_attributes
    # @nbc = Network.new("NBC")
    assert_instance_of Network, @nbc
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_it_can_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_it_knows_the_main_characters
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@kitt], @nbc.main_characters
  end

  def test_it_know_actors_by_show
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    expected = {
                @knight_rider => ["David Hasselhoff", "William Daniels"],
                @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
                }

    assert_equal expected, @nbc.actors_by_show
  end

end

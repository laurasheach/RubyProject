require('minitest/autorun')
require('minitest/rg')
require_relative('../adoption')

class TestAdoption < MiniTest::Test

  def setup
    options = {
      "id" => 1,
      "adoption_status" => "Available",
      "owner_id" => 3,
      "animal_id" => 2
    }

    @adoption1 = Adoption.new(options)
  end

  def test_id
    assert_equal(1, @adoption1.id)
  end

  def test_adoption_status
    assert_equal("Available", @adoption1.adoption_status)
  end

  def test_owner_id
    assert_equal(3, @adoption1.owner_id)
  end

  def test_animal_id
    assert_equal(2, @adoption1.animal_id)
  end

end

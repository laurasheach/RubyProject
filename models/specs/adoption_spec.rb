require('minitest/autorun')
require('minitest/rg')
require_relative('../adoption')

class TestAdoption < MiniTest::Test

  def setup
    options = {
      "id" => 1,
      "owner_id" => 3,
      "animal_id" => 2,
      "adoption_date" => "2019-06-05"
    }

    @adoption1 = Adoption.new(options)
  end

  def test_id
    assert_equal(1, @adoption1.id)
  end

  def test_owner_id
    assert_equal(3, @adoption1.owner_id)
  end

  def test_animal_id
    assert_equal(2, @adoption1.animal_id)
  end

  def test_adoption_date
    assert_equal("2019-06-05", @adoption1.adoption_date)
  end

end

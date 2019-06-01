require('minitest/autorun')
require('minitest/rg')
require_relative('../animal')

class TestAnimal < MiniTest::Test

  def setup
    options = {
      "id" => 1,
      "name" => "Bert",
      "animal_type" => "Dog",
      "breed" => "West Highland Terrier",
      "age" => 6,
      "admission_date" => "2019-06-01"
    }

    @animal1 = Animal.new(options)
  end

  def test_id
    assert_equal(1, @animal1.id)
  end

  def test_name
    assert_equal("Bert", @animal1.name)
  end

  def test_animal_type
    assert_equal("Dog", @animal1.animal_type)
  end

  def test_breed
    assert_equal("West Highland Terrier", @animal1.breed)
  end

  def test_age
    assert_equal(6, @animal1.age)
  end

  def test_admission_date
    assert_equal("2019-06-01", @animal1.admission_date)
  end

end

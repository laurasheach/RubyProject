require('minitest/autorun')
require('minitest/rg')
require_relative('../owner')

class TestOwner < MiniTest::Test

  def setup
    options = {
      "id" => 1,
      "full_name" => "Laura Sheach",
      "address" => "1 Park Drive, Glasgow, G1 2AB"
    }

    @owner1 = Owner.new(options)
  end

  def test_id
    assert_equal(1, @owner1.id)
  end

  def test_full_name
    assert_equal("Laura Sheach", @owner1.full_name)
  end

  def test_address
    assert_equal("1 Park Drive, Glasgow, G1 2AB", @owner1.address)
  end

end

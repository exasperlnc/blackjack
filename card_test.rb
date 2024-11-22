class CardTester < Minitest::Test
  def test_it_initializes_a_card_value
    expected_card_val = 2
    card = Card.new(2, "Club")
    
  end
end
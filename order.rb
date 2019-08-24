class Order
  attr_reader :amount, :placed_at

  def initialize(amount, placed_at)
    @amount = amount || 0
    @placed_at = placed_at
  end
end

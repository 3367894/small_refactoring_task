require_relative '../models/order'

class OrdersReport

  def initialize(orders, start_date, end_date)
    @orders = orders
    @start_date = start_date
    @end_date = end_date
  end

  def total_sales_within_date_range
    @total_sales_within_date_range ||= @orders.select(&method(:right_order?)).sum(&:amount)
  end

  private

  def right_order?(order)
    order.placed_at && order.placed_at >= @start_date && order.placed_at <= @end_date
  end
end

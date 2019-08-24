require 'spec_helper'

describe OrdersReport do
  describe '#total_sales_within_date_range' do
    let(:start_date) { Date.new(2016, 10, 1) }
    let(:end_date) { Date.new(2016, 10, 31) }
    let(:order_within_range_1) { Order.new(5, Date.new(2016, 10, 10)) }
    let(:order_within_range_2) { Order.new(10, Date.new(2016, 10, 15)) }
    let(:order_less_then_range) { Order.new(5, Date.new(2016, 1, 1)) }
    let(:order_greater_then_range) { Order.new(7, Date.new(2016, 11, 1)) }
    let(:orders) do
      [order_within_range_1, order_within_range_2, order_less_then_range, order_greater_then_range]
    end
    subject { described_class.new(orders, start_date, end_date) }

    context 'normal calculating' do
      it 'returns total sales in range' do
        expect(subject.total_sales_within_date_range).to eq(15)
      end
    end

    context 'with nil in amount' do
      let(:order_within_range_1) { Order.new(nil, Date.new(2016, 10, 10)) }

      it 'returns total sales in range' do
        expect(subject.total_sales_within_date_range).to eq(10)
      end
    end

    context 'with nil in placed_at' do
      let(:order_within_range_1) { Order.new(5, nil) }

      it 'returns total sales in range' do
        expect(subject.total_sales_within_date_range).to eq(10)
      end
    end
  end
end

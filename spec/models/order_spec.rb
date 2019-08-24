require 'spec_helper'

describe Order do
  describe '#amount' do
    it 'returns specific number' do
      expect(described_class.new(3, Date.today).amount).to eq(3)
    end

    it 'returns zero if amount is nil' do
      expect(described_class.new(nil, Date.today).amount).to eq(0)
    end
  end
end

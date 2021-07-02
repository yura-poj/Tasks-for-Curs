require 'spec_helper'
require_relative '../lesson2/6'

RSpec.describe Basket do
  describe '#pay' do
    it 'return order items list and total sum' do
      basket = Basket.new
      basket.add_goods('T', 23, 2)
      expect(basket.pay).to eq(46)
    end
  end
end

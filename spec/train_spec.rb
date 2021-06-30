require 'spec_helper'
require_relative '../lesson3/train'

RSpec.describe Train do
  let(:trains) {build_list(:train, 2)}
  describe 'find' do
    it 'find a train on number' do
      expect(Train.find(1)).to eq(trains.first)
    end
  end
end
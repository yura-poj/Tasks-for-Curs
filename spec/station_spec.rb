require 'spec_helper'
require_relative '../lesson3/station'

RSpec.describe Station do
  subject {described_class.new('A')}
  let(:trains) {build_list(:train, 2, type: :freight)}

  describe '#return_trains_on_type' do
    before { subject.add_train(trains.first); station1.add_train(trains.last)}
    it 'Return sorted list' do
      expect(subject.return_trains_on_type(type: :freight)).to eq(trains.first)
      expect(subject.return_trains_on_type(type: :passenger)).to eq(trains.last)
    end
  end

  describe 'train_leave' do
    before{ subject.train_leave}
    it 'Remove first train from list' do
      expect(subject.trains_list).to eq(trains.last)
    end
  end
end
require 'spec_helper'
require_relative '../lesson3/station'
require_relative '../lesson3/train'

RSpec.describe Station do
  subject { described_class.new('A') }
  let(:trains) { build_list(:train, 2) }

  describe 'train_leave' do
    before do
      subject.add_train(trains.first)
      subject.add_train(trains.last)
      subject.train_leave
    end

    it 'Remove first train from list' do
      expect(subject.trains_list).to eq([trains.last])
    end
  end
end

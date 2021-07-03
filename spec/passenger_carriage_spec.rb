require 'spec_helper'
require_relative '../lesson3/passenger_carriage'

RSpec.describe PassengerCarriage do
  # subject {build(:passenger_carriage )}
  subject { described_class.new(number_of_seats: 50) }

  describe 'free_seats' do
    before do
      subject.take_seat
      subject.take_seat
      subject.rid_seat
    end
    it 'return number of free seats' do
      expect(subject.free_seats).to eq(49)
    end
  end
end

require 'spec_helper'
require_relative '../lesson3/route'

RSpec.describe Route do
  subject { described_class.new(start_station: stations.first, finish_station: stations.last) }
  let(:stations) { build_list(:station, 3) }

  describe '#delete_station' do
    before { subject.add_station(station: stations[1]) }

    it 'delete station from station list' do
      subject.delete_station(obj: subject.route_list[1])
      expect(subject.route_list).to eq([stations.first, stations.last])
    end
  end
end

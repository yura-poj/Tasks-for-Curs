require 'spec_helper'
require_relative '../lesson3/route'

RSpec.describe Route do
  let(:route) { described_class.new(start_station: stations.first, finish_station: stations.last) }
  let(:stations) { build_list(:station, 3) }

  describe '#delete_station' do
    before { route.add_station(station: stations[1]) }

    it 'delete station from station list' do
      route.delete_station(obj: route.route_list[1])
      expect(route.route_list).to eq([stations.first, stations.last])
    end
  end
end

require_relative 'train'
require_relative 'passenger_carriage'
class PassengerTrain < Train
  def type
    :passenger
  end

  def add_carriage_with_own_type
    add_carriage!(PassengerCarriage.new)
  end
end

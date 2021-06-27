require 'train'
require 'passenger_carriage'
class PassengerTrain < Train
  def type
    :passenger
  end

  def add_carriage_with_own_type
    add_carriage!(PassengerCarriage.new)
  end
end

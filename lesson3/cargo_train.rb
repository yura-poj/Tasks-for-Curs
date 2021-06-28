require_relative 'train'
require_relative 'cargo_carriage'

class CargoTrain < Train
  def type
    :cargo
  end
  
  def add_carriage_with_own_type
    add_carriage!(CargoCarriage.new)
  end
end

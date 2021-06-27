require 'train'
require 'cargo_carriage'
class CargoTrain < Train
  def type
    :cargo
  end

  protected

  def add_carriage!(carriage)
    @carriages.push(carriage)
  end

  def add_carriage_with_own_type
    add_carriage!(CargoCarriage.new)
  end
end

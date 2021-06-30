require_relative 'manufacturer'
require_relative 'instance_counter'
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  include Manufacturer
  include InstanceCounter
  attr_accessor :speed, :number

  def self.find(number_find)
    puts ObjectSpace.each_object(self).to_a.each { |obj| return obj if obj.number == number_find.to_s}
    return nil
  end

  def initialize(number)
    @number = number.to_s
    @speed = 0
    @carriages = []
    register_instance
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    return 'train must stop' if train_move?
    return 'type carriage is wrong' if types_of_train_and_carriage_are_not_equal(carriage)

    add_carriage!(carriage)
  end

  def remove_carriage
    return 'train must stop' if train_move?

    remove_carriage!
  end

  def add_route(route)
    @route = route
    @location = 0
  end

  def next_station
    return 'train already on last station' if train_on_last_station

    next_station!
  end

  def previous_station
    return 'train already on first station' if train_on_first_station

    previous_station!
  end

  def print_route
    puts "Stations -> Previous: #{@route[@location - 1]} Current: #{@route[@location]} Next: #{@route[@location + 1]}"
  end

  def type
    :nil
  end

  private

  def add_carriage!(carriage)
    @carriages.push(carriage)
  end

  def types_of_train_and_carriage_are_not_equal(carriage)
    carriage.type != type
  end

  def train_move?
    @location >= length(@route)
  end

  def remove_carriage!
    @carriages.pop
  end

  def train_on_first_station
    @location <= 0
  end

  def train_on_last_station
    @location < @carriages.size
  end

  def next_station!
    @location += 1
  end

  def previous_station!
    @location -= 1
  end
end

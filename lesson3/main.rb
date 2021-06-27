=begin
     - Создавать станции
     - Создавать поезда
     - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
     - Назначать маршрут поезду
     - Добавлять вагоны к поезду
     - Отцеплять вагоны от поезда
     - Перемещать поезд по маршруту вперед и назад
     - Просматривать список станций и список поездов на станции
=end
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'

class Conductor
  def initialize
    @greeting = "0 - exit\n 1 - act with stations \n2 - act with route \n3 - act with train"
    @guide_about_staions = "0 - exit to main menu \n1 - make station \n2 - check list of stations \n3 - check list of trains on station"
    @guide_about_route = ""
    @guide_about_train = ""
    @stations = []
    @routes = []
    @trains = []
  end

  def start
    loop do
      puts @greeting
      chose = gets.to_i

      case chose
      when 0
        break
      when 1
        act_with_station
      when 2
        act_with_route
      end

    end
  end

  private

  def act_with_station
    loop do
      puts @guide_about_staions
      case chose
      when 0
        start
      when 1
        create_station
      when 2
        puts_list_of_stations
      when 3
        puts_list_of_trains_on_station
    end
    end
  end

  def act_with_route
    loop do
      puts @guide_about_route
      case chose
      when 0
        start
      when 1
        create_route
      when 2
        act_with_station_from_route
      end
    end
  end

  def act_with_train
    loop do
      puts @guide_about_train
      case chose
      when 0
        start
      when 1
        puts 'Enter the type 1 - cargo or 2 - passenger'
        case chose
        when 1
          puts 'Enter a number'

        when 2

        end
      end
    end
  end

  def puts_every_station
    @stations.each_with_index { |station, n| puts "#{n} - #{station}"}
  end

  def puts_list_of_stations
    puts @stations
  end

  def puts_list_of_trains_on_station
    puts 'Enter a number of station'
    puts_every_station
    puts @stations[gets].trains_list
  end

  def create_station
    puts 'Enter a name'
    @stations.push Station.new(gets)
  end

  def create_route
    puts 'Enter number of first and last station'
    puts_every_station
    @routes.push(Route.new(start_station: @stations[gets], finish_station: @stations[gets]))
  end

  def act_with_station_from_route
    puts 'Enter number of route'
    @routes.each_with_index { |route, n| puts "#{n} - #{route}"}
    route = @routes[gets]
    loop do
      puts "1 - add station\n2 remove station"
      case chose
      when 0
        start
      when 1
        add_station_in_route
      when 2
        remove_station_from_route
      end
    end
  end

  def remove_station_from_route
    puts 'Enter a number of station'
    puts_every_station
    route.remove_station(@stations[gets])
  end

  def add_station_in_route
    puts 'Enter a number of station'
    puts_every_station
    route.add_station(@stations[gets])
  end
end


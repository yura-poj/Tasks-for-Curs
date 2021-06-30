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
require_relative 'cargo_train'
require_relative 'passenger_train'

class Conductor
  def initialize
    @greeting = "0 - exit\n 1 - act with stations \n2 - act with route \n3 - act with train"
    @guide_about_staions = "0 - exit to back \n1 - make station \n2 - check list of stations \n3 - check list of trains on station"
    @guide_about_route = "0 - back 1 - create 2 - act with stations"
    @guide_about_train = "0 - back 1 - create 2 - choose train"
    @trains = []
    @stations = []
    @routes = []
  end

  def start
    loop do
      puts @greeting
      choice = gets.to_i

      case choice
      when 0
        break
      when 1
        act_with_station
      when 2
        act_with_route
      when 3
        act_with_train
      end
    end
  end

  private

  def act_with_station
    loop do
      puts @guide_about_staions
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        create_station
      when 2
        puts_every_station
      when 3
        puts_list_of_trains_on_station
    end
    end
  end

  def act_with_route
    loop do
      puts @guide_about_route
      choice = gets.to_i
      case choice
      when 0
        break
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
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        create_train
      when 2
        act_with_chosed_train
      end
    end
  end

  def puts_every_train
    @trains.each_with_index { |train, n| puts "#{n} - #{train.number}"}
  end

  def create_train
    loop do
      puts 'Enter the type 1 - cargo or 2 - passenger'
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        create_train_with_type(CargoTrain)
      when 2
        create_train_with_type(PassengerTrain)
      end
    end
  end

  def create_train_with_type(obj_with_type)
    puts 'Enter a number'
    @trains.push(obj_with_type.new(gets.chomp))
    puts "You create #{@trains.last.number} train"
  rescue Exception => e
    puts e.message
    puts "try again...\n"
    retry
  end

  def act_with_chosed_train
    train = choose_train
    loop do
      puts "0 - exit to back \n1 - act_with_carriage \n2 - act with route"
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        act_with_carriage(train)
      when 2
        act_with_route_of_train(train)
      end
    end
  end

  def choose_train
    puts 'Enter number of train'
    puts_every_train
    return @trains[gets.to_i]
  end

  def act_with_carriage(train)
    loop do
      puts '0 - back 1 - add 2 - remove'
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        train.add_carriage_with_own_type
      when 2
        train.remove_carriage
      end
    end
  end

  def train_move(train)
    loop do
      puts '0 - back 1 - move next 2 - move back'
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        train.next_station
      when 2
        train.previous_station
      end
    end
  end

  def act_with_route_of_train(train)
    loop do
      puts '0 - back 1 - add 2 - move'
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        train.add_route(choose_route)
      when 2
        train_move
      end
    end
  end

  def puts_every_station
    @stations.each_with_index { |station, n| puts "#{n} - #{station.name}"}
  end

  def puts_every_route
    @routes.each_with_index { |route, n| puts "#{n} - #{route}"}
  end

  def puts_list_of_trains_on_station
    puts 'Enter a number of station'
    puts_every_station
    puts @stations[gets.to_i].trains_list
  end

  def create_station
    puts 'Enter a name'
    @stations.push(Station.new(gets.chomp))
    puts "You create #{@stations.last.name} station"
  rescue Exception => e
    puts e.message
    puts "try again...\n"
    retry
  end

  def create_route
    puts 'Enter number of first and last station'
    puts_every_station
    begin
    @routes.push(Route.new(start_station: @stations[gets.to_i], finish_station: @stations[gets.to_i]))
    puts "You create #{@routes.last} station"
    rescue Exception => e
      puts e.message
    end
    end

  def act_with_station_from_route
    route = choose_route
    loop do
      puts "0 - exit to back \n1 - add station\n2 remove station"
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        add_station_in_route
      when 2
        remove_station_from_route
      end
    end
  end

  def choose_route
    puts 'Enter number of route'
    puts_every_route
    return @routes[gets.to_i]
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


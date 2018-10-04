require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "Station is empty" if empty?
    @docked_bikes.pop
  end

  def dock_bike(bike)
    raise "Dock station full" if full?
    @docked_bikes << bike
  end

private
  def full?
    if @docked_bikes.length == DEFAULT_CAPACITY
      return true
    end
  end

  def empty?
     @docked_bikes.empty?
  end


end

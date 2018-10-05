require_relative 'bike'

class DockingStation

  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Station is empty" if empty?
    bike = next_working_bike
    raise "The docked bikes broken" if bike.nil?
    @docked_bikes.delete(bike)
    bike
  end

  def dock_bike(bike)
    raise "Dock station full" if full?
    @docked_bikes << bike
  end

private
  def full?
    if @docked_bikes.length == @capacity
      return true
    end
  end

  def empty?
     @docked_bikes.empty?
  end

  def next_working_bike
    @docked_bikes.detect do |bike|
      bike.working?
    end
  end
end

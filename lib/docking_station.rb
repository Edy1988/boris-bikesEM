require_relative 'bike'

class DockingStation

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "Station is empty" if @docked_bikes.empty? == true
    @docked_bikes.pop
  end

  def dock_bike(bike)
    raise "Dock station full" if @docked_bikes.length >= 20
    @docked_bikes << bike
  end

  #def docked_bike
    #@docked_bike
  #end

end

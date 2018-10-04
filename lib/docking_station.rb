require_relative 'bike'

class DockingStation
  attr_reader :docked_bike

  def release_bike
    raise "Station is empty" if @docked_bike == nil
    @docked_bike
  end

  def dock_bike(bike)
    @docked_bike = bike
  end

  #def docked_bike
    #@docked_bike
  #end

end

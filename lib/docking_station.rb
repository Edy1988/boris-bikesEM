require_relative 'bike'

class DockingStation
  attr_reader :docked_bike
  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @docked_bike = bike
  end

  #def docked_bike
    #@docked_bike
  #end

end

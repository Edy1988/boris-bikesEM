
require 'docking_station'

describe DockingStation do

  it "reponds to releasing bike" do
    expect(subject).to respond_to(:release_bike)
  end

  it "responds to dock bike" do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it "does not release a bike if empty" do
    expect { subject.release_bike }.to raise_error("Station is empty")
  end

  it 'releases a docked working bike' do
    working_bike = Bike.new

    subject.dock_bike(working_bike)

    expect(subject.release_bike).to eq working_bike
  end

  it 'does not release the same working bike twice' do
    subject.dock_bike(Bike.new)
    subject.release_bike

    expect { subject.release_bike }.to raise_error("Station is empty")
  end

  it "has a default capacity of 20" do
    expect(DockingStation::DEFAULT_CAPACITY).to eq 20
  end

  it "sets capacity to default if no capacity specified" do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it "lets user set a given capacity" do
    expect(DockingStation.new(30).capacity).to eq 30
  end

  it "does not dock the bike if full by given capacity" do
    ds = DockingStation.new(2)
    ds.dock_bike(Bike.new)
    ds.dock_bike(Bike.new)
    
    expect { ds.dock_bike(Bike.new)}.to raise_error("Dock station full")
  end

  it "does not dock the bike if full by default capacity" do
    ds = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { ds.dock_bike(Bike.new) }
    expect { ds.dock_bike(Bike.new)}.to raise_error("Dock station full")
  end

  it "does not release a bike when all docked bikes are broken" do
    subject.dock_bike(make_broken_bike)
    subject.dock_bike(make_broken_bike)
    subject.dock_bike(make_broken_bike)

    expect { subject.release_bike }.to raise_error("The docked bikes are broken")
  end

  it "ignores broken bikes and releases working ones" do
    working_bike = make_working_bike

    subject.dock_bike(make_broken_bike)
    subject.dock_bike(make_broken_bike)
    subject.dock_bike(working_bike)
    subject.dock_bike(make_broken_bike)
    subject.dock_bike(make_broken_bike)

    expect(subject.release_bike).to eq working_bike
  end

  def make_working_bike
    Bike.new
  end

  def make_broken_bike
    broken_bike = Bike.new
    broken_bike.report_broken
    broken_bike
  end
end

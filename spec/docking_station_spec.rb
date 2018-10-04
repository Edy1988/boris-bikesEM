
require 'docking_station'

describe DockingStation do

  it "reponds to releasing bike" do
    expect(subject).to respond_to(:release_bike)
  end

  it 'releases the working bike' do
    subject.dock_bike(Bike.new)
    expect(subject.release_bike).to be_working
  end

  it "docks the bike" do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it "does not release a bike if empty" do
    ds = DockingStation.new
    expect { ds.release_bike }.to raise_error("Station is empty")
  end

  it "does not dock the bike if full" do
    ds = DockingStation.new
    ds.dock_bike(Bike.new)
    expect { ds.dock_bike(Bike.new)}.to raise_error("Dock station full")
  end
end

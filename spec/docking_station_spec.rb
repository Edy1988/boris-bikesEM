
require 'docking_station'

describe DockingStation do
  it "reponds to releasing bike" do
    expect(subject).to respond_to(:release_bike)
  end
  it 'releases the working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "docks the bike" do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end
end

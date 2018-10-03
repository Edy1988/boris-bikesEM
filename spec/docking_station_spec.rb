
require 'docking_station'

describe DockingStation do
  it "reponds to releasing bike" do
    expect(subject).to respond_to(:release_bike)
  end

end

require 'bike'
describe Bike do
  it 'responds to wroking?' do
    expect(subject).to respond_to (:working?)
  end
end

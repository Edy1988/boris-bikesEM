require 'bike'

describe Bike do
  it 'responds to working?' do
    expect(subject).to respond_to (:working?)
  end

  it 'responds to report_broken' do
    expect(subject).to respond_to (:report_broken)
  end

  it 'can be reported broken ' do
    subject.report_broken
    expect(subject).to be_broken
    expect(subject).not_to be_working
  end

  it 'is working by default' do
    expect(subject).to be_working
  end

end

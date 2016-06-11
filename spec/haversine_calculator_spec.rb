describe 'Haversine Formula' do
  let(:christina) { {"latitude" => "52.986375", "longitude" => "-6.043701"} }
  let(:alice) { {"latitude" => "51.92893", "longitude" => "-10.27699"} }
  let(:intercom) { {"latitude" => "53.3381985", "longitude" => "-6.2592576"} }
  let(:haversine_calculator) { HaversineCalculator.new }


  it "should calculate distance between Christina and Alice" do
    expect(haversine_calculator.distance_between(christina, alice)).to eq(309.94)
  end

  it "should calculate distance between Christina and Intercom" do
    expect(haversine_calculator.distance_between(christina, intercom)).to eq(41.68)
  end

  it "should calculate distance between Alice and Intercom" do
    expect(haversine_calculator.distance_between(alice, intercom)).to eq(313.1)
  end
end

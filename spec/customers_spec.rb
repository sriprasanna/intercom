describe 'Customers' do
  let(:christina) { {"latitude" => "52.986375", "longitude" => "-6.043701"} }
  let(:alice) { {"latitude" => "51.92893", "longitude" => "-10.27699"} }
  let(:json_location) { File.expand_path(File.dirname(__FILE__) + '/../customers.json') }
  let(:haversine_calculator) { double() }
  let(:parser) { double() }

  before(:each) do
    allow(parser).to receive(:parse_line_by_line).and_return([christina, alice])
  end

  describe 'list customers' do
    it "should list customers" do
      customers = Customers.new json_location, parser, haversine_calculator
      expect(customers.all).to eq([christina, alice])
    end

    it "should list customers within 1 km" do
      allow(haversine_calculator).to receive(:distance_between).with(Customers::INTERCOM, christina).and_return(1000)
      allow(haversine_calculator).to receive(:distance_between).with(Customers::INTERCOM, alice).and_return(1000)
      customers = Customers.new json_location, parser, haversine_calculator
      expect(customers.within_kms 1).to eq([])
    end

    it "should list customers within 50 km" do
      allow(haversine_calculator).to receive(:distance_between).with(Customers::INTERCOM, christina).and_return(49)
      allow(haversine_calculator).to receive(:distance_between).with(Customers::INTERCOM, alice).and_return(1000)
      customers = Customers.new json_location, parser, haversine_calculator
      expect(customers.within_kms 50).to eq([christina])
    end

    it "should list customers within 500 km" do
      allow(haversine_calculator).to receive(:distance_between).with(Customers::INTERCOM, christina).and_return(499.99)
      allow(haversine_calculator).to receive(:distance_between).with(Customers::INTERCOM, alice).and_return(500)
      customers = Customers.new json_location, parser, haversine_calculator
      expect(customers.within_kms 500).to eq([christina, alice])
    end
  end
end

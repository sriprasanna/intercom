describe 'JSON file parser' do
  let(:filepath) { File.expand_path(File.dirname(__FILE__) + '/../customers.json') }
  let(:parser) { JsonFileParser.new }

  it "should parse a file of json objects separated by line breaks" do
    parsed_objects = parser.parse_line_by_line filepath
    expect(parsed_objects).to be_an_instance_of(Array)
    christina = parsed_objects.first

    expect(christina["name"]).to eq("Christina McArdle")
    expect(christina["latitude"]).to eq("52.986375")
    expect(christina["longitude"]).to eq("-6.043701")
    expect(christina["user_id"]).to eq(12)
  end
end

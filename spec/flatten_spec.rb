describe 'Flatten' do
  it "should flatten nested arrays" do
    expect(flatten([1, 2, 3, 4, 5, 6])).to eq([1, 2, 3, 4, 5, 6])
    expect(flatten([[[1, 2], 3], [[[4], [5]], [6]]])).to eq([1, 2, 3, 4, 5, 6])
  end
end

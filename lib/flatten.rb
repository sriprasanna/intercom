def flatten array, _array = []
  array.each do |item|
    if item.is_a? Array
      flatten item, _array
    else
      _array << item
    end
  end
  _array
end

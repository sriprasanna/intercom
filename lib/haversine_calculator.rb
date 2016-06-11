class HaversineCalculator
  RADIUS_OF_EARTH_IN_KMS = 6371
  def distance_between origin, destination
    (RADIUS_OF_EARTH_IN_KMS * great_circle_distance_between(origin, destination)).round(2)
  end

  private
  def great_circle_distance_between origin, destination
    origin_latitude, origin_longitude = coordinates_as_radians(origin)
    dest_latitude, dest_longitude = coordinates_as_radians(destination)

    delta_longitude = origin_longitude - dest_longitude
    delta_latitude = origin_latitude - dest_latitude

    a = power(sin(delta_latitude/2), 2) + cos(origin_latitude) * cos(dest_latitude) * power(sin(delta_longitude/2), 2)
    great_circle_distance = 2 * asin(sqrt(a))
  end

  def coordinates_as_radians coordinates
    [ as_radians(coordinates["latitude"]), as_radians(coordinates["longitude"]) ]
  end

  def as_radians degrees
    degrees.to_f * Math::PI / 180
  end

  def sin radian
    Math.sin radian
  end

  def cos radian
    Math.cos radian
  end

  def asin radian
    Math.asin radian
  end

  def sqrt radian
    Math.sqrt radian
  end

  def power(num, pow)
    num ** pow
  end
end

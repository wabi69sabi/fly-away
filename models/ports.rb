class Ports
  def self.hash_ports(array)
    begin
      array.each_with_object({}) { |str, hsh| hsh[str] = Geokit::Geocoders::GoogleGeocoder.geocode str + ", airport" }
    rescue
      return 'error'
    end
  end

  def self.get_distances(hashed)
    hashed.keys.combination(2).each_with_object({}) do |str, hsh|
      hsh["#{str.first.upcase} to #{str.last.upcase}"] = (hashed[str.first].distance_to(hashed[str.last])).round(2)
    end
  end
end

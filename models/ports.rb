class Ports
  def self.hash_ports(array)
    begin
      array.each_with_object({}) { |str, hsh| hsh[str] = Geokit::Geocoders::GoogleGeocoder.geocode str + ", airport" }
    rescue
      return 'error'
    end
  end
end

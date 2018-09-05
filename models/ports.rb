class Ports
  def self.hash_ports(array)
    array.each_with_object({}) { |str, hsh| hsh[str] = "#{str}, airport" }
  end
end

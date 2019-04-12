class Acronym
  def self.abbreviate(str)
    str.scan(/\b\w/)
      .map{ |s| s.upcase }
      .join
  end
end

require 'set'

module NamesManager
  extend HardCodedAuthors
  extend FalsePositives
  extend CanonicalNames

  # Determines whether names mapping or special cases handling have been updated
  # since +ts+.
  def self.updated_since?(ts)
    [__FILE__, *Dir.glob("#{__dir__}/names_manager/*.rb")].any? do |filename|
      File.mtime(filename) > ts
    end
  end

  # Removes email addresses (anything between <...>), and strips whitespace.
  def self.sanitize(name)
    name.sub(/<[^>]+>/, '').strip
  end
end

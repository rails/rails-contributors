UNF_NORMALIZER = UNF::Normalizer.new

module StringExtensions
  def parameterize
    super.gsub('ß', 'ss').gsub('ø', 'o')
  end

  def nfc
    UNF_NORMALIZER.normalize(self, :nfc)
  end
end

String.prepend(StringExtensions)

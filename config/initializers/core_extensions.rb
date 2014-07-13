UNF_NORMALIZER = UNF::Normalizer.new

class String
  def parameterize_with_special_cases
    gsub('ß', 'ss').gsub('ø', 'o').parameterize_without_special_cases
  end
  alias_method_chain :parameterize, :special_cases

  def nfc
    UNF_NORMALIZER.normalize(self, :nfc)
  end
end

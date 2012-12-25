# encoding: utf-8

class String
  def parameterize_with_special_cases
    gsub('ß', 'ss').gsub('ø', 'o').parameterize_without_special_cases
  end
  alias_method_chain :parameterize, :special_cases

  def nfc
    UNF::Normalizer.new.normalize(self, :nfc)
  end
end

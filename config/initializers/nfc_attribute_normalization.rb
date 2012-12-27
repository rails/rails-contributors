require 'nfc_attribute_normalizer'

class ActiveRecord::Base
  extend NFCAttributeNormalizer
end
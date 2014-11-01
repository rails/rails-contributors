# Not very clever, but will do for what we need.
module NFCAttributeNormalizer
  def nfc(*attribute_names)
    include Module.new {
      attribute_names.each do |name|
        module_eval <<-EOS
          def #{name}=(value)
            value = value.to_s.scrub.nfc unless value.nil?
            write_attribute(#{name.inspect}, value)
          end
        EOS
      end
    }
  end
end

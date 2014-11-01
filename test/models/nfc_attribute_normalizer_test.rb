require 'test_helper'

class NFCAttributeNormalizerTest < ActiveSupport::TestCase
  A_GRAVE_NFC     = "\u00c0"
  A_GRAVE_NON_NFC = "\u0041\u0300"
  NON_VALID       = "\xa9"

  NORMALIZER = Class.new do
    extend NFCAttributeNormalizer

    nfc :title, :body

    def initialize
      @values = {}
    end

    def write_attribute(name, value)
      @values[name] = value
    end

    def read_attribute(name)
      @values[name]
    end
  end

  def setup
    @model = NORMALIZER.new
  end

  def test_normalizes_non_normalized_attributes
    @model.title = A_GRAVE_NON_NFC
    assert_equal A_GRAVE_NFC, @model.read_attribute(:title)

    @model.body = A_GRAVE_NON_NFC
    assert_equal A_GRAVE_NFC, @model.read_attribute(:body)
  end

  def test_normalizes_normalized_attributes
    @model.title = A_GRAVE_NFC
    assert_equal A_GRAVE_NFC, @model.read_attribute(:title)

    @model.body = A_GRAVE_NFC
    assert_equal A_GRAVE_NFC, @model.read_attribute(:body)
  end

  def test_ignores_nil
    @model.title = nil
    assert_nil @model.read_attribute(:title)

    @model.body = nil
    assert_nil @model.read_attribute(:body)
  end

  def test_scrubs
    assert !NON_VALID.valid_encoding?

    @model.title = NON_VALID

    assert_equal '�', @model.read_attribute(:title)
    assert @model.read_attribute(:title).valid_encoding?
  end
end

module NamesManager
  module FalsePositives
    CONNECTORS_REGEXP = %r{(?:[,/&+]|\band\b)}

    # Returns +nil+ if +name+ is known *not* to correspond to an author, the
    # author name(s) if special handling applies, like multiple authors separated
    # by a connector. If nothing applies, returns +name+ back.
    #
    # Note that this method is responsible for extracting names as they appear
    # in the original string. Canonicalization is done elsewhere.
    def handle_false_positives(name)
      case name
        when /\A\d+\b/
        when /#\d+/
        when /GH-\d+/
        when /\A\s*\z/
        when /RAILS_ENV/
        when /^See rails ML/
        when /RubyConf/
        when 'update from Trac'
        when /\A['":]/
        when 'RC1'
        when %r{https://}
        when '\\x00-\\x1f'
        when /\ACVE-[\d-]+\z/i
        when 'and'
        when 'options'
        when 'API DOCS'
        when 'hat-tip to anathematic'
        when 'props to Zarathu in #rubyonrails'
        when 'thanks Pratik!'
        when 'multiple=true'
        when /ci[\s_-]s?kip/i
        when 'ci skp'
        when 'ci ski'
        when /skip[ -]ci/i
        when 'key'
        when '.lock'
        when "{ :ca => :'es-ES' }"
        when 'fixes 5f5e6d924973003c105feb711cefdb726f312768'
        when "schoenm\100earthlink.net sandra.metz\100duke.edu"
          name.split
        when '=?utf-8?q?Adam=20Cig=C3=A1nek?='
          'Adam Cigánek'.nfc
        when '=?utf-8?q?Mislav=20Marohni=C4=87?='
          'Mislav Marohnić'.nfc
        when 'nik.wakelin Koz'
          ['nik.wakelin', 'Koz']
        when "me\100jonnii.com rails\100jeffcole.net Marcel Molina Jr."
          ["me\100jonnii.com", "rails\100jeffcole.net", 'Marcel Molina Jr.']
        when "jeremy\100planetargon.com Marcel Molina Jr."
          ["jeremy\100planetargon.com", 'Marcel Molina Jr.']
        when "matt\100mattmargolis.net Marcel Molina Jr."
          ["matt\100mattmargolis.net", 'Marcel Molina Jr.']
        when "doppler\100gmail.com phil.ross\100gmail.com"
          ["doppler\100gmail.com", "phil.ross\100gmail.com"]
        when 'After much pestering from Dave Thomas'
          'Dave Thomas'
        when "jon\100blankpad.net)"
          ["jon\100blankpad.net"]
        when 'Jose and Yehuda'
          ['José Valim'.nfc, 'Yehuda Katz']
        when /\A(?:Suggested|Aggregated)\s+by\s+(.*)/i
          $1
        when /\A(?:DHH\s*)?via\s+(.*)/i
          $1
        when /\b\w+\+\w+@/
          # The plus sign is taken to be a connector below, this catches some known
          # addresses that use a plus sign in the username, see unit tests for examples.
          # We know there's no case where the plus sign acts as well as a connector in
          # the same string.
          name.split(/\s*,\s*/).map(&:strip)
        when CONNECTORS_REGEXP # There are lots of these, even with a combination of connectors.
          name.split(CONNECTORS_REGEXP).map(&:strip).reject do |part|
            part == 'others' ||
            part == '?'
          end
        else
          # just return the candidate back
          name
      end
    end
  end
end

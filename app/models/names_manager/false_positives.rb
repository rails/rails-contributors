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
        when /ci[ _-]s?kip/i
        when 'ci skp'
        when 'ci ski'
        when /skip[ -]ci/i
        when 'key'
        when '.lock'
        when 'Carlhuda'
          ['Yehuda Katz', 'Carl Lerche']
        when 'tomhuda'
          ['Yehuda Katz', 'Tom Dale']
        when "schoenm\100earthlink.net sandra.metz\100duke.edu"
          name.split
        when '=?utf-8?q?Adam=20Cig=C3=A1nek?='
          'Adam Cigánek'.nfc
        when '=?utf-8?q?Mislav=20Marohni=C4=87?='
          'Mislav Marohnić'.nfc
        when 'Thanks to Austin Ziegler for Transaction::Simple'
          'Austin Ziegler'
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
        when 'Aredridel/earlier work by Michael Neumann'
          ['Aredridel', 'Michael Neumann']
        when "jon\100blankpad.net)"
          # see 35d3ede
          ["jon\100blankpad.net"]
        when 'Jose and Yehuda'
          ['José Valim', 'Yehuda Katz'].map(&:nfc)
        when /\b\w+\+\w+@/
          # The plus sign is taken to be a connector below, this catches some known
          # addresses that use a plus sign in the username, see unit tests for examples.
          # We know there's no case where the plus sign acts as well as a connector in
          # the same string.
          name.split(/\s*,\s*/).map(&:strip)
        when /\A(Spotted|Suggested|Investigation|earlier work|Aggregated)\s+by\s+(.*)/i
          # Spotted by Kevin Bullock
          # Suggested by Carl Youngblood
          # Investigation by Scott
          # earlier work by Michael Neumann
          # Aggregated by schoenm ~ at ~ earthlink.net
          $2
        when /\A(?:DHH\s*)?via\s+(.*)/i
          # DHH via Jay Fields
          # via Tim Bray
          $1
        when CONNECTORS_REGEXP # There are lots of these, even with a combination of connectors.
          # [Adam Milligan, Pratik]
          # [Rick Olson/Nicholas Seckar]
          # [Kevin Clark & Jeremy Hopple]
          # Yehuda Katz + Carl Lerche
          # Nick Quaranto and Josh Nichols
          name.split(CONNECTORS_REGEXP).map(&:strip).reject do |part|
            part == 'others' || # foamdino ~ at ~ gmail.com/others
            part == '?'         # Sam Stephenson/?
          end
        else
          # just return the candidate back
          name
      end
    end
  end
end

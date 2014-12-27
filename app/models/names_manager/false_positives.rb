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
        when /\A\d+/
          # Remove side effects of [5684]
          nil
        when /#\d+/
          # Closes #123, Fixes #123, #123 state:resolved, etc.
          nil
        when /GH-\d+/
          # Closes GH-123
          nil
        when /\A\s*\z/
          nil
        when /^See rails ML/, /RAILS_ENV/
          nil
        when /RubyConf/
          # RubyConf '05
          nil
        when /\AIncludes duplicates of changes/
          # Includes duplicates of changes from 1.1.4 - 1.2.3
          nil
        when 'update from Trac'
          nil
        when /\A['":]/ # ' # this quote fixes JavaScript syntax highlighting
          # Instead of checking Rails.env.test? in Failsafe middleware, check env["rails.raise_exceptions"]
          # ... This lets ajax pages still use format.js despite there being no params[:format]
          nil
        when 'RC1'
          # Prepare for Rails 2.2.0 [RC1]
          nil
        when /\Astat(e|us):/
          # Fixed problem causes by leftover backup templates ending in tilde [state:committed #969]
          # Added ActionController::Translation module delegating to I18n #translate/#t and #localize/#l [status:committed #1008]
          nil
        when /\A#https/
          # Signed-off-by: Michael Koziarski <michael\100koziarski.com> [#https://rails.lighthouseapp.com/attachments/106066/0001-Ensure-SqlBypass-use-ActiveRecord-Base-connection.patch state:committed]
          nil
        when /\Ahttps:\/\/github\.com\/rails\/rails\/issues\/\d+/
          # [https://github.com/rails/rails/issues/11834]
          nil
        when '\\x00-\\x1f'
          #  Fix ActiveSupport::JSON encoding of control characters [\x00-\x1f]
          nil
        when /\ACVE-[\d-]+\z/i
          # fix protocol checking in sanitization [CVE-2013-1857]
          nil
        when 'and'
          # see https://github.com/rails/rails/commit/d891ad4e92c4f4d854ba321c42000026b5c75187
          nil
        when 'options'
          # see https://github.com/rails/rails/commit/bf176e9c7a1aa46b021384b91f4f9ec9a1132c0f
          nil
        when 'API DOCS'
          # see https://github.com/rails/rails/commit/9726ed8caf245c8702a781c9656f2b143a85f0f5
          nil
        when 'ed3796434af6069ced6a641293cf88eef3b284da'
          # see https://github.com/rails/rails/commit/509aa663601defc7c821c253d010605951e9d986
          nil
        when 'hat-tip to anathematic'
          # see https://github.com/rails/rails/commit/b67dc00eae310f61e02f1cae27ec78eb8c1c599b
          nil
        when 'props to Zarathu in #rubyonrails'
          # see https://github.com/rails/rails/commit/09b7e351316cb87a815678241fc90af549327cf3
          nil
        when 'thanks Pratik!'
          # see https://github.com/rails/rails/commit/a6467802ff2be35c6665635f1cdfdcea07aeaa12
          nil
        when 'type="month"'
          # see https://github.com/rails/rails/commit/b02d14aad515a039c284c93a68845503dc1658e2
          nil
        when 'multiple=true'
          # see https://github.com/rails/rails/commit/e591d14b9c4a1220dc55c93c01a81ad6219c1f2f
          nil
        when 'extras no-cache max-age public must-revalidate'
          # see https://github.com/rails/rails/commit/e3123815898145888fe84f053b14f5cfc33c1684
          nil
        when /ci[ _-]s?kip/i
          # see https://github.com/rails/rails/commit/86c5cea9f414d34fd92adb064fde5ecc7b40c727
          #     https://github.com/rails/rails/commit/86c5cea9f414d34fd92adb064fde5ecc7b40c727
          #     https://github.com/rails/rails/commit/d9e8ec61a4988f3836d8c6aa830b6ffd6a3a940a
          nil
        when /skip[ _-]ci/i
          # see https://github.com/rails/rails/commit/b1c28d710521c6931abc2b394de34ac8a174d844
          nil
        when 'ci skp'
          # see https://github.com/rails/rails/commit/94e8fc06199d385174ff4d66a0be4d23e2d45f2f
          nil
        when 'ci ski'
          # see https://github.com/rails/rails/commit/1c2717d3f5a3ce0ea97f832d1d008e053ad47acd
          nil
        when 'AR:postgres'
          # see https://github.com/rails/rails/commit/d7b8f0c05945af83bb1ca446e23a26d8f99db2ca
          nil
        when 'for 3-2-stable'
          # see https://github.com/rails/rails/commit/b003ddf2aea1cec218604b62843faefef4b62a22
          nil
        when 'key'
          # see https://github.com/rails/rails/commit/98f4aee8dac22d9e9bb3c122b43e9e5ee8ba7d1c
          nil
        when /-> request/
          # see https://github.com/rails/rails/commit/fb9c00116bb7277f61a9d3ef5c399457f26056a4
          nil
        when /Bar::Engine/
          # see https://github.com/rails/rails/commit/0e69705b0fc7501bada74b3ca023ae7f7b2b8592
          nil
        when '#'
          # see https://github.com/rails/rails/commit/dd0040d19f2b161201fd54e21fc807fb987f016d
          nil
        when 'rounds #8213'
          # see https://github.com/rails/rails/commit/a8c3ea90f1490da4404aa1cea6fc6209f6b9b99b
          nil
        when 'Reopen/backport'
          # See https://github.com/rails/rails/commit/66e87b714b406a25af60156a1fa15d1ebb99a0bd
          nil
        when '.lock'
          # See https://github.com/rails/rails/commit/c71b9612c0dde4146bee86679e6319a913c24834
          nil
        when 'Constant3 Constant1'
          # See https://github.com/rails/rails/commit/3335cb7f12f059c8db8cc5195ef214d3215edf44
          nil
        when /\AFix for/
          # See https://github.com/rails/rails/commit/5d0d82957ae2658a576f5785506a52cfe03d0758
          nil
        when 'GET'
          # see https://github.com/rails/rails/commit/6871bd9818a9a7d9d8c7e21e253d64c0410fde1d
          nil
        when 'test/unit/bar_test.rb ...'
          # see https://github.com/rails/rails/commit/b4df25366a3c8f133f8329bc35f1d53926704b5a
          nil
        when 'association=(associate)'
          # see https://github.com/rails/rails/commit/ebd7cc6f459e43aa03a6b8095266888909e0ee4d
          #     https://github.com/rails/rails/commit/d881f61f84b6bbdc8ec8aeaee114d03be7630f72
          nil
        when 'master'
          # see https://github.com/rails/rails/commit/06198ed7ad822145e24d9aa964aba97bdb0f8b39
          #     https://github.com/rails/rails/commit/9b6a434defe7aed00f01643abdbc79751dc9d5f1
          nil
        when '#{arel.where_sql}'
          # see https://github.com/rails/rails/commit/90a0471af15808c12e32b9927cf7e37ccfaa0558
          nil
        when 'WHERE ()'
          # see https://github.com/rails/rails/commit/63b80b5b58097e2d280b8c71acefecf0f5d3f47b
          #     https://github.com/rails/rails/commit/055ebcc2cce7bcc034eb657c3e60f4c27bb13204
          #     https://github.com/rails/rails/commit/f766abd4cf3eb75469d3646cfb6d85e668c619f3
          nil
        when 'nothing'
          # see https://github.com/rails/rails/commit/ee65f48c2666a660cc48496c8bc9f63113a41e44
          nil
        when 'password'
          # see https://github.com/rails/rails/commit/1851af84c1c7244dc416be9c93a4700b70e801e3
          nil
        when 'x86_64-darwin10.4.0'
          # see https://github.com/rails/rails/commit/83ecd03e7d3472c16decbf1b9939da53347b36a3
          nil
        when '/Users/senny/.rbenv/versions/2.0.0-p353/bi...'
          # see https://github.com/rails/rails/commit/67d4dc2bdb27648a61e153996d629b44834a9de4
          nil
        when '| <dir> | @<archive> | -C <dir>'
          # see https://github.com/rails/rails/commit/3fa4e1671fcf903069df88071c473f3a186ee896
          nil
        when 'darwin-x86_64'
          # see https://github.com/rails/rails/commit/e428ddececf43923dec4299c40b29451e5bea80d
          nil
        when /Author.find\([12]\)/
          # see https://github.com/rails/rails/commit/8062a307942cb3f7a83bfc1a8cd81e3a1f8edc5b
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

require 'set'

module NamesManager

  # Returns a set with all (canonical) contributor names known by the application.
  def self.all_names
    Set.new(Contributor.connection.select_values("SELECT NAME FROM CONTRIBUTORS"))
  end

  # Determines whether names mapping or special cases handling have been updated
  # since +ts+.
  def self.mapping_updated_since?(ts)
    File.mtime(__FILE__) > ts
  end

  # Simple trick to be able to publish this file with readable addresses.
  def self.email(user, domain)
    user + '@' + domain
  end

  # Some people appear in Rails logs under different names, there are nicks,
  # typos, email addresses, shortenings, etc. This is a hand-made list to map
  # them in order to be able to aggregate commits from the same real author.
  #
  # This mapping does not use regexps on purpose, it is more robust to put the
  # exact string equivalences. The manager has to be very strict about this.
  SEEN_ALSO_AS = {
    # canonical name            => handlers, emails, typos, etc.
    'alancfrancis'              => email('alancfrancis', 'gmail.com'),
    'Aliaksey Kandratsenka'     => 'Aleksey Kondratenko',
    'Andrew Kaspick'            => [email('akaspick', 'gmail.com'), 'akaspick'],
    'Andrew White'              => 'pixeltrix',
    'Anthony Eden'              => 'aeden',
    'Blaine'                    => ['blaine', email('blaine', 'odeo.com')],
    'Bob Silva'                 => 'BobSilva',
    'Brad Greenlee'             => 'bgreenlee',
    'Brandon Keepers'           => ['brandon', email('brandon', 'opensoul.org')],
    'Brian Donovan'             => 'eventualbuddha',
    'Cheah Chu Yeow'            => ['Chu Yeow', 'chuyeow'],
    'court3nay'                 => ['courtenay', email('court3nay', 'gmail.com')],
    'Chris Kampmeier'           => 'kampers',
    'Chris McGrath'             => [email('c.r.mcgrath', 'gmail.com'), 'c.r.mcgrath', email('chris', 'octopod.info'), 'octopod'],
    'Chris Mear'                => [email('chris', 'feedmechocolate.com'), 'chrismear'],
    "Chris O'Sullivan"          => 'thechrisoshow',
    'Chris Roos'                => 'chrisroos',
    'Coda Hale'                 => 'codahale',
    'Cody Fauser'               => email('codyfauser', 'gmail.com'),
    'Damian Janowski'           => 'djanowski',
    'Dan Manges'                => 'dcmanges',
    'Daniel Morrison'           => 'danielmorrison',
    'Daniel Rodríguez Troitiño' => 'drodriguez',
    'Dave Thomas'               => [email('dave', 'pragprog.com'), 'pragdave'],
    'David Dollar'              => 'ddollar',
    'David Heinemeier Hansson'  => 'DHH',
    'Dee Zsombor'               => ['Dee.Zsombor', 'zsombor', email('Dee.Zsombor', 'gmail.com')],
    'Don Park'                  => email('don.park', 'gmail.com'),
    'Dr Nic'                    => 'drnic',
    'Dreamer3'                  => email('dreamer3', 'gmail.com'),
    'Duane Johnson'             => email('duane.johnson', 'gmail.com'),
    'Duncan Beevers'            => 'duncanbeevers',
    'Elijah Miller'             => [email('elijah.miller', 'gmail.com'), 'jqr'],
    'Eloy Duran'                => 'alloy',
    'Emilio Tagua'              => 'miloops',
    'Ernesto Jimenez'           => 'ernesto.jimenez',
    'Evan Weaver'               => 'evan',
    'François Beausoleil'       => ['FranÃ§ois Beausolei', 'Francois Beausoleil', email('fbeausoleil', 'ftml.net'), email('francois.beausoleil', 'gmail.com')],
    'Frederick Cheung'          => ['fcheung', 'Fred Cheung', 'frederick.cheung', email('frederick.cheung', 'gmail.com')],
    'Gabe da Silveira'          => 'dasil003',
    'Geoff Buesing'             => ['gbuesing', 'Geoffrey Buesing'],
    'Geoff Garside'             => 'ggarside',
    'Grant Hollingworth'        => email('grant', 'antiflux.org'),
    'Hampton Catlin'            => email('hcatlin', 'gmail.com'),
    'Hongli Lai (Phusion)'      => ['FooBarWidget', 'Hongli Lai'],
    'Ian White'                 => email('ian.w.white', 'gmail.com'),
    'Isaac Feliu'               => 'isaacfeliu',
    'Jack Danger Canty'         => %w(danger Danger),
    'Jakob Skjerning'           => ['Jakob S', email('jakob', 'mentalized.net')],
    'Jarkko Laine'              => [email('jarkko', 'jlaine.net'), 'Jarkko', 'jarkko'],
    'James Adam'                => ['lazyatom', email('james.adam', 'gmail.com')],
    'James Mead'                => 'floehopper',
    'Jamie van Dyke'            => 'fearoffish',   
    'Jan De Poorter'            => 'DefV',
    'Jeffrey Hardy'             => 'packagethief',
    'Jeremy Evans'              => [email('jeremyevans0', 'gmail.com'), 'jeremyevans'],
    'Jeremy Kemper'             => 'bitsweat',
    'Jeremy McAnally'           => ['jeremymcnally', 'jeremymcanally'],
    'Johan Sørensen'            => 'Johan Sorensen',
    'John Barnette'             => 'jbarnette',
    'Jonathan del Strother'     => ['Catfish', 'catfish'],
    'Jonathan Viney'            => email('jonathan', 'bluewire.net.nz'),
    'Jonathan Weiss'            => 'jweiss',
    'Jordi Bunster'             => 'jordi',
    'José Valim'                => 'josevalim',
    'Josh Knowles'              => email('joshknowles', 'gmail.com'),
    'Josh Peek'                 => ['josh', 'Josh', 'Joshua Peek', 'joshpeek', email('josh', 'joshpeek.com')],
    'Josh Starcher'             => email('josh.starcher', 'gmail.com'),
    'Josh Susser'               => ['hasmanyjosh', email('josh', 'hasmanythrough.com')],
    'Joshua Sierles'            => 'jsierles',
    'Juanjo Bazan'              => 'juanjo.bazan',
    'Justin French'             => 'justinfrench',
    'Kamal Fariz Mahyuddin'     => 'kamal',
    'Ken Barker'                => email('ken.barker', 'gmail.com'),
    'Ken Kunz'                  => email('kennethkunz', 'gmail.com'),
    'Ken Miller'                => email('kenneth.miller', 'bitfield.net'),
    'Kevin Clark'               => ["Kevin Clark #{email('kevin.clark', 'gmail.com')}", email('kevin.clark', 'gmail.com'), email('kevin.clark', 'gmal.com')],
    'Kristopher Chambers'       => [email('kristopher.chambers', 'gmail.com'), 'kris_chambers'],
    'Lars Pind'                 => [email('lars', 'pinds.com'), email('lars', 'pind.com'), 'Lars pind', 'lars pind'],
    'lmarlow'                   => email('lmarlow', 'yahoo.com'),
    'Lawrence Pit'              => 'lawrence',
    'Luca Guidi'                => 'l.guidi',
    'Luismi Cavallé'            => 'cavalle',
    'Luke Redpath'              => email('contact', 'lukeredpath.co.uk'),
    'Manfred Stienstra'         => [email('m.stienstra', 'fngtps.com'), 'manfred'],
    'Marcel Molina Jr.'         => ['Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio'],
    'Mark Imbriaco'             => email('mark.imbriaco', 'pobox.com'),
    'Mark Somerville'           => 'Spakman',
    'Martin Emde'               => [email('zraii', 'comcast.net'), email('martin.emde', 'gmail.com')],
    'Matthew Rudy Jacobs'       => 'MatthewRudy',
    'Michael Klishin'           => ['antares', 'Michael S. Klishin'],
    'Michael Koziarski'         => %w(Koz nzkoz),
    'Michael Schoen'            => ['Michael A. Schoen', email('schoenm', 'earthlink.net')],
    'Michael Schubert'          => [email('michael', 'schubert'), email('michael', 'schubert.cx')],
    'Michael Schuerig'          => [email('michael', 'schuerig.de'), 'Michael Shuerig'],
    'Mike Gunderloy'            => email('mike', 'clarkware.com'),
    'Mike Naberezny'            => 'mnaberez',
    'Mikel Lindsaar'            => ['mikel', 'raasdnil'],
    'Mislav Marohnić'           => ['mislav', 'mislaw', email('mislav', 'nippur.irb.hr')],
    'Murray Steele'             => 'h-lame',
    'Nathan Weizenbaum'         => 'Nex3',
    'Nick Sieger'               => ['nicksieger', email('nicksieger', 'gmail.com')],
    'Nik Wakelin'               => 'nik.wakelin',
    'Norbert Crombach'          => 'norbert',
    'Obie Fernandez'            => 'ObieFernandez',
    'Patrick Lenz'              => email('patrick', 'lenz.sh'),
    'pburleson'                 => email('pburleson', 'gmail.com'),
    'Philip Hallstrom'          => 'phallstrom',
    'Pratik Naik'               => %w(Pratik pratik lifofifo lifo),
    'Rick Bradley'              => email('rick', 'rickbradley.com'),
    'Rich Collins'              => ['richcollins', email('richcollins', 'gmail.com')],
    'Rick Olson'                => ['rick', 'Rick', 'Rick Olsen', email('technoweenie', 'gmail.com')],
    'RSL'                       => ['rsl', 'Russell Norris'],
    'Rob Biedenharn'            => ['rabiedenharn', email('Rob', 'AgileConsultingLLC.com')],
    'Rob Sanheim'               => ['rsanheim', email('rsanheim', 'gmail.com'), email('rob', 'thinkrelevance.com')],
    'Robby Russell'             => 'robbyrussell',
    'Roderick van Domburg'      => 'roderickvd',
    'Ruy Asan'                  => 'rubyruy',
    'Ryan Bates'                => 'ryanb',
    'Ryan Bigg'                 => 'Radar',
    'Ryan Davis'                => 'zenspider',
    'Ryan Daigle'               => 'rwdaigle',
    'Ryan Tomayko'              => email('rtomayko', 'gmail.com'),
    'Sam Granieri'              => 'sjgman9',
    'Sebastian Delmont'         => email('sd', 'notso.net'),
    'Sebastian Kanthak'         => [email('sebastian.kanthak', 'muehlheim.de'), 'sebastian.kanthak', 'skanthak'],
    'Seth Rasmussen'            => 'loincloth',
    'Shugo Maeda'               => ['shugo', email('shugo', 'ruby-lang.org')],
    'Simon Moore'               => 'saimonmoore',
    'Simon Stapleton'           => email('simon.stapleton', 'gmail.com'),
    'Stefan Kaes'               => [email('skaes', 'web.de'), 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de', 'stefan', 'Stefan'],
    'Steve Purcell'             => email('stephen_purcell', 'yahoo.com'),
    'Steven Bristol'            => 'stevenbristol',
    'Steven Soroka'             => [email('ssoroka78', 'gmail.com'), 'ssoroka'],
    'Tarmo Tänav'               => ['tarmo', 'tarmo_t', 'Tarmo Täna'],
    'Thijs van der Vossen'      => ['thijsv', email('thijs', 'vandervossen.net'), email('thijs', 'fngtps.com')],
    'Thomas Fuchs'              => email('thomas', 'fesch.at'),
    'Tiago Macedo'              => 'tmacedo',
    'Tieg Zaharia'              => 'tzaharia',
    'Tim Pope'                  => ['tpope', 'Time Pope', email('rails', 'tpope.info'), 'pope'],
    'Tobias Lütke'              => ['Tobias Luetke', 'TobiasLuetke'],
    'Tom Brice'                 => ['tomtoday', email('tomtoday', 'gmail.com')],
    'Tom Ward'                  => ['Tom ward', 'tomafro', email('tom', 'popdog.net')],
    'Victor Jalencas'           => email('victor-ronr-trac', 'carotena.net'),
    'Will Bryant'               => 'will.bryant',
    'Xavier Noria'              => 'fxn',
    'Xavier Shay'               => 'xaviershay',
    'Yehuda Katz'               => 'wycats',
    'Zach Dennis'               => 'zdennis',
    # canonical name            => handlers, emails, etc.
  }

  # Reverse SEEN_ALSO_AS to be able to go from handler to canonical name.
  CANONICAL_NAME_FOR = {}
  SEEN_ALSO_AS.each do |name, also_as|
    [*also_as].each { |alt| CANONICAL_NAME_FOR[alt] = name }
  end

  # Returns the canonical name for +name+.
  #
  # Email addresses are removed, leading/trailing whitespace is ignored. If no
  # equivalence is known the canonical name is the resulting sanitized string
  # by definition.
  def self.canonical_name_for(name)
    name = name.sub(/<[^>]+>/, '') # remove any email address in angles
    name.strip!
    CANONICAL_NAME_FOR[name] || name
  end

  def self.special_cases
    code = File.read(__FILE__)
    code =~ /(^  #[^\n]+\n)+  def self\.handle_special_cases.*?^  end/m
    $&
  end

  CONNECTORS_REGEXP = %r{[,/&+]}

  # In some cases author names are extracted from svn messages. We look there
  # for stuff between brackets, but that's not always an author name. There
  # are lots of exceptions this method knows about.
  #
  # Note that this method is responsible for extracting names as they appear
  # in the original string, and correct typos if needed. Canonicalization is
  # done elsewhere.
  def self.handle_special_cases(name, fallback)
    case name
      when /\A#?\d+/
        # Remove side effects of [5684]
        # Ensure WhiteListSanitizer allows dl tag [#2393 state:resolved]
        fallback
      when /\A\s*\z/
        fallback
      when /^See rails ML/, /RAILS_ENV/
        fallback
      when /RubyConf/
        # RubyConf '05
        fallback
      when /\AIncludes duplicates of changes/
        # Includes duplicates of changes from 1.1.4 - 1.2.3
        fallback
      when 'update from Trac'
        fallback
      when /\A['":]/
        # Instead of checking Rails.env.test? in Failsafe middleware, check env["rails.raise_exceptions"]
        # ... This lets ajax pages still use format.js despite there being no params[:format]
        fallback
      when 'RC1'
        # Prepare for Rails 2.2.0 [RC1]
        fallback
      when /\Astat(e|us):/
        # Fixed problem causes by leftover backup templates ending in tilde [state:committed #969]
        # Added ActionController::Translation module delegating to I18n #translate/#t and #localize/#l [status:committed #1008]
        fallback
      when /\A#https/
        # Signed-off-by: Michael Koziarski <michael@koziarski.com> [#https://rails.lighthouseapp.com/attachments/106066/0001-Ensure-SqlBypass-use-ActiveRecord-Base-connection.patch state:committed]
        fallback
      when 'Marcel Mollina Jr.'
        # typo, there are two ls
        'Marcel Molina Jr.'
      when 'Tobias Luekte'
        # typo
        'Tobias Lütke'
      when 'Rich Olson'
        # typo
        'Rick Olson'
      when 'skae', 'skaen'
        # typo
        'skaes'
      when 'Thanks to Austin Ziegler for Transaction::Simple'
        'Austin Ziegler'
      when 'Hongli Lai (Phusion'
        'Hongli Lai (Phusion)'
      when 'Leon Bredt'
        'Leon Breedt'
      when 'nik.wakelin Koz'
        ['nik.wakelin', 'Koz']
      when 'Jim Remsik and Tim Pope'
        ['Jim Remsik', 'Tim Pope']
      when 'Jeremy Hopple and Kevin Clark'
        ['Jeremy Hopple', 'Kevin Clark']
      when 'Yehuda Katz and Carl Lerche'
        ['Yehuda Katz', 'Carl Lerche']
      when 'Ross Kaffenburger and Bryan Helmkamp'
        ['Ross Kaffenberger', 'Bryan Helmkamp'] # Kaffenberger is correct
      when "#{email('me', 'jonnii.com')} #{email('rails', 'jeffcole.net')} Marcel Molina Jr."
        [email('me', 'jonnii.com'), email('rails', 'jeffcole.net'), 'Marcel Molina Jr.']
      when "#{email('jeremy', 'planetargon.com')} Marcel Molina Jr."
        [email('jeremy', 'planetargon.com'), 'Marcel Molina Jr.']
      when "#{email('matt', 'mattmargolis.net')} Marcel Molina Jr."
        [email('matt', 'mattmargolis.net'), 'Marcel Molina Jr.']
      when "#{email('doppler', 'gmail.com')} #{email('phil.ross', 'gmail.com')}"
        [email('doppler', 'gmail.com'), email('phil.ross', 'gmail.com')]
      when 'After much pestering from Dave Thomas'
        'Dave Thomas'
      when '=?utf-8?q?Adam=20Cig=C3=A1nek?='
        'Adam Cigánek'
      when 'Aredridel/earlier work by Michael Neumann'
        ['Aredridel', 'Michael Neumann']
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
      when 'nbugajski/cavelle'
        %w(nbugajski cavalle) # "cavelle" has a typo
      when CONNECTORS_REGEXP # There are lots of these, even with a combination of connectors.
        # [Adam Milligan, Pratik]
        # [Rick Olson/Nicholas Seckar]
        # [Kevin Clark & Jeremy Hopple]
        # Yehuda Katz + Carl Lerche
        name.split(CONNECTORS_REGEXP).map(&:strip).reject do |part|
          part == 'others' || # foamdino ~ at ~ gmail.com/others
          part == '?'         # Sam Stephenson/?
        end
      else
        name
    end
  end
end

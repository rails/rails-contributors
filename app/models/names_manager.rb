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
  def self.e(user, domain)
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
    'alancfrancis'              => e('alancfrancis', 'gmail.com'),
    'Aliaksey Kandratsenka'     => 'Aleksey Kondratenko',
    'Andrew Kaspick'            => [e('akaspick', 'gmail.com'), 'akaspick'],
    'Andrew White'              => 'pixeltrix',
    'Anthony Eden'              => 'aeden',
    'Ben Scofield'              => 'bscofield',
    'Blaine'                    => ['blaine', e('blaine', 'odeo.com')],
    'Bob Silva'                 => 'BobSilva',
    'Brad Greenlee'             => 'bgreenlee',
    'Brandon Keepers'           => ['brandon', e('brandon', 'opensoul.org')],
    'Brian Donovan'             => 'eventualbuddha',
    'Cheah Chu Yeow'            => ['Chu Yeow', 'chuyeow'],
    'Chris Kampmeier'           => 'kampers',
    'Chris McGrath'             => [e('c.r.mcgrath', 'gmail.com'), 'c.r.mcgrath', e('chris', 'octopod.info'), 'octopod'],
    'Chris Mear'                => [e('chris', 'feedmechocolate.com'), 'chrismear'],
    "Chris O'Sullivan"          => 'thechrisoshow',
    'Chris Roos'                => 'chrisroos',
    'Coda Hale'                 => 'codahale',
    'Cody Fauser'               => e('codyfauser', 'gmail.com'),
    'Courtenay Gasking'         => ['court3nay', 'courtenay', e('court3nay', 'gmail.com')],
    'Damian Janowski'           => 'djanowski',
    'Dan Manges'                => 'dcmanges',
    'Daniel Morrison'           => 'danielmorrison',
    'Daniel Rodríguez Troitiño' => 'drodriguez',
    'Dave Thomas'               => [e('dave', 'pragprog.com'), 'pragdave'],
    'David Calavera'            => ['calavera', 'david.calavera'],
    'David Dollar'              => 'ddollar',
    'David Heinemeier Hansson'  => 'DHH',
    'Dee Zsombor'               => ['Dee.Zsombor', 'zsombor', e('Dee.Zsombor', 'gmail.com')],
    'Don Park'                  => e('don.park', 'gmail.com'),
    'Dr Nic'                    => 'drnic',
    'Duane Johnson'             => e('duane.johnson', 'gmail.com'),
    'Duncan Beevers'            => 'duncanbeevers',
    'Elijah Miller'             => [e('elijah.miller', 'gmail.com'), 'jqr'],
    'Eloy Duran'                => 'alloy',
    'Emilio Tagua'              => 'miloops',
    'Ernesto Jimenez'           => 'ernesto.jimenez',
    'Evan Weaver'               => 'evan',
    'François Beausoleil'       => ['FranÃ§ois Beausolei', 'Francois Beausoleil', e('fbeausoleil', 'ftml.net'), e('francois.beausoleil', 'gmail.com')],
    'Frederick Cheung'          => ['fcheung', 'Fred Cheung', 'frederick.cheung', e('frederick.cheung', 'gmail.com')],
    'Gabe da Silveira'          => 'dasil003',
    'Geoff Buesing'             => ['gbuesing', 'Geoffrey Buesing'],
    'Geoff Garside'             => 'ggarside',
    'Grant Hollingworth'        => e('grant', 'antiflux.org'),
    'Hampton Catlin'            => e('hcatlin', 'gmail.com'),
    'Hongli Lai (Phusion)'      => ['FooBarWidget', 'Hongli Lai', 'Hongli Lai (Phusion'],
    'Ian White'                 => e('ian.w.white', 'gmail.com'),
    'Isaac Feliu'               => 'isaacfeliu',
    'Jack Danger Canty'         => %w(danger Danger),
    'Jakob Skjerning'           => ['Jakob S', e('jakob', 'mentalized.net')],
    'Jarkko Laine'              => [e('jarkko', 'jlaine.net'), 'Jarkko', 'jarkko'],
    'James Adam'                => ['lazyatom', e('james.adam', 'gmail.com')],
    'James Mead'                => 'floehopper',
    'Jamie van Dyke'            => 'fearoffish',
    'Jan De Poorter'            => 'DefV',
    'Jeffrey Hardy'             => 'packagethief',
    'Jeremy Evans'              => [e('jeremyevans0', 'gmail.com'), 'jeremyevans'],
    'Jeremy Kemper'             => 'bitsweat',
    'Jeremy McAnally'           => ['jeremymcnally', 'jeremymcanally'],
    'Johan Sørensen'            => ['Johan Sorensen', 'Johan Sörensen'],
    'John Barnette'             => 'jbarnette',
    'Jonathan del Strother'     => ['Catfish', 'catfish'],
    'Jonathan Viney'            => e('jonathan', 'bluewire.net.nz'),
    'Jonathan Weiss'            => 'jweiss',
    'Jordi Bunster'             => 'jordi',
    'José Valim'                => 'josevalim',
    'Josh Goebel'               => ['Dreamer3', e('dreamer3', 'gmail.com')],
    'Josh Knowles'              => e('joshknowles', 'gmail.com'),
    'Josh Peek'                 => ['josh', 'Josh', 'Joshua Peek', 'joshpeek', e('josh', 'joshpeek.com')],
    'Josh Starcher'             => e('josh.starcher', 'gmail.com'),
    'Josh Susser'               => ['hasmanyjosh', e('josh', 'hasmanythrough.com')],
    'Joshua Sierles'            => 'jsierles',
    'Juanjo Bazan'              => 'juanjo.bazan',
    'Justin French'             => 'justinfrench',
    'Kamal Fariz Mahyuddin'     => 'kamal',
    'Karel Miarka'              => 'kajism@yahoo.com',
    'Ken Barker'                => e('ken.barker', 'gmail.com'),
    'Ken Kunz'                  => e('kennethkunz', 'gmail.com'),
    'Ken Miller'                => e('kenneth.miller', 'bitfield.net'),
    'Kevin Clark'               => ["Kevin Clark #{e('kevin.clark', 'gmail.com')}", e('kevin.clark', 'gmail.com'), e('kevin.clark', 'gmal.com')],
    'Kristopher Chambers'       => [e('kristopher.chambers', 'gmail.com'), 'kris_chambers'],
    'Lars Pind'                 => [e('lars', 'pinds.com'), e('lars', 'pind.com'), 'Lars pind', 'lars pind'],
    'lmarlow'                   => e('lmarlow', 'yahoo.com'),
    'Lawrence Pit'              => 'lawrence',
    'Leon Breedt'               => 'Leon Bredt',
    'Luca Guidi'                => 'l.guidi',
    'Luismi Cavallé'            => ['cavalle', 'cavelle'],
    'Luke Redpath'              => e('contact', 'lukeredpath.co.uk'),
    'maiha'                     => ['anna', e('anna', 'wota.jp'), e('maiha', 'wota.jp')],
    'Manfred Stienstra'         => [e('m.stienstra', 'fngtps.com'), 'manfred'],
    'Marcel Molina Jr.'         => ['Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio', 'Marcel Mollina Jr.'],
    'Mark Imbriaco'             => e('mark.imbriaco', 'pobox.com'),
    'Mark Somerville'           => 'Spakman',
    'Mark Van Holstyn'          => 'lotswholetime',
    'Martin Emde'               => [e('zraii', 'comcast.net'), e('martin.emde', 'gmail.com')],
    'Matthew Rudy Jacobs'       => 'MatthewRudy',
    'Michael Galero'            => 'mikong',
    'Michael Klishin'           => ['antares', 'Michael S. Klishin'],
    'Michael Koziarski'         => %w(Koz nzkoz),
    'Michael Schoen'            => ['Michael A. Schoen', e('schoenm', 'earthlink.net')],
    'Michael Schubert'          => [e('michael', 'schubert'), e('michael', 'schubert.cx')],
    'Michael Schuerig'          => [e('michael', 'schuerig.de'), 'Michael Shuerig'],
    'Mike Gunderloy'            => e('mike', 'clarkware.com'),
    'Mike Naberezny'            => 'mnaberez',
    'Mikel Lindsaar'            => ['mikel', 'raasdnil'],
    'Mislav Marohnić'           => ['mislav', 'mislaw', e('mislav', 'nippur.irb.hr')],
    'Murray Steele'             => 'h-lame',
    'Nathan Weizenbaum'         => 'Nex3',
    'Nick Sieger'               => ['nicksieger', e('nicksieger', 'gmail.com')],
    'Nik Wakelin'               => 'nik.wakelin',
    'Norbert Crombach'          => 'norbert',
    'Obie Fernandez'            => 'ObieFernandez',
    'Patrick Lenz'              => e('patrick', 'lenz.sh'),
    'pburleson'                 => e('pburleson', 'gmail.com'),
    'Philip Hallstrom'          => 'phallstrom',
    'Pratik Naik'               => %w(Pratik pratik lifofifo lifo),
    'Rick Bradley'              => e('rick', 'rickbradley.com'),
    'Rich Collins'              => ['richcollins', e('richcollins', 'gmail.com')],
    'Rick Olson'                => ['rick', 'Rick', 'Rick Olsen', e('technoweenie', 'gmail.com'), 'Rich Olson'],
    'RSL'                       => ['rsl', 'Russell Norris'],
    'Rob Biedenharn'            => ['rabiedenharn', e('Rob', 'AgileConsultingLLC.com')],
    'Rob Sanheim'               => ['rsanheim', e('rsanheim', 'gmail.com'), e('rob', 'thinkrelevance.com')],
    'Robby Russell'             => 'robbyrussell',
    'Roderick van Domburg'      => 'roderickvd',
    'Ross Kaffenberger'         => 'Ross Kaffenburger',
    'Ruy Asan'                  => 'rubyruy',
    'Ryan Bates'                => 'ryanb',
    'Ryan Bigg'                 => 'Radar',
    'Ryan Davis'                => 'zenspider',
    'Ryan Daigle'               => 'rwdaigle',
    'Ryan Tomayko'              => e('rtomayko', 'gmail.com'),
    'Sam Granieri'              => 'sjgman9',
    'Scott Reilly'              => 'coffee2code',
    'Sebastian Delmont'         => e('sd', 'notso.net'),
    'Sebastian Kanthak'         => [e('sebastian.kanthak', 'muehlheim.de'), 'sebastian.kanthak', 'skanthak'],
    'Seth Rasmussen'            => 'loincloth',
    'Shugo Maeda'               => ['shugo', e('shugo', 'ruby-lang.org')],
    'Simon Moore'               => 'saimonmoore',
    'Simon Stapleton'           => e('simon.stapleton', 'gmail.com'),
    'Stefan Kaes'               => [e('skaes', 'web.de'), 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de', 'stefan', 'Stefan', 'skae', 'skaen'],
    'Steve Purcell'             => e('stephen_purcell', 'yahoo.com'),
    'Steven Bristol'            => 'stevenbristol',
    'Steven Soroka'             => [e('ssoroka78', 'gmail.com'), 'ssoroka'],
    'Tarmo Tänav'               => ['tarmo', 'tarmo_t', 'Tarmo Täna'],
    'Thijs van der Vossen'      => ['thijsv', e('thijs', 'vandervossen.net'), e('thijs', 'fngtps.com')],
    'Thomas Fuchs'              => e('thomas', 'fesch.at'),
    'Tiago Macedo'              => 'tmacedo',
    'Tieg Zaharia'              => 'tzaharia',
    'Tim Pope'                  => ['tpope', 'Time Pope', e('rails', 'tpope.info'), 'pope'],
    'Tobias Lütke'              => ['Tobias Luetke', 'TobiasLuetke', 'Tobias Luekte'],
    'Tom Brice'                 => ['tomtoday', e('tomtoday', 'gmail.com')],
    'Tom Ward'                  => ['Tom ward', 'tomafro', e('tom', 'popdog.net')],
    'Victor Jalencas'           => e('victor-ronr-trac', 'carotena.net'),
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
      when 'Thanks to Austin Ziegler for Transaction::Simple'
        'Austin Ziegler'
      when 'nik.wakelin Koz'
        ['nik.wakelin', 'Koz']
      when 'Jim Remsik and Tim Pope'
        ['Jim Remsik', 'Tim Pope']
      when 'Jeremy Hopple and Kevin Clark'
        ['Jeremy Hopple', 'Kevin Clark']
      when 'Yehuda Katz and Carl Lerche'
        ['Yehuda Katz', 'Carl Lerche']
      when 'Ross Kaffenburger and Bryan Helmkamp'
        ['Ross Kaffenburger', 'Bryan Helmkamp']
      when "#{e('me', 'jonnii.com')} #{e('rails', 'jeffcole.net')} Marcel Molina Jr."
        [e('me', 'jonnii.com'), e('rails', 'jeffcole.net'), 'Marcel Molina Jr.']
      when "#{e('jeremy', 'planetargon.com')} Marcel Molina Jr."
        [e('jeremy', 'planetargon.com'), 'Marcel Molina Jr.']
      when "#{e('matt', 'mattmargolis.net')} Marcel Molina Jr."
        [e('matt', 'mattmargolis.net'), 'Marcel Molina Jr.']
      when "#{e('doppler', 'gmail.com')} #{e('phil.ross', 'gmail.com')}"
        [e('doppler', 'gmail.com'), e('phil.ross', 'gmail.com')]
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
        %w(nbugajski cavelle)
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

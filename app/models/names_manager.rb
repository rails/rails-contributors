module NamesManager
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
    # canonical name           => handlers, emails, typos, etc.
    'alancfrancis'             => email('alancfrancis', 'gmail.com'),
    'Aliaksey Kandratsenka'    => 'Aleksey Kondratenko',
    'Andrew Kaspick'           => [email('akaspick', 'gmail.com'), 'akaspick'],
    'Anthony Eden'             => 'aeden',
    'Austin Ziegler'           => 'Thanks to Austin Ziegler for Transaction::Simple',
    'Blaine'                   => ['blaine', email('blaine', 'odeo.com')],
    'Bob Silva'                => 'BobSilva',
    'Brad Greenlee'            => 'bgreenlee',
    'Brandon Keepers'          => ['brandon', email('brandon', 'opensoul.org')],
    'Cheah Chu Yeow'           => ['Chu Yeow', 'chuyeow'],
    'court3nay'                => ['courtenay', email('court3nay', 'gmail.com')],
    'Chris Kampmeier'          => 'kampers',
    'Chris McGrath'            => [email('c.r.mcgrath', 'gmail.com'), 'c.r.mcgrath', email('chris', 'octopod.info'), 'octopod'],
    "Chris O'Sullivan"         => 'thechrisoshow',
    'Chris Roos'               => 'chrisroos',
    'Coda Hale'                => 'codahale',
    'Cody Fauser'              => email('codyfauser', 'gmail.com'),
    'Damian Janowski'          => 'djanowski',
    'Dan Manges'               => 'dcmanges',
    'Daniel Morrison'          => 'danielmorrison',
    'Daniel Von Fange'         => ['Suggested by Daniel Von Fange', 'Spotted by Daniel Von Fange'],
    'Dave Thomas'              => [email('dave', 'pragprog.com'), 'After much pestering from Dave Thomas'],
    'David Heinemeier Hansson' => 'DHH',
    'Dee Zsombor'              => ['Dee.Zsombor', 'zsombor', email('Dee.Zsombor', 'gmail.com')],
    'Don Park'                 => email('don.park', 'gmail.com'),
    'Dreamer3'                 => email('dreamer3', 'gmail.com'),
    'Duncan Beevers'           => 'duncanbeevers',
    'Eloy Duran'               => 'alloy',
    'Emilio Tagua'             => 'miloops',
    'Ernesto Jimenez'          => 'ernesto.jimenez',
    'Evan Weaver'              => 'evan',
    'François Beausoleil'      => ['FranÃ§ois Beausolei', 'Francois Beausoleil', email('fbeausoleil', 'ftml.net'), email('francois.beausoleil', 'gmail.com')],
    'Frederick Cheung'         => ['fcheung', 'Fred Cheung', 'frederick.cheung', email('frederick.cheung', 'gmail.com')],
    'Geoff Buesing'            => ['gbuesing', 'Geoffrey Buesing'],
    'Geoff Garside'            => 'ggarside',
    'Grant Hollingworth'       => email('grant', 'antiflux.org'),
    'Hampton Catlin'           => email('hcatlin', 'gmail.com'),
    'Hongli Lai (Phusion)'     => ['Hongli Lai (Phusion', 'FooBarWidget', 'Hongli Lai'],
    'Ian White'                => email('ian.w.white', 'gmail.com'),
    'Isaac Feliu'              => 'isaacfeliu',
    'Jack Danger Canty'        => %w(danger Danger),
    'Jakob Skjerning'          => ['Jakob S', email('jakob', 'mentalized.net')],
    'Jarkko Laine'             => [email('jarkko', 'jlaine.net'), 'Jarkko', 'jarkko'],
    'James Adam'               => ['lazyatom', email('james.adam', 'gmail.com')], 
    'James Mead'               => 'floehopper',
    'Jan De Poorter'           => 'DefV',
    'Jeremy Evans'             => [email('jeremyevans0', 'gmail.com'), 'jeremyevans'],
    'Jeremy Kemper'            => 'bitsweat',
    'Jeremy McAnally'          => ['jeremymcnally', 'jeremymcanally'],
    'John Barnette'            => 'jbarnette',
    'Jonathan del Strother'    => ['Catfish', 'catfish'],
    'Jonathan Viney'           => email('jonathan', 'bluewire.net.nz'),
    'Jonathan Weiss'           => 'jweiss',
    'Jordi Bunster'            => 'jordi',
    'José Valim'               => 'josevalim',
    'Josh Knowles'             => email('joshknowles', 'gmail.com'),
    'Josh Peek'                => ['josh', 'Josh', 'Joshua Peek', 'joshpeek', email('josh', 'joshpeek.com')],
    'Josh Starcher'            => email('josh.starcher', 'gmail.com'),
    'Josh Susser'              => ['hasmanyjosh', email('josh', 'hasmanythrough.com')],
    'Juanjo Bazan'             => 'juanjo.bazan',
    'Justin French'            => 'justinfrench',
    'Kamal Fariz Mahyuddin'    => 'kamal',
    'Ken Barker'               => email('ken.barker', 'gmail.com'),
    'Ken Miller'               => email('kenneth.miller', 'bitfield.net'),
    'Kevin Clark'              => ["Kevin Clark #{email('kevin.clark', 'gmail.com')}", email('kevin.clark', 'gmail.com'), email('kevin.clark', 'gmal.com')],
    'Lars Pind'                => [email('lars', 'pinds.com'), email('lars', 'pind.com'), 'Lars pind', 'lars pind'],
    'lmarlow'                  => email('lmarlow', 'yahoo.com'),
    'Luca Guidi'               => 'l.guidi',
    'Luke Redpath'             => email('contact', 'lukeredpath.co.uk'),
    'Manfred Stienstra'        => [email('m.stienstra', 'fngtps.com'), 'manfred'],
    'Marcel Molina Jr.'        => ['Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio'],
    'Mark Somerville'          => 'Spakman',
    'Matthew Rudy Jacobs'      => 'MatthewRudy',
    'Michael Klishin'          => ['antares', 'Michael S. Klishin'],
    'Michael Koziarski'        => %w(Koz nzkoz),
    'Michael Schoen'           => ['Michael A. Schoen', email('schoenm', 'earthlink.net')],
    'Michael Schubert'         => [email('michael', 'schubert'), email('michael', 'schubert.cx')],
    'Michael Schuerig'         => [email('michael', 'schuerig.de'), 'Michael Shuerig'],
    'Mike Naberezny'           => 'mnaberez',
    'Mikel Lindsaar'           => ['mikel', 'raasdnil'],
    'Mislav Marohnić'          => ['mislav', 'mislaw', email('mislav', 'nippur.irb.hr')],
    'Murray Steele'            => 'h-lame',
    'Nathan Weizenbaum'        => 'Nex3',
    'Nick Sieger'              => ['nicksieger', email('nicksieger', 'gmail.com')],
    'Nik Wakelin'              => 'nik.wakelin',
    'Norbert Crombach'         => 'norbert',
    'Obie Fernandez'           => 'ObieFernandez',
    'Patrick Lenz'             => email('patrick', 'lenz.sh'),
    'pburleson'                => email('pburleson', 'gmail.com'),
    'Philip Hallstrom'         => 'phallstrom',
    'Pratik Naik'              => %w(Pratik pratik lifofifo lifo),
    'Rick Olson'               => ['rick', 'Rick', 'Rick Olsen', email('technoweenie', 'gmail.com')],
    'RSL'                      => ['rsl', 'Russell Norris'],
    'Rob Biedenharn'           => ['rabiedenharn', email('Rob', 'AgileConsultingLLC.com')],
    'Rob Sanheim'              => [email('rsanheim', 'gmail.com'), email('rob', 'thinkrelevance.com')],
    'Robby Russell'            => 'robbyrussell',
    'Ruy Asan'                 => 'rubyruy',
    'Ryan Bates'               => 'ryanb',
    'Ryan Bigg'                => 'Radar',
    'Ryan Davis'               => 'zenspider',
    'Ryan Tomayko'             => email('rtomayko', 'gmail.com'),
    'Sam Granieri'             => 'sjgman9',
    'Sebastian Kanthak'        => [email('sebastian.kanthak', 'muehlheim.de'), 'sebastian.kanthak', 'skanthak'],
    'Seth Rasmussen'           => 'loincloth',
    'Shugo Maeda'              => ['shugo', email('shugo', 'ruby-lang.org')],
    'Simon Stapleton'          => email('simon.stapleton', 'gmail.com'),
    'Stefan Kaes'              => [email('skaes', 'web.de'), 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de'],
    'Steve Purcell'            => email('stephen_purcell', 'yahoo.com'),
    'Steven Bristol'           => 'stevenbristol',
    'Steven Soroka'            => [email('ssoroka78', 'gmail.com'), 'ssoroka'],
    'Tarmo Tänav'              => ['tarmo', 'tarmo_t', 'Tarmo Täna'],
    'Thijs van der Vossen'     => ['thijsv', email('thijs', 'vandervossen.net'), email('thijs', 'fngtps.com')],
    'Tim Pope'                 => ['tpope', 'Time Pope', email('rails', 'tpope.info'), 'pope'],
    'Tobias Lütke'             => ['Tobias Luetke', 'TobiasLuetke'],
    'Tom Ward'                 => ['Tom ward', 'tomafro'],
    'Victor Jalencas'          => email('victor-ronr-trac', 'carotena.net'),
    'Will Bryant'              => 'will.bryant',
    'Xavier Noria'             => 'fxn',
    'Xavier Shay'              => 'xaviershay',
    'Yehuda Katz'              => 'wycats',
    'Zach Dennis'              => 'zdennis',
    # canonical name           => handlers, emails, typos, etc.
  }

  # Reverse SEEN_IN_LOG_ALSO_AS to be able to go from handler to canonical name.
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

  # In some cases author names are extracted from svn messages. We look there
  # for stuff between brackets, but that's not always an author name. There
  # are some exceptions this method knows about. Also some known strings get
  # special treatment here.
  def self.handle_special_cases(name, fallback)
    case name
    when /\A\d+\z/
      # Remove side effects of [5684]
      fallback
    when /\A\s*\z/
      fallback
    when 'See rails ML', '"RAILS_ENV"', 'subject "Text::Format Licence Exception" on Oct 15'
      fallback
    when /RubyConf/ # example: RubyConf '05
      fallback
    when /^Includes duplicates of changes/ # Includes duplicates of changes from 1.1.4 - 1.2.3
      fallback
    when 'update from Trac'
      fallback
    when 'Jim Remsik and Tim Pope'
      ['Jim Remsik', 'Tim Pope']
    when 'Jeremy Hopple and Kevin Clark'
      ['Jeremy Hopple', 'Kevin Clark']
    when 'me@jonnii.com rails@jeffcole.net Marcel Molina Jr.'
      ['me@jonnii.com', 'rails@jeffcole.net', 'Marcel Molina Jr.']
    when 'jeremy@planetargon.com Marcel Molina Jr.'
      ['jeremy@planetargon.com', 'Marcel Molina Jr.']
    when 'matt@mattmargolis.net Marcel Molina Jr.'
      ['matt@mattmargolis.net', 'Marcel Molina Jr.']
    when 'doppler@gmail.com phil.ross@gmail.com'
      ['doppler@gmail.com', 'phil.ross@gmail.com']
    when 'Suggested by Robby Russel'
      'Robby Russel'
    when '=?utf-8?q?Adam=20Cig=C3=A1nek?='
      'Adam Cigánek'
    when /\A(Spotted|Suggested|Investigation|earlier work)\s+by\s+(.*)/i
      # Spotted by Kevin Bullock
      # Suggested by Carl Youngblood
      # Investigation by Scott
      # 'earlier work by Michael Neumann'
      $2
    when /\Avia\s+(.*)/i
      # via Tim Bray
      $1
    else
      name
    end
  end
end

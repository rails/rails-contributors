require 'set'

module NamesManager

  # Returns a set with all (canonical) contributor names known by the application.
  def self.all_names
    Set.new(Contributor.connection.select_values("SELECT name FROM contributors"))
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

  # canonical name => handlers, emails, typos, etc.
  SEEN_ALSO_AS = {}
  def self.map(canonical_name, *also_as)
    SEEN_ALSO_AS[canonical_name] = also_as
  end

  # Some people appear in Rails logs under different names, there are nicks,
  # typos, email addresses, shortenings, etc. This is a hand-made list to map
  # them in order to be able to aggregate commits from the same real author.
  #
  # This mapping does not use regexps on purpose, it is more robust to put the
  # exact string equivalences. The manager has to be very strict about this.
  map 'Adam Kramer',               e('adam', 'the-kramers.net')
  map 'alancfrancis',              e('alancfrancis', 'gmail.com')
  map 'Aliaksey Kandratsenka',     'Aleksey Kondratenko'
  map 'Andrew Kaspick',            e('akaspick', 'gmail.com'), 'akaspick', e('andrew', 'redlinesoftware.com')
  map 'Andrew White',              'pixeltrix'
  map 'Anthony Eden',              'aeden'
  map 'Ben Scofield',              'bscofield'
  map 'Blaine',                    'blaine', e('blaine', 'odeo.com')
  map 'Brad Ediger',               e('brad.ediger', 'madriska.com'), e('brad', 'madriska.com'), 'bradediger'
  map 'Brad Ellis',                e('bellis', 'deepthought.org')
  map 'Bob Silva',                 'BobSilva'
  map 'Brad Greenlee',             'bgreenlee'
  map 'Brandon Keepers',           'brandon', e('brandon', 'opensoul.org')
  map 'Brian Donovan',             'eventualbuddha'
  map 'Cheah Chu Yeow',            'Chu Yeow', 'chuyeow'
  map 'Chris Kampmeier',           'kampers'
  map 'Chris McGrath',             e('c.r.mcgrath', 'gmail.com'), 'c.r.mcgrath', e('chris', 'octopod.info'), 'octopod'
  map 'Chris Mear',                e('chris', 'feedmechocolate.com'), 'chrismear'
  map "Chris O'Sullivan",          'thechrisoshow'
  map 'Chris Roos',                'chrisroos'
  map 'Coda Hale',                 'codahale'
  map 'Cody Fauser',               e('codyfauser', 'gmail.com')
  map 'Courtenay Gasking',         'court3nay', 'courtenay', e('court3nay', 'gmail.com')
  map 'Damian Janowski',           'djanowski'
  map 'Dan Kubb',                  'dkubb'
  map 'Dan Manges',                'dcmanges'
  map 'Daniel Morrison',           'danielmorrison'
  map 'Daniel Rodríguez Troitiño', 'drodriguez'
  map 'Dave Lee',                  e('dave', 'cherryville.org')
  map 'Dave Thomas',               e('dave', 'pragprog.com'), 'pragdave'
  map 'David A. Black',            'dblack'
  map 'David Calavera',            'calavera', 'david.calavera'
  map 'David Dollar',              'ddollar'
  map 'David Heinemeier Hansson',  'DHH'
  map 'David Morton',              e('mortonda', 'dgrmm.net')
  map 'Dee Zsombor',               'Dee.Zsombor', 'zsombor', e('Dee.Zsombor', 'gmail.com')
  map 'Don Park',                  e('don.park', 'gmail.com')
  map 'Dr Nic',                    'drnic'
  map 'Duane Johnson',             e('duane.johnson', 'gmail.com')
  map 'Duncan Beevers',            'duncanbeevers'
  map 'Elijah Miller',             e('elijah.miller', 'gmail.com'), 'jqr'
  map 'Eloy Duran',                'alloy'
  map 'Emilio Tagua',              'miloops'
  map 'Ernesto Jimenez',           'ernesto.jimenez'
  map 'Evan Weaver',               'evan'
  map 'François Beausoleil',       'FranÃ§ois Beausolei', 'Francois Beausoleil', e('fbeausoleil', 'ftml.net'), e('francois.beausoleil', 'gmail.com')
  map 'Frederick Cheung',          'fcheung', 'Fred Cheung', 'frederick.cheung', e('frederick.cheung', 'gmail.com')
  map 'Gabe da Silveira',          'dasil003'
  map 'Geoff Buesing',             'gbuesing', 'Geoffrey Buesing'
  map 'Geoff Garside',             'ggarside'
  map 'Grant Hollingworth',        e('grant', 'antiflux.org')
  map 'Guy Naor',                  e('guy.naor', 'famundo.com')
  map 'Hampton Catlin',            e('hcatlin', 'gmail.com')
  map 'Henrik Nyh',                'Henrik N', e('henrik', 'nyh.se'), 'henrik'
  map 'Hongli Lai (Phusion)',      'FooBarWidget', 'Hongli Lai', 'Hongli Lai (Phusion'
  map 'Ian White',                 e('ian.w.white', 'gmail.com')
  map 'Isaac Feliu',               'isaacfeliu'
  map 'Jack Danger Canty',         'danger', 'Danger'
  map 'Jakob Skjerning',           'Jakob S', e('jakob', 'mentalized.net')
  map 'Jarkko Laine',              e('jarkko', 'jlaine.net'), 'Jarkko', 'jarkko'
  map 'James Adam',                'lazyatom', e('james.adam', 'gmail.com')
  map 'James Mead',                'floehopper'
  map 'Jamie van Dyke',            'fearoffish'
  map 'Jan De Poorter',            'DefV'
  map 'Jason Frey',                'Jason Frey (Fryguy)'
  map 'Javier Ramírez',            'jramirez'
  map 'Jeffrey Hardy',             'packagethief'
  map 'Jeremy Evans',               e('jeremyevans0', 'gmail.com'), 'jeremyevans'
  map 'Jeremy Kemper',              'bitsweat'
  map 'Jeremy McAnally',            'jeremymcnally', 'jeremymcanally'
  map 'Jeremy Voorhis',             e('jeremy', 'planetargon.com')
  map 'Johan Sørensen',             'Johan Sorensen', 'Johan Sörensen'
  map 'John Barnette',              'jbarnette'
  map 'Jon Wood',                   e('jon', 'instance-design.co.uk')
  map 'Jonathan del Strother',      'Catfish', 'catfish'
  map 'Jonathan Viney',             e('jonathan', 'bluewire.net.nz')
  map 'Jonathan Weiss',             'jweiss'
  map 'Jordi Bunster',              'jordi'
  map 'José Valim',                 'josevalim'
  map 'Josh Goebel',                'Dreamer3', e('dreamer3', 'gmail.com')
  map 'Josh Knowles',               e('joshknowles', 'gmail.com')
  map 'Josh Peek',                  'josh', 'Josh', 'Joshua Peek', 'joshpeek', e('josh', 'joshpeek.com')
  map 'Josh Starcher',              e('josh.starcher', 'gmail.com')
  map 'Josh Susser',                'hasmanyjosh', e('josh', 'hasmanythrough.com')
  map 'Joshua Sierles',             'jsierles'
  map 'Juanjo Bazan',               'juanjo.bazan'
  map 'Justin French',              'justinfrench'
  map 'Kamal Fariz Mahyuddin',      'kamal'
  map 'Karel Miarka',               e('kajism', 'yahoo.com')
  map 'Ken Barker',                 e('ken.barker', 'gmail.com')
  map 'Ken Kunz',                   e('kennethkunz', 'gmail.com')
  map 'Ken Miller',                 e('kenneth.miller', 'bitfield.net')
  map 'Kevin Clark',                "Kevin Clark #{e('kevin.clark', 'gmail.com')}", e('kevin.clark', 'gmail.com'), e('kevin.clark', 'gmal.com')
  map 'Kevin Jackson',              e('foamdino', 'gmail.com')
  map 'Kornelius Kalnbach',         e('murphy', 'cYcnus.de')
  map 'Kristopher Chambers',        e('kristopher.chambers', 'gmail.com'), 'kris_chambers'
  map 'Lars Pind',                  e('lars', 'pinds.com'), e('lars', 'pind.com'), 'Lars pind', 'lars pind'
  map 'lmarlow',                    e('lmarlow', 'yahoo.com')
  map 'Lawrence Pit',               'lawrence'
  map 'Leon Breedt',                'Leon Bredt'
  map 'Luca Guidi',                 'l.guidi'
  map 'Luismi Cavallé',             'cavalle', 'cavelle'
  map 'Luke Redpath',               e('contact', 'lukeredpath.co.uk')
  map 'maiha',                      'anna', e('anna', 'wota.jp'), e('maiha', 'wota.jp')
  map 'Manfred Stienstra',          e('m.stienstra', 'fngtps.com'), 'manfred'
  map 'Marc Love',                  'marclove'
  map 'Marcel Molina Jr.',          'Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio', 'Marcel Mollina Jr.'
  map 'Mark Imbriaco',              e('mark.imbriaco', 'pobox.com')
  map 'Mark Somerville',            'Spakman'
  map 'Mark Van Holstyn',           'lotswholetime'
  map 'Martin Emde',                e('zraii', 'comcast.net'), e('martin.emde', 'gmail.com')
  map 'Mathieu Arnold',             e('mat', 'absolight.fr')
  map 'Matt Aimonetti',             'matt'
  map 'Matt Palmer',                'mpalmer', e('mpalmer', 'hezmatt.org')
  map 'Matt Margolis',              e('matt', 'mattmargolis.net')
  map 'Matthew Rudy Jacobs',        'MatthewRudy'
  map 'Michael Galero',             'mikong'
  map 'Michael Klishin',            'antares', 'Michael S. Klishin'
  map 'Michael Koziarski',          'Koz', 'nzkoz'
  map 'Michael Schoen',             'Michael A. Schoen', e('schoenm', 'earthlink.net')
  map 'Michael Schubert',           e('michael', 'schubert'), e('michael', 'schubert.cx')
  map 'Michael Schuerig',           e('michael', 'schuerig.de'), 'Michael Shuerig'
  map 'Mike Gunderloy',             e('mike', 'clarkware.com')
  map 'Mike Laster',                e('mlaster', 'metavillage.com')
  map 'Mike Naberezny',             'mnaberez'
  map 'Mikel Lindsaar',             'mikel', 'raasdnil'
  map 'Mislav Marohnić',            'mislav', 'mislaw', e('mislav', 'nippur.irb.hr')
  map 'Murray Steele',              'h-lame'
  map 'Nathan Weizenbaum',          'Nex3'
  map 'Nick Sieger',                'nicksieger', e('nicksieger', 'gmail.com'), 'Nick'
  map 'Nik Wakelin',                'nik.wakelin'
  map 'Norbert Crombach',           'norbert'
  map 'Obie Fernandez',             'ObieFernandez'
  map 'Patrick Lenz',               e('patrick', 'lenz.sh')
  map 'pburleson',                  e('pburleson', 'gmail.com')
  map 'Philip Hallstrom',           'phallstrom'
  map 'Pratik Naik',                'Pratik', 'pratik', 'lifofifo', 'lifo'
  map 'Rick Bradley',               e('rick', 'rickbradley.com')
  map 'Rich Collins',               'richcollins', e('richcollins', 'gmail.com')
  map 'Rick Olson',                 'rick', 'Rick', 'Rick Olsen', e('technoweenie', 'gmail.com'), 'Rich Olson'
  map 'RSL',                        'rsl', 'Russell Norris'
  map 'Rob Biedenharn',             'rabiedenharn', e('Rob', 'AgileConsultingLLC.com')
  map 'Rob Sanheim',                'rsanheim', e('rsanheim', 'gmail.com'), e('rob', 'thinkrelevance.com')
  map 'Robby Russell',              'robbyrussell'
  map 'Roderick van Domburg',       'roderickvd'
  map 'Ross Kaffenberger',          'Ross Kaffenburger'
  map 'Ruy Asan',                   'rubyruy'
  map 'Ryan Bates',                 'ryanb'
  map 'Ryan Bigg',                  'Radar'
  map 'Ryan Davis',                 'zenspider'
  map 'Ryan Daigle',                'rwdaigle'
  map 'Ryan Tomayko',               e('rtomayko', 'gmail.com')
  map 'Sam Granieri',               'sjgman9'
  map 'Sam Stephenson',             'Sam', 'sam'
  map 'Sandra Metz',                e('sandra.metz', 'duke.edu')
  map 'Scott Reilly',               'coffee2code'
  map 'Sebastian Delmont',          e('sd', 'notso.net')
  map 'Sebastian Kanthak',          e('sebastian.kanthak', 'muehlheim.de'), 'sebastian.kanthak', 'skanthak'
  map 'Seth Rasmussen',             'loincloth'
  map 'Shugo Maeda',                'shugo', e('shugo', 'ruby-lang.org')
  map 'Simon Moore',                'saimonmoore'
  map 'Simon Stapleton',            e('simon.stapleton', 'gmail.com')
  map 'Stefan Kaes',                e('skaes', 'web.de'), 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de', 'stefan', 'Stefan', 'skae', 'skaen'
  map 'Steve Purcell',              e('stephen_purcell', 'yahoo.com')
  map 'Steven Bristol',             'stevenbristol'
  map 'Steven Soroka',              e('ssoroka78', 'gmail.com'), 'ssoroka'
  map 'Tarmo Tänav',                'tarmo', 'tarmo_t', 'Tarmo Täna'
  map 'Thijs van der Vossen',       'thijsv', e('thijs', 'vandervossen.net'), e('thijs', 'fngtps.com')
  map 'Thomas Fuchs',               e('thomas', 'fesch.at')
  map 'Tiago Macedo',               'tmacedo'
  map 'Tieg Zaharia',               'tzaharia'
  map 'Tim Pope',                   'tpope', 'Time Pope', e('rails', 'tpope.info'), 'pope'
  map 'Tobias Lütke',               'Tobias Luetke', 'TobiasLuetke', 'Tobias Luekte'
  map 'Tom Brice',                  'tomtoday', e('tomtoday', 'gmail.com')
  map 'Tom Fakes',                  e('tom', 'craz8.com')
  map 'Tom Ward',                   'Tom ward', 'tomafro', e('tom', 'popdog.net')
  map 'Victor Jalencas',            e('victor-ronr-trac', 'carotena.net')
  map 'Will Bryant',                'will.bryant'
  map 'Xavier Noria',               'fxn'
  map 'Xavier Shay',                'xaviershay'
  map 'Yehuda Katz',                'wycats'
  map 'Yurii Rashkovskii',          e('yrashk', 'gmail.com'), e('yrashk', 'fp.org.ua')
  map 'Zach Dennis',                'zdennis'

  # Reverse SEEN_ALSO_AS to be able to go from handler to canonical name.
  CANONICAL_NAME_FOR = {}
  SEEN_ALSO_AS.each do |canonical_name, also_as|
    also_as.each { |alt| CANONICAL_NAME_FOR[alt] = canonical_name }
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

  # Returns the source code of the +handle_special_cases+ method.
  def self.special_cases
    code = File.read(__FILE__)
    code =~ /(^  #[^\n]+\n)+  def self\.handle_special_cases.*?^  end/m
    $&
  end

  # Removes email addresses (anything between <...>), and strips whitespace.
  def self.sanitize(name)
    name.sub(/<[^>]+>/, '').strip
  end

  CONNECTORS_REGEXP = %r{[,/&+]}

  # Inspects raw candidates in search for rare cases.
  #
  # Returns +nil+ if +name+ si known *not* to correspond to an author, the
  # author name(s) if special handling applies, and return just +name+ back
  # otherwise.
  #
  # Note that this method is responsible for extracting names as they appear
  # in the original string. Canonicalization is done elsewhere.
  def self.handle_special_cases(name)
    case name
      when /\A#?\d+/
        # Remove side effects of [5684]
        # Ensure WhiteListSanitizer allows dl tag [#2393 state:resolved]
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
        # Signed-off-by: Michael Koziarski <michael@koziarski.com> [#https://rails.lighthouseapp.com/attachments/106066/0001-Ensure-SqlBypass-use-ActiveRecord-Base-connection.patch state:committed]
        nil
      when "#{e('schoenm', 'earthlink.net')} #{e('sandra.metz', 'duke.edu')}"
        name.split
      when '=?utf-8?q?Adam=20Cig=C3=A1nek?='
        'Adam Cigánek'
      when '=?utf-8?q?Mislav=20Marohni=C4=87?='
        'Mislav Marohnić'
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
        # just return the candidate back
        name
    end
  end
end

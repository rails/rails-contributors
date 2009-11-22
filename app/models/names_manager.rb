require 'set'

module NamesManager
  # I've sent an email to these email addresses, and there's no response
  # so far.
  WAITING_FOR = %W(
    agkr\100pobox.com
    imbcmdth\100hotmail.com
    jhahn\100niveon.com
    nick+rails\100ag.arizona.edu
    alec+rails\100veryclever.net
    alex.r.moon\100gmail.com
    david.a.williams\100gmail.com
    dwlt\100dwlt.net
    edward.frederick\100revolution.com
    ehalvorsen+rails\100runbox.com
    eli.gordon\100gmail.com
    eugenol\100gmail.com
    f.svehla\100gmail.com
    fabien\100odilat.com
    fhanshaw\100vesaria.com
    gaetanot\100comcast.net
    gnuman1\100gmail.com
    hanson\100surgery.wisc.edu
    info\100loobmedia.com
    james\100slashetc.com
    jan\100ulbrich-boerwang.de
  )

  # I've sent an email to these addresses, and got some sort of error back.
  UNREACHABLE_ADDRESSES = %W(
    rails\100cogentdude.com
    rubyonrails\100atyp.de
    takiuchi\100drecom.co.jp
    altano\100bigfoot.com
    asnem\100student.ethz.ch
    damn_pepe\100gmail.com
    dev.rubyonrails\100maxdunn.com
  )

  # Returns a set with all (canonical) contributor names known by the application.
  def self.all_names
    Set.new(Contributor.connection.select_values("SELECT name FROM contributors"))
  end

  # Determines whether names mapping or special cases handling have been updated
  # since +ts+.
  def self.mapping_updated_since?(ts)
    File.mtime(__FILE__) > ts
  end

  # canonical name => handlers, emails, typos, etc.
  SEEN_ALSO_AS = {}
  def self.map(canonical_name, *also_as)
    SEEN_ALSO_AS[canonical_name] = also_as
  end

  def self.authors_of_special_cased_commits(commit)
    case commit.sha1
    # This was a commit backported from 2.3 that missed Dana in the way.  
    when '1382f4de1f9b0e443e7884bd4da53c20f0754568'
      ['David Burger', 'Dana Jones']
    # The following patch comes from this ticket https://rails.lighthouseapp.com/projects/8994/tickets/2856
    # but Yehuda told me credit for that commit was screwed up.
    when '882dd4e6054470ee56c46ab1432861952c81b633'
      ['David Calavera']
    else
      nil
    end
  end

  # Some people appear in Rails logs under different names, there are nicks,
  # typos, email addresses, shortenings, etc. This is a hand-made list to map
  # them in order to be able to aggregate commits from the same real author.
  #
  # This mapping does not use regexps on purpose, it is more robust to put the
  # exact string equivalences. The manager has to be very strict about this.
  map 'Adam Kramer',                "adam\100the-kramers.net"
  map 'Adam Majer',                 "adamm\100galacticasoftware.com"
  map 'Adam Milligan',              'pivotal'
  map 'Adelle Hartley',             "adelle\100bullet.net.au"
  map 'Akira Ikeda',                "ikeda\100dream.big.or.jp"
  map 'Akira Matsuda',              '松田 明'
  map 'alancfrancis',               "alancfrancis\100gmail.com"
  map 'Alex Pooley',                "alex\100msgpad.com"
  map 'Alex Wayne',                 "rubyonrails\100beautifulpixel.com"
  map 'Alex Wolfe',                 "alexkwolfe\100gmail.com"
  map 'Alexander Borovsky',         "alex.borovsky\100gmail.com"
  map 'Alexander Dymo',             'adymo', "dymo\100mk.ukrtelecom.ua"
  map 'Alexander Staubo',           "alex\100purefiction.net", "alex\100byzantine.no"
  map 'Alexey Zatsepin',            'alexey'
  map 'Aliaksey Kandratsenka',      'Aleksey Kondratenko'
  map 'Andrew A. Smith',            "andy\100tinnedfruit.org"
  map 'Andrew Kaspick',             "akaspick\100gmail.com", 'akaspick', "andrew\100redlinesoftware.com"
  map 'Andrew Peters',              "andrew.john.peters\100gmail.com"
  map 'Andrew White',               'pixeltrix'
  map 'Andy Lien',                  "andylien\100gmail.com"
  map 'Anthony Eden',               'aeden'
  map 'Anup Narkhede',              'railsbob'
  map 'Arthur Zapparoli',           'arthurgeek'
  map 'Ask Bjørn Hansen',           "ask\100develooper.com"
  map 'Assaf Arkin',                "assaf.arkin\100gmail.com"
  map 'August Zajonc',              "augustz\100augustz.com"
  map 'Bas van Klinkenberg',        "flash\100vanklinkenbergsoftware.nl"
  map 'Ben Bangert',                "ben\100groovie.org"
  map 'Ben Sandofsky',              'sandofsky'
  map 'Ben Scofield',               'bscofield'
  map 'Ben Sinclair',               "ben\100bensinclair.com"
  map 'Benjamin Curtis',            "rails\100bencurtis.com"
  map 'Blaine Cook',                'Blaine', 'blaine', "blaine\100odeo.com"
  map 'Blair Zajac',                "blair\100orcaware.com"
  map 'Blake Watters',              "blake\100near-time.com"
  map 'Bob Aman',                   "bob\100sporkmonger.com"
  map 'Brad Ediger',                "brad.ediger\100madriska.com", "brad\100madriska.com", 'bradediger'
  map 'Brad Ellis',                 "bellis\100deepthought.org"
  map 'Brandt Kurowski',            "brandt\100kurowski.net"
  map 'Brian Egge',                 "brianegge\100yahoo.com"
  map 'Brian Gernhardt',            "benji\100silverinsanity.com"
  map 'Bob Silva',                  'BobSilva', "ruby\100bobsilva.com"
  map 'Brad Greenlee',              'bgreenlee'
  map 'Brandon Keepers',            'brandon', "brandon\100opensoul.org"
  map 'Brian Donovan',              'eventualbuddha', "devslashnull\100gmail.com"
  map 'Bruce Williams',             "wbruce\100gmail.com"
  map 'Caio Chassot',               'caio', "k\100v2studio.com"
  map 'Caleb Tennis',               "caleb\100aei-tech.com"
  map 'Charles M. Gerungan',        "charles.gerungan\100gmail.com"
  map 'Cheah Chu Yeow',             'Chu Yeow', 'chuyeow'
  map 'Choon Keat',                 "choonkeat\100gmail.com", 'choonkeat'
  map 'Chris Brinker',              "chris\100chrisbrinker.com"
  map 'Chris Carter',               "cdcarter\100gmail.com"
  map 'Chris Kampmeier',            'kampers'
  map 'Chris McGrath',              "c.r.mcgrath\100gmail.com", 'c.r.mcgrath', "chris\100octopod.info", 'octopod'
  map 'Chris Mear',                 "chris\100feedmechocolate.com", 'chrismear'
  map "Chris O'Sullivan",           'thechrisoshow'
  map 'Chris Roos',                 'chrisroos', "chris\100seagul.co.uk"
  map 'Chris Wanstrath',            "chris\100ozmm.org"
  map 'Chriztian Steinmeier',       "chriztian.steinmeier\100gmail.com"
  map 'Coda Hale',                  'codahale'
  map 'Cody Fauser',                "codyfauser\100gmail.com"
  map 'Courtenay Gasking',          'court3nay', 'courtenay', "court3nay\100gmail.com"
  map 'Craig Davey',                'eigentone', "eigentone\100gmail.com"
  map 'Cristi Balan',               'Cristi BALAN'
  map 'Damian Janowski',            'djanowski'
  map 'Dan Cheail',                 'codeape'
  map 'Dan Croak',                  'dancroak'
  map 'Dan Kubb',                   'dkubb'
  map 'Dan Manges',                 'dcmanges'
  map 'Dan Peterson',               "dpiddy\100gmail.com"
  map 'Dan Sketcher',               "dansketcher\100gmail.com"
  map 'Daniel Hobe',                "daniel\100nightrunner.com"
  map 'Daniel Morrison',            'danielmorrison'
  map 'Daniel Rodríguez Troitiño',  'drodriguez'
  map 'Daniel Sheppard',            "daniels\100pronto.com.au"
  map 'Daniel Wanja',               "daniel\100nouvelles-solutions.com"
  map 'Dave Dribin',                "dave-ml\100dribin.org"
  map 'Dave Lee',                   "dave\100cherryville.org"
  map 'Dave Thomas',                "dave\100pragprog.com", 'pragdave'
  map 'David A. Black',             'dblack', "dblack\100wobblini.net"
  map 'David Altenburg',            "gensym\100mac.com"
  map 'David Calavera',             'calavera', 'david.calavera'
  map 'David Dollar',               'ddollar'
  map 'David Easley',               "easleydp\100gmail.com"
  map 'David Felstead',             "david.felstead\100gmail.com", "dfelstead\100site5.com"
  map 'David Heinemeier Hansson',   'DHH'
  map 'David Morton',               "mortonda\100dgrmm.net"
  map 'David Rose',                 "doppler\100gmail.com"
  map 'David Rupp',                 "david\100ruppconsulting.com"
  map 'David Weitzman',             "dweitzman\100gmail.com"
  map 'Dee Zsombor',                'Dee.Zsombor', 'zsombor', "Dee.Zsombor\100gmail.com"
  map 'Deirdre Saoirse',            "deirdre\100deirdre.net"
  map 'DeLynn Berry',               'Delynn', 'delynnb', 'DeLynn Barry', 'DeLynnB', 'DelynnB', 'DeLynn B', "delynn\100gmail.com"
  map 'Derrick Spell',              "derrickspell\100cdmplus.com"
  map 'Dominic Sisneros',           "dom\100sisna.com"
  map 'Don Park',                   "don.park\100gmail.com"
  map 'Donald Piret',               "donald.piret\100synergetek.be"
  map 'Dr Nic',                     'drnic'
  map 'Duane Johnson',              "duane.johnson\100gmail.com"
  map 'Duff OMelia',                "dj\100omelia.org"
  map 'Duncan Beevers',             'duncanbeevers'
  map 'Duncan Robertson',           "duncan\100whomwah.com"
  map 'Eddie Stanley',              "eddiewould\100paradise.net.nz"
  map 'Edward Betts',               "edward\100debian.org"
  map 'Elan Feingold',              "elan\100bluemandrill.com"
  map 'Elijah Miller',              "elijah.miller\100gmail.com", 'jqr'
  map 'Elliot Smith',               "elliot\100townx.org"
  map 'Eloy Duran',                 'alloy'
  map 'Emilio Tagua',               'miloops'
  map 'Eric Daspet',                "eric.daspet\100survol.net"
  map 'Eric Hodel',                 "drbrain\100segment7.net"
  map 'Erik Abele',                 "erik\100codefaktor.de"
  map 'Erik Terpstra',              "erik\100ruby-lang.nl"
  map 'Ernesto Jimenez',            'ernesto.jimenez'
  map 'Esad Hajdarevic',            "esad\100esse.at"
  map 'Evan Henshaw-Plath',         "evan\100protest.net"
  map 'Evan Weaver',                'evan'
  map 'Evgeny Zislis',              "evgeny.zislis\100gmail.com"
  map 'François Beausoleil',        'FranÃ§ois Beausolei', 'Francois Beausoleil', "fbeausoleil\100ftml.net", "francois.beausoleil\100gmail.com"
  map 'Frederick Cheung',           'fcheung', 'Fred Cheung', 'frederick.cheung', "frederick.cheung\100gmail.com"
  map 'Gabe da Silveira',           'dasil003'
  map 'Gabriel Gironda',            "gabriel.gironda\100gmail.com", "gabriel\100gironda.org"
  map 'Gaspard Bucher',             "g.bucher\100teti.ch"
  map 'Geoff Buesing',              'gbuesing', 'Geoffrey Buesing'
  map 'Geoff Garside',              'ggarside'
  map 'Grant Hollingworth',         "grant\100antiflux.org"
  map 'Greg Lappen',                "greg\100lapcominc.com"
  map 'Grzegorz Daniluk',           "daniluk\100yahoo.com"
  map 'Guy Naor',                   "guy.naor\100famundo.com"
  map 'Hampton Catlin',             "hcatlin\100gmail.com"
  map 'Hendrik Mans',               "hendrik\100mans.de"
  map 'Henrik Nyh',                 'Henrik N', "henrik\100nyh.se", 'henrik'
  map 'Hongli Lai (Phusion)',       'FooBarWidget', 'Hongli Lai', 'Hongli Lai (Phusion'
  map 'Ian White',                  "ian.w.white\100gmail.com"
  map 'Isaac Feliu',                'isaacfeliu'
  map 'Isaac Reuben',               "isaac\100reuben.com"
  map 'Jack Christensen',           "jackc\100hylesanderson.com"
  map 'Jack Danger Canty',          'danger', 'Danger'
  map 'Jakob Skjerning',            'Jakob S', "jakob\100mentalized.net"
  map 'Jarkko Laine',               "jarkko\100jlaine.net", 'Jarkko', 'jarkko'
  map 'James Adam',                 'lazyatom', "james.adam\100gmail.com"
  map 'James Edward Gray II',       "james\100grayproductions.net"
  map 'James Mead',                 'floehopper'
  map 'Jamie Macey',                "jamie\100bravenet.com"
  map 'Jamie Orchard-Hays',         "jamie\100dang.com"
  map 'Jamie van Dyke',             'fearoffish'
  map 'Jan De Poorter',             'DefV'
  map 'Jason Frey',                 'Jason Frey (Fryguy)'
  map 'Javier Ramírez',             'jramirez'
  map 'Jay Pignata',                'Developer' # see 179b451
  map 'Jean-Philippe Bougie',       "jp.bougie\100gmail.com"
  map 'Jeff Berg',                  "jeff\100ministrycentered.com"
  map 'Jeff Cohen',                 "cohen.jeff\100gmail.com"
  map 'Jeff Cole',                  "rails\100jeffcole.net"
  map 'Jeffrey Hardy',              'packagethief'
  map 'Jeremy Durham',              "jeremydurham\100gmail.com"
  map 'Jeremy Evans',               "jeremyevans0\100gmail.com", 'jeremyevans', "jeremye\100bsa.ca.gov", "code\100jeremyevans.net"
  map 'Jeremy Kemper',              'bitsweat'
  map 'Jeremy McAnally',            'jeremymcnally', 'jeremymcanally'
  map 'Jeremy Voorhis',             "jeremy\100planetargon.com"
  map 'Jerrett Taylor',             "jerrett\100bravenet.com"
  map 'Jim Hughes',                 'jeem'
  map 'Joe Goldwasser',             "joe\100mjg2.com"
  map 'Joerg Diekmann',             "joergd\100pobox.com"
  map 'Johan Sørensen',             'Johan Sorensen', 'Johan Sörensen'
  map 'John Barnette',              'jbarnette'
  map 'Jon Bright',                 "jon\100siliconcircus.com"
  map 'Jon Wood',                   "jon\100instance-design.co.uk"
  map 'Jonathan Leighton',          "turnip\100turnipspatch.com"
  map 'Jonathan del Strother',      'Catfish', 'catfish'
  map 'Jonathan Viney',             "jonathan\100bluewire.net.nz"
  map 'Jonathan Weiss',             'jweiss'
  map 'John Sheets',                "dev\100metacasa.net"
  map 'Jordi Bunster',              'jordi'
  map 'José Valim',                 'josevalim'
  map 'Josh Goebel',                'Dreamer3', "dreamer3\100gmail.com"
  map 'Josh Knowles',               "joshknowles\100gmail.com"
  map 'Josh Peek',                  'josh', 'Josh', 'Joshua Peek', 'joshpeek', "josh\100joshpeek.com"
  map 'Josh Starcher',              "josh.starcher\100gmail.com"
  map 'Josh Susser',                'hasmanyjosh', "josh\100hasmanythrough.com"
  map 'Joshua Sierles',             'jsierles'
  map 'Juanjo Bazan',               'juanjo.bazan'
  map 'Julian Doherty',             'madlep'
  map 'Julian Tarkhanov',           "me\100julik.nl", 'julik'
  map 'Justin French',              'justinfrench'
  map 'Kamal Fariz Mahyuddin',      'kamal'
  map 'Karel Miarka',               "kajism\100yahoo.com"
  map 'Kaspar Schiess',             "eule\100space.ch"
  map 'Kazuhiko',                   "kazuhiko\100fdiary.net"
  map 'Kazuhiro Yoshdia',           "moriq\100moriq.com"
  map 'Keith Morrison',             "keithm\100infused.org"
  map 'Ken Barker',                 "ken.barker\100gmail.com"
  map 'Ken Kunz',                   "kennethkunz\100gmail.com"
  map 'Ken Miller',                 "kenneth.miller\100bitfield.net"
  map 'Kevin Clark',                "Kevin Clark kevin.clark\100gmail.com", "kevin.clark\100gmail.com", "kevin.clark\100gmal.com"
  map 'Kevin Jackson',              "foamdino\100gmail.com"
  map 'Koichi Tsutsumi',            "hakuja\100hakuja.net"
  map 'Kornelius Kalnbach',         "murphy\100cYcnus.de"
  map 'Kristopher Chambers',        "kristopher.chambers\100gmail.com", 'kris_chambers'
  map 'Kyosuke Morohashi',          'moro'
  map 'Lakshan Perera',             'laktek', 'lakshan'
  map 'Lars Pind',                  "lars\100pinds.com", "lars\100pind.com", 'Lars pind', 'lars pind'
  map 'Lawrence Pit',               'lawrence'
  map 'Lee Marlow',                 'lmarlow', "lmarlow\100yahoo.com"
  map 'Leon Breedt',                'Leon Bredt'
  map 'Leslie A. Hensley',          "hensleyl\100papermountain.org"
  map 'Lon Baker',                  "lon\100speedymac.com"
  map 'Luca Guidi',                 'l.guidi'
  map 'Luismi Cavallé',             'cavalle', 'cavelle'
  map 'Luke Redpath',               "contact\100lukeredpath.co.uk"
  map 'maiha',                      'anna', "anna\100wota.jp", "maiha\100wota.jp"
  map 'Maik Schmidt',               "contact\100maik-schmidt.de"
  map 'Manfred Stienstra',          "m.stienstra\100fngtps.com", 'manfred'
  map 'Marc Love',                  'marclove'
  map 'Marcel Molina Jr.',          'Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio', 'Marcel Mollina Jr.'
  map 'Mark Imbriaco',              "mark.imbriaco\100pobox.com"
  map 'Mark Somerville',            'Spakman'
  map 'Mark Van Holstyn',           'lotswholetime'
  map 'Martin Emde',                "zraii\100comcast.net", "martin.emde\100gmail.com"
  map 'Mathieu Arnold',             "mat\100absolight.fr"
  map 'Mathieu Jobin',              "somekool\100gmail.com"
  map 'Matt Aimonetti',             'matt'
  map 'Matt Palmer',                'mpalmer', "mpalmer\100hezmatt.org"
  map 'Matt Margolis',              "matt\100mattmargolis.net"
  map 'Matt Mower',                 "self\100mattmower.com"
  map 'Matthew Rudy Jacobs',        'MatthewRudy'
  map 'Matthew Walker',             "matthew\100walker.wattle.id.au"
  map 'Micah Alles',                "alles\100atomicobject.com"
  map 'Michael Galero',             'mikong'
  map 'Michael Klishin',            'antares', 'Michael S. Klishin'
  map 'Michael Koziarski',          'Koz', 'nzkoz'
  map 'Michael Schoen',             'Michael A. Schoen', "schoenm\100earthlink.net"
  map 'Michael Schubert',           "michael\100schubert", "michael\100schubert.cx"
  map 'Michael Schuerig',           "michael\100schuerig.de", 'Michael Shuerig'
  map 'Michal Šafránek',            "wejn\100box.cz"
  map 'Michiaki Baba',              "babie7a0\100ybb.ne.jp"
  map 'Mike Clark',                 "mike\100clarkware.com"
  map 'Mike Gunderloy',             'Michael Gunderloy'
  map 'Mike Laster',                "mlaster\100metavillage.com"
  map 'Mike Naberezny',             'mnaberez'
  map 'Mikel Lindsaar',             'mikel', 'raasdnil'
  map 'Mislav Marohnić',            'mislav', 'mislaw', "mislav\100nippur.irb.hr"
  map 'Murray Steele',              'h-lame'
  map 'Nathan Weizenbaum',          'Nex3'
  map 'Nicholas Lee',               "emptysands\100gmail.com"
  map 'Nicholas Seckar',            'Ulysses'
  map 'Nick Kallen',                'nkallen'
  map 'Nick Sieger',                'nicksieger', "nicksieger\100gmail.com", 'Nick'
  map 'Nik Wakelin',                'nik.wakelin'
  map 'Nikolay Petrachkov',         'jastix'
  map 'Norbert Crombach',           'norbert'
  map 'Obie Fernandez',             'ObieFernandez'
  map 'Pat Maddox',                 "pergesu\100gmail.com"
  map 'Patrick Lenz',               "patrick\100lenz.sh"
  map 'Paul Butcher',               "paul\100paulbutcher.com"
  map 'pburleson',                  "pburleson\100gmail.com"
  map 'Per Wigren',                 "tuxie\100dekadance.se", 'Tuxie'
  map 'Peter Michaux',              "petermichaux\100gmail.com"
  map 'Phil Hagelberg',             "technomancy\100gmail.com"
  map 'Philip Hallstrom',           'phallstrom'
  map 'Pratik Naik',                'Pratik', 'pratik', 'lifofifo', 'lifo'
  map 'Raphael Bauduin',            "raphinou\100yahoo.com"
  map 'Rein Henrichs',              "ReinH"
  map 'Rick Bradley',               "rick\100rickbradley.com"
  map 'Rich Collins',               'richcollins', "richcollins\100gmail.com"
  map 'Rick Olson',                 'rick', 'Rick', 'Rick Olsen', "technoweenie\100gmail.com", 'Rich Olson'
  map 'Rizwan Reza',                'rizwanreza'
  map 'RSL',                        'rsl', 'Russell Norris'
  map 'Rob Anderton',               'Rob'
  map 'Rob Biedenharn',             'rabiedenharn', "Rob\100AgileConsultingLLC.com"
  map 'Rob Halff',                  "info\100rhalff.com"
  map 'Rob Sanheim',                'rsanheim', "rsanheim\100gmail.com", "rob\100thinkrelevance.com"
  map 'Robby Russell',              'robbyrussell'
  map 'Roderick van Domburg',       'roderickvd'
  map 'Rodney Ramdas',              "rramdas\100gmail.com"
  map 'Ross Kaffenberger',          'Ross Kaffenburger'
  map 'Ruben Nine',                 "ruben.nine\100gmail.com"
  map 'Russell Norris',             'RSL'
  map 'Ruy Asan',                   'rubyruy'
  map 'Ryan Bates',                 'ryanb'
  map 'Ryan Bigg',                  'Radar'
  map 'Ryan Davis',                 'zenspider'
  map 'Ryan Daigle',                'rwdaigle'
  map 'Ryan McGeary',               'rmm5t'
  map 'Ryan Tomayko',               "rtomayko\100gmail.com"
  map 'Sam Granieri',               'sjgman9'
  map 'Sam Stephenson',             'Sam', 'sam'
  map 'Sandra Metz',                "sandra.metz\100duke.edu"
  map 'Scott Reilly',               'coffee2code'
  map 'Sebastian Delmont',          "sd\100notso.net"
  map 'Sebastian Graessl',          'bastilian'
  map 'Sebastian Kanthak',          "sebastian.kanthak\100muehlheim.de", 'sebastian.kanthak', 'skanthak'
  map 'Seth Rasmussen',             'loincloth'
  map 'Shu-yu Guo',                 "arc\100uchicago.edu"
  map 'Shugo Maeda',                'shugo', "shugo\100ruby-lang.org"
  map 'Simon Harris',               "simon\100redhillconsulting.com.au"
  map 'Simon Moore',                'saimonmoore'
  map 'Simon Stapleton',            "simon.stapleton\100gmail.com"
  map 'Stefan Kaes',                "skaes\100web.de", 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de', 'stefan', 'Stefan', 'skae', 'skaen'
  map 'Stephen Sykes',              'sdsykes'
  map 'Steve Purcell',              "stephen_purcell\100yahoo.com"
  map 'Steven Bristol',             'stevenbristol'
  map 'Steven Soroka',              "ssoroka78\100gmail.com", 'ssoroka'
  map 'Stian Grytøyr',              "stian\100grytoyr.net"
  map 'Surendra Singhi',            "ssinghi\100kreeti.com"
  map 'Tarmo Tänav',                'tarmo', 'tarmo_t', 'Tarmo Täna'
  map 'Taryn East',                 'taryn'
  map 'Thijs van der Vossen',       'thijsv', "thijs\100vandervossen.net", "thijs\100fngtps.com"
  map 'Thomas Enebo',               "tom.enebo\100gmail.com"
  map 'Thomas Fuchs',               "thomas\100fesch.at"
  map 'Tiago Macedo',               'tmacedo'
  map 'Tieg Zaharia',               'tzaharia'
  map 'Tim Fletcher',               "twoggle\100gmail.com"
  map 'Tim Pope',                   'tpope', 'Time Pope', "rails\100tpope.info", 'pope'
  map 'Tobias Lütke',               'Tobias Luetke', 'TobiasLuetke', 'Tobias Luekte', 'xal'
  map 'Todd Gehman',                "todd\100robotcoop.com"
  map 'Tom Brice',                  'tomtoday', "tomtoday\100gmail.com"
  map 'Tom Fakes',                  "tom\100craz8.com"
  map 'Tom Moertel',                "tom\100moertel.com"
  map 'Tom Mornini',                "tmornini\100infomania.com"
  map 'Tom Ward',                   'Tom ward', 'tomafro', "tom\100popdog.net"
  map 'Trevor Squire',              'protocool'
  map 'Tyler Kiley',                "tyler\100kianta.com"
  map 'Tyler Kovacs',               "tyler.kovacs\100gmail.com"
  map 'Victor Jalencas',            "victor-ronr-trac\100carotena.net"
  map 'Wesley Moxam',               'wmoxam'
  map 'Will Bryant',                'will.bryant'
  map 'Wilson Bilkovich',           "wilsonb\100gmail.com"
  map 'Xavier Noria',               'fxn'
  map 'Xavier Shay',                'xaviershay'
  map 'Yehuda Katz',                'wycats'
  map 'Yoji Shidara',               "darashi\100gmail.com"
  map 'Yurii Rashkovskii',          "yrashk\100gmail.com", "yrashk\100fp.org.ua"
  map 'Zac Williams',               'jzw'
  map 'Zach Dennis',                'zdennis'
  map 'Zack Chandler',              'zackchandler'

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
      when "schoenm\100earthlink.net sandra.metz\100duke.edu"
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

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
    eli.gordon\100gmail.com
    eugenol\100gmail.com
    fhanshaw\100vesaria.com
    gaetanot\100comcast.net
    gnuman1\100gmail.com
    info\100loobmedia.com
    jan\100ulbrich-boerwang.de
    jonrailsdev\100shumi.org
    junk\100miriamtech.com
    justin\100textdrive.com
    machomagna\100gmail.com
    me\100jonnii.com
    minimudboy\100gmail.com
    rails.20.clarry\100spamgourmet.com
    rails-bug\100owl.me.uk
    s.brink\100web.de
    schultzr\100gmail.com
    seattle\100rootimage.msu.edu
    yanowitz-rubyonrails\100quantumfoam.org
    zaitzow\100gmail.com
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
    kdole\100tamu.edu
    mklame\100atxeu.com
    nbpwie102\100sneakemail.com
    nwoods\100mail.com
    nkriege\100hotmail.com
    pfc.pille\100gmx.net
    rcolli2\100tampabay.rr.com
    solo\100gatelys.com
    starr\100starrnhorne.com
    zachary\100panandscan.com
  )

  ADDRESSES_WHOSE_CONTRIBUTOR_PREFER_TO_REMAIN_UNRESOLVED = %W(
    lagroue\100free.fr
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
    when 'f9a02b12d15bdbd3c2ed18b16b31b712a77027bc'
      # The attribution is done with parens in a way we do not extract.  
      ['Juan Lupión']
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
  map 'Aaron Namba',                'anamba'
  map 'Aaron Pfeifer',              'obrie'
  map 'Abhay Kumar',                'abhay'
  map 'Adam Kramer',                "adam\100the-kramers.net"
  map 'Adam Majer',                 "adamm\100galacticasoftware.com"
  map 'Adam Milligan',              'pivotal'
  map 'Adam Wiggins',               'adamwiggins'
  map 'Adam Williams',              'aiwilliams'
  map 'Adelle Hartley',             "adelle\100bullet.net.au"
  map 'Akira Ikeda',                "ikeda\100dream.big.or.jp"
  map 'Akira Matsuda',              '松田 明'
  map 'alancfrancis',               "alancfrancis\100gmail.com"
  map 'Alex Chaffee',               'alexch'
  map 'Alex Pooley',                "alex\100msgpad.com"
  map 'Alex Wayne',                 "rubyonrails\100beautifulpixel.com"
  map 'Alex Wolfe',                 "alexkwolfe\100gmail.com"
  map 'Alexander Borovsky',         "alex.borovsky\100gmail.com"
  map 'Alexander Dymo',             'adymo', "dymo\100mk.ukrtelecom.ua"
  map 'Alexander Staubo',           "alex\100purefiction.net", "alex\100byzantine.no"
  map 'Alexey Zatsepin',            'alexey'
  map 'Aliaksey Kandratsenka',      'Aleksey Kondratenko'
  map 'Andreas Isaksson',           'isak'
  map 'Andrew A. Smith',            "andy\100tinnedfruit.org"
  map 'Andrew Bennett',             'PotatoSalad'
  map 'Andrew Chase',               'acechase'  
  map 'Andrew Kaspick',             "akaspick\100gmail.com", 'akaspick', "andrew\100redlinesoftware.com"
  map 'Andrew Peters',              "andrew.john.peters\100gmail.com"
  map 'Andrew White',               'pixeltrix'
  map 'Andy Lien',                  "andylien\100gmail.com"
  map 'Ant Ramm',                   'antramm'
  map 'Anthony Eden',               'aeden'
  map 'Anup Narkhede',              'railsbob'
  map 'Ariejan de Vroom',           'ariejan'
  map 'Arthur Zapparoli',           'arthurgeek'
  map 'Ashley Moran',               "work\100ashleymoran.me.uk"
  map 'Ask Bjørn Hansen',           "ask\100develooper.com"
  map 'Assaf Arkin',                "assaf.arkin\100gmail.com", 'Assaf'
  map 'August Zajonc',              "augustz\100augustz.com"
  map 'Bas van Klinkenberg',        "flash\100vanklinkenbergsoftware.nl"
  map 'Ben Bangert',                "ben\100groovie.org"
  map 'Ben Sandofsky',              'sandofsky'
  map 'Ben Scofield',               'bscofield'
  map 'Ben Sinclair',               "ben\100bensinclair.com"
  map 'Benjamin Curtis',            "rails\100bencurtis.com"
  map 'Bermi Ferrer',               'bermi'
  map 'Bert Goethals',              'BertG'
  map 'Blaine Cook',                'Blaine', 'blaine', "blaine\100odeo.com"
  map 'Blair Zajac',                "blair\100orcaware.com"
  map 'Blake Watters',              "blake\100near-time.com"
  map 'Blane Dabney',               "mdabney\100cavoksolutions.com"
  map 'Bob Aman',                   "bob\100sporkmonger.com"
  map 'Brad Ediger',                "brad.ediger\100madriska.com", "brad\100madriska.com", 'bradediger'
  map 'Brad Ellis',                 "bellis\100deepthought.org"
  map 'Brandt Kurowski',            "brandt\100kurowski.net"
  map 'Brendan Baldwin',            'brendan'
  map 'Brian Egge',                 "brianegge\100yahoo.com"
  map 'Brian Gernhardt',            "benji\100silverinsanity.com"
  map 'Brian Mattern',              "rephorm\100rephorm.com"
  map 'Bryan Helmkamp',             'brynary'
  map 'Bryan Kang',                 'deepblue'
  map 'Bob Silva',                  'BobSilva', "ruby\100bobsilva.com"
  map 'Brad Greenlee',              'bgreenlee'
  map 'Brandon Keepers',            'brandon', "brandon\100opensoul.org"
  map 'Brent Miller',               'Foliosus'
  map 'Brian Donovan',              'eventualbuddha', "devslashnull\100gmail.com"
  map 'Brian Morearty',             'BMorearty'
  map 'Bruce Williams',             "wbruce\100gmail.com"
  map 'Bruno Miranda',              'brupm'
  map 'Caio Chassot',               'caio', "k\100v2studio.com"
  map 'Caleb Tennis',               "caleb\100aei-tech.com"
  map 'Calvin Yu',                  'cyu'
  map 'Cesar Ho',                   'codafoo'
  map 'Chad Ingram',                'matrix9180'
  map 'Chad Pytel',                 'cpytel'
  map 'Charles M. Gerungan',        "charles.gerungan\100gmail.com"
  map 'Chas Grundy',                'chas'
  map 'Cheah Chu Yeow',             'Chu Yeow', 'chuyeow'
  map 'Choon Keat',                 "choonkeat\100gmail.com", 'choonkeat'
  map 'Chris Anderson',             'jchris'
  map 'Chris Brinker',              "chris\100chrisbrinker.com"
  map 'Chris Carter',               "cdcarter\100gmail.com"
  map 'Chris Hapgood',              'cch1'
  map 'Chris Kampmeier',            'kampers'
  map 'Chris McGrath',              "c.r.mcgrath\100gmail.com", 'c.r.mcgrath', "chris\100octopod.info", 'octopod'
  map 'Chris Mear',                 "chris\100feedmechocolate.com", 'chrismear'
  map "Chris O'Sullivan",           'thechrisoshow'
  map 'Chris Roos',                 'chrisroos', "chris\100seagul.co.uk"
  map 'Chris Wanstrath',            "chris\100ozmm.org", 'defunkt'
  map 'Chriztian Steinmeier',       "chriztian.steinmeier\100gmail.com"
  map 'Clifford Heath',             'cjheath'
  map 'Clifford T. Matthews',       'ctm'
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
  map 'Dane Jensen',                'careo'
  map 'Daniel Hobe',                "daniel\100nightrunner.com"
  map 'Daniel Morrison',            'danielmorrison'
  map 'Daniel Rodríguez Troitiño',  'drodriguez'
  map 'Daniel Sheppard',            "daniels\100pronto.com.au"
  map 'Daniel Wanja',               "daniel\100nouvelles-solutions.com"
  map 'Dave Dribin',                "dave-ml\100dribin.org"
  map 'Dave Lee',                   "dave\100cherryville.org"
  map 'Dave Naffis',                'naffis'
  map 'Dave Thomas',                "dave\100pragprog.com", 'pragdave'
  map 'David A. Black',             'dblack', "dblack\100wobblini.net"
  map 'David Altenburg',            "gensym\100mac.com"
  map 'David Calavera',             'calavera', 'david.calavera'
  map 'David Chelimsky',            'dchelimsky'
  map 'David Demaree',              'ddemaree'
  map 'David Dollar',               'ddollar'
  map 'David Easley',               "easleydp\100gmail.com"
  map 'David Felstead',             "david.felstead\100gmail.com", "dfelstead\100site5.com"
  map 'David Heinemeier Hansson',   'DHH'
  map 'David Morton',               "mortonda\100dgrmm.net"
  map 'David N. Welton',            'davidw'
  map 'David Rice',                 'davidjrice'
  map 'David Roetzel',              "rails\100roetzel.de"
  map 'David Rose',                 "doppler\100gmail.com"
  map 'David Rupp',                 "david\100ruppconsulting.com"
  map 'David Weitzman',             "dweitzman\100gmail.com"
  map 'Dee Zsombor',                'Dee.Zsombor', 'zsombor', "Dee.Zsombor\100gmail.com"
  map 'Deirdre Saoirse',            "deirdre\100deirdre.net"
  map 'DeLynn Berry',               'Delynn', 'DeLynn', 'delynnb', 'DeLynn Barry', 'DeLynnB', 'DelynnB', 'DeLynn B', "delynn\100gmail.com"
  map 'Derek DeVries',              'devrieda'
  map 'Derrick Spell',              "derrickspell\100cdmplus.com"
  map 'Dieter Komendera',           'kommen'
  map 'Dirkjan Bussink',            'dbussink'
  map 'Dominic Sisneros',           "dom\100sisna.com"
  map 'Don Park',                   "don.park\100gmail.com"
  map 'Donald Piret',               "donald.piret\100synergetek.be"
  map 'Dr Nic',                     'drnic'
  map 'Duane Johnson',              "duane.johnson\100gmail.com", 'canadaduane'
  map 'Duff OMelia',                "dj\100omelia.org"
  map 'Duncan Beevers',             'duncanbeevers'
  map 'Duncan Robertson',           "duncan\100whomwah.com"
  map 'Eddie Cianci',               'defeated'
  map 'Eddie Stanley',              "eddiewould\100paradise.net.nz"
  map 'Edward Betts',               "edward\100debian.org"
  map 'Eelco Lempsink',             "rails\10033lc0.net"
  map 'Elan Feingold',              "elan\100bluemandrill.com"
  map 'Elijah Miller',              "elijah.miller\100gmail.com", 'jqr'
  map 'Elliot Smith',               "elliot\100townx.org"
  map 'Elliot Winkler',             'mcmire'
  map 'Eloy Duran',                 'alloy'
  map 'Emilio Tagua',               'miloops'
  map 'Eric Daspet',                "eric.daspet\100survol.net"
  map 'Eric Hodel',                 "drbrain\100segment7.net"
  map 'Erik Abele',                 "erik\100codefaktor.de"
  map 'Erik Ordway',                "ordwaye\100evergreen.edu"
  map 'Erik Terpstra',              "erik\100ruby-lang.nl"
  map 'Erlend Halvorsen',           "ehalvorsen+rails\100runbox.com"
  map 'Ernesto Jimenez',            'ernesto.jimenez'
  map 'Esad Hajdarevic',            "esad\100esse.at", 'esad'
  map 'Eugene Pimenov',             'libc'
  map 'Evan DiBiase',               'edibiase'
  map 'Evan Henshaw-Plath',         "evan\100protest.net"
  map 'Evan Weaver',                'evan'
  map 'Evgeny Zislis',              "evgeny.zislis\100gmail.com"
  map 'Fabien Mannessier',          "fabien\100odilat.com"
  map 'Farley Knight',              'farleyknight'
  map 'Farzad Farid',               'farzy'
  map 'Fedot Praslov',              'fedot'
  map 'Ferdinand Svehla',           "f.svehla\100gmail.com", 'f.svehla'
  map 'François Beausoleil',        'FranÃ§ois Beausolei', 'Francois Beausoleil', "fbeausoleil\100ftml.net", "francois.beausoleil\100gmail.com"
  map 'Frederick Cheung',           'fcheung', 'Fred Cheung', 'frederick.cheung', "frederick.cheung\100gmail.com"
  map 'Frederico Macedo',           'frederico'
  map 'Gabe da Silveira',           'dasil003'
  map 'Gabriel Gironda',            "gabriel.gironda\100gmail.com", "gabriel\100gironda.org"
  map 'Gaspard Bucher',             "g.bucher\100teti.ch"
  map 'Geoff Buesing',              'gbuesing', 'Geoffrey Buesing'
  map 'Geoff Coffey',               'gwcoffey'
  map 'Geoff Garside',              'ggarside'
  map 'Giovanni Intini',            "medlar\100medlar.it", 'intinig'
  map 'Glen Gibb',                  'grg'
  map 'Glenn Vanderburg',           'glv'
  map 'Graeme Mathieson',           'mathie'
  map 'Grant Hollingworth',         "grant\100antiflux.org"
  map 'Greg Lappen',                "greg\100lapcominc.com"
  map 'Grzegorz Daniluk',           "daniluk\100yahoo.com"
  map 'Guillaume Carbonneau',       'guillaume'
  map 'Guy Naor',                   "guy.naor\100famundo.com"
  map 'Hampton Catlin',             "hcatlin\100gmail.com"
  map 'Hendrik Mans',               "hendrik\100mans.de"
  map 'Hendy Irawan',               'ceefour'
  map 'Henrik Nyh',                 'Henrik N', "henrik\100nyh.se", 'henrik'
  map 'Herryanto Siatono',          'jugend'
  map 'Hiroshi Saito',              'hiroshi'
  map 'Hongli Lai (Phusion)',       'FooBarWidget', 'Hongli Lai', 'Hongli Lai (Phusion'
  map 'Indrek Juhkam',              'innu'
  map 'Ian White',                  "ian.w.white\100gmail.com"
  map 'Isaac Feliu',                'isaacfeliu'
  map 'Isaac Reuben',               "isaac\100reuben.com"
  map 'Jack Christensen',           "jackc\100hylesanderson.com"
  map 'Jack Danger Canty',          'danger', 'Danger'
  map 'Jacob Atzen',                'jacobat'
  map 'Jacob Fugal',                'lukfugl'
  map 'Jakob Skjerning',            'Jakob S', "jakob\100mentalized.net"
  map 'Jarkko Laine',               "jarkko\100jlaine.net", 'Jarkko', 'jarkko'
  map 'James Adam',                 'lazyatom', "james.adam\100gmail.com"
  map 'James Coglan',               'jcoglan'
  map 'James Conroy-Finn',          'jcf'
  map 'James Cox',                  'imajes'
  map 'James Edward Gray II',       "james\100grayproductions.net", 'JEG2'
  map 'James Lindley',              'jlindley'
  map 'James Mead',                 'floehopper'
  map 'James Megquier',             "james\100slashetc.com"
  map 'James Strachan',             "jstrachan"
  map 'Jamie Macey',                "jamie\100bravenet.com"
  map 'Jamie Orchard-Hays',         "jamie\100dang.com"
  map 'Jamie van Dyke',             'fearoffish'
  map 'Jamie Macey',                "maceywj\100telus.net"
  map 'Jamis Buck',                 'Jamis'
  map 'Jan De Poorter',             'DefV'
  map 'Jan Krutisch',               'halfbyte'
  map 'Jan Prill',                  "JanPrill\100blauton.de"
  map 'Jan Schwenzien',             'jeanmartin'
  map 'Jason Garber',               'jgarber'
  map 'Jason Frey',                 'Jason Frey (Fryguy)'
  map 'Jason Ketterman',            'anshkakashi'
  map 'Jason L Perry',              'ambethia'
  map 'Jason Stewart',              'jstewart'
  map 'Jason Stirk',                "jstirk\100oobleyboo.com"
  map 'Javier Ramírez',             'jramirez'
  map 'Jay Levitt',                 "jay\100jay.fm"
  map 'Jay Pignata',                'Developer' # see 179b451
  map 'Jean Helou',                 "jean.helou\100gmail.com"
  map 'Jean-Philippe Bougie',       "jp.bougie\100gmail.com"
  map 'Jeff Berg',                  "jeff\100ministrycentered.com"
  map 'Jeff Cohen',                 "cohen.jeff\100gmail.com"
  map 'Jeff Cole',                  "rails\100jeffcole.net"
  map 'Jeff Lindsay',               "progrium\100gmail.com"
  map 'Jeffrey Hardy',              'packagethief'
  map 'Jeffrey Moss',               "jeff\100opendbms.com"
  map 'Jens-Christian Fischer',     "jcfischer\100gmail.com"
  map 'Jeremy Durham',              "jeremydurham\100gmail.com"
  map 'Jeremy Evans',               "jeremyevans0\100gmail.com", 'jeremyevans', "jeremye\100bsa.ca.gov", "code\100jeremyevans.net"
  map 'Jeremy Kemper',              'bitsweat'
  map 'Jeremy Hopple',              "jeremy\100jthopple.com"
  map 'Jeremy McAnally',            'jeremymcnally', 'jeremymcanally'
  map 'Jeremy Voorhis',             "jeremy\100planetargon.com", 'jvoorhis'
  map 'Jerrett Taylor',             "jerrett\100bravenet.com"
  map 'Jesse Merriman',             "jessemerriman\100warpmail.net"
  map 'Jim Helm',                   "perlguy\100gmail.com"
  map 'Jim Hughes',                 'jeem'
  map 'Jim Meyer',                  'purp'
  map 'Jim Winstead',               "jimw\100mysql.com"
  map 'Joe Ferris',                 'jferris'
  map 'Joe Goldwasser',             "joe\100mjg2.com"
  map 'Joerg Diekmann',             "joergd\100pobox.com"
  map 'Johan Sørensen',             'Johan Sorensen', 'Johan Sörensen', "johan\100johansorensen.com", "johan\100textdrive.com"
  map 'Johannes Barre',             'iGEL'
  map 'John Barnette',              'jbarnette'
  map 'John Baylor',                'johnb'
  map 'John Mettraux',              'jmettraux'
  map 'John Nunemaker',             "nunemaker\100gmail.com"
  map 'Josh Owens',                 'queso'
  map 'John Sheets',                "dev\100metacasa.net", "jsheets"
  map 'John Wells',                 'jbwiv'
  map 'John Wilger',                'jwilger'
  map 'Jon Bright',                 "jon\100siliconcircus.com"
  map 'Jon Evans',                  "jon.evans\100pobox.com", 'evansj'
  map 'Jon Moses',                  "jon\100burningbush.us"
  map 'Jon Olson',                  "jsolson\100damogran.org"
  map 'John Oxton',                 "rails\100electricvisions.com"
  map 'Jon Wood',                   "jon\100instance-design.co.uk", "jon\100blankpad.net"
  map 'Jonathan Bartlett',          'johnnyb'
  map 'Jonathan Garvin',            "jsgarvin"
  map 'Jonathan Leighton',          "turnip\100turnipspatch.com"
  map 'Jonathan del Strother',      'Catfish', 'catfish'
  map 'Jonathan Viney',             "jonathan\100bluewire.net.nz"
  map 'Jonathan Weiss',             'jweiss'
  map 'Jonathan Younger',           "jonathan\100daikini.com"
  map 'Joost Hietbrink',            'joost'
  map 'Jordan McKible',             "jmckible\100gmail.com"
  map 'Jordi Bunster',              'jordi'
  map 'Jørgen Orehøj Erichsen',     'joerichsen'
  map 'José Valim',                 'josevalim'
  map 'Joseph A. Martin',           "jmartin\100desertflood.com"
  map 'Joseph Hosteny',             "jhosteny\100mac.com"
  map 'Josh Goebel',                'Dreamer3', "dreamer3\100gmail.com"
  map 'Josh Knowles',               "joshknowles\100gmail.com"
  map 'Josh Peek',                  'josh', 'Josh', 'Joshua Peek', 'joshpeek', "josh\100joshpeek.com"
  map 'Josh Starcher',              "josh.starcher\100gmail.com"
  map 'Josh Susser',                'hasmanyjosh', "josh\100hasmanythrough.com"
  map 'Joshua Wehner',              'jaw6'
  map 'Joshua Sierles',             'jsierles'
  map 'Juanjo Bazan',               'juanjo.bazan'
  map 'Julian Doherty',             'madlep'
  map 'Julian Tarkhanov',           "me\100julik.nl", 'julik'
  map 'Justin Ball',                'jbasdf'
  map 'Justin French',              'justinfrench'
  map 'Justin Mecham',              "justin\100aspect.net"
  map 'Kamal Fariz Mahyuddin',      'kamal'
  map 'Kamil Kukura',               'kamk'
  map 'Karel Miarka',               "kajism\100yahoo.com"
  map 'Karel Minařík',              'karmi'
  map 'Kaspar Schiess',             "eule\100space.ch"
  map 'Kazuhiro Yoshdia',           "moriq\100moriq.com", 'moriq', "kazuhiko\100fdiary.net"
  map 'Keegan Quinn',               "keegan\100thebasement.org"
  map 'Keith Morrison',             "keithm\100infused.org"
  map 'Ken Barker',                 "ken.barker\100gmail.com"
  map 'Ken Kunz',                   "kennethkunz\100gmail.com"
  map 'Ken Miller',                 "kenneth.miller\100bitfield.net"
  map 'Kevin Barnes',               "vinbarnes\100gmail.com"
  map 'Kevin Clark',                "Kevin Clark kevin.clark\100gmail.com", "kevin.clark\100gmail.com", "kevin.clark\100gmal.com"
  map 'Kevin Jackson',              "foamdino\100gmail.com"
  map 'Kevin Smith',                'codebrulee'
  map 'Kevin Watt',                 "kevin\100writesoon.com"
  map 'Kevin Williams',             "kevwil\100gmail.com"
  map 'Kim Shrier',                 "kim\100tinker.com"
  map 'Kjetil Lerøen',              "leroen\100gmail.com"
  map 'Koichi Tsutsumi',            "hakuja\100hakuja.net"
  map 'Kornelius Kalnbach',         "murphy\100cYcnus.de", "murpyh\100rubychan.de"
  map 'Kouhei Sutou',               'kou'
  map 'Kristopher Chambers',        "kristopher.chambers\100gmail.com", 'kris_chambers'
  map 'Kubo Takehiro',              'kubo'
  map 'Kyosuke Morohashi',          'moro'
  map 'Lakshan Perera',             'laktek', 'lakshan'
  map 'Larry Williams',             "larrywilliams1\100gmail.com"
  map 'Lars Francke',               "l.francke\100gmx.de"
  map 'Lars Kanis',                 "kanis\100comcard.de"
  map 'Lars Pind',                  "lars\100pinds.com", "lars\100pind.com", 'Lars pind', 'lars pind'
  map 'Laurel Fan',                 "laurel\100gorgorg.org", 'laurelfan'
  map 'Lawrence Pit',               'lawrence'
  map 'Lee Jensen',                 'outerim'
  map 'Lee Marlow',                 'lmarlow', "lmarlow\100yahoo.com"
  map "Lee O'Mara",                 "lee\100omara.ca"
  map 'Leon Breedt',                'Leon Bredt'
  map 'Leslie A. Hensley',          "hensleyl\100papermountain.org"
  map 'Lon Baker',                  "lon\100speedymac.com"
  map 'Loren Johnson',              'lorenjohnson'
  map 'Lori Holden',                'lholden'
  map 'Louis St-Amour',             "LouisStAmour\100gmail.com"
  map 'Luca Guidi',                 'l.guidi'
  map 'Lugovoi Nikolai',            "meadow.nnick\100gmail.com"
  map 'Luismi Cavallé',             'cavalle', 'cavelle'
  map 'Luke Ludwig',                'lukeludwig'
  map 'Luke Redpath',               "contact\100lukeredpath.co.uk"
  map 'maiha',                      'anna', "anna\100wota.jp", "maiha\100wota.jp"
  map 'Maik Schmidt',               "contact\100maik-schmidt.de"
  map 'Manfred Stienstra',          "m.stienstra\100fngtps.com", 'manfred'
  map 'Manuel Holtgrewe',           "purestorm\100ggnore.net"
  map 'Marc Love',                  'marclove'
  map 'Marc-André Cournoyer',       'macournoyer'
  map 'Marcel Molina Jr.',          'Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio', 'Marcel Mollina Jr.'
  map 'Marcello Nuccio',            'marcenuc'
  map 'Marcin Szczepański',         "marcin\100junkheap.net"
  map 'Mariusz Pękala',             'Arsen7'
  map 'Mark A. Richman',            'mrichman'
  map 'Mark H. Wilkinson',          'mhw'
  map 'Mark Imbriaco',              "mark.imbriaco\100pobox.com"
  map 'Mark James',                 "mrj\100bigpond.net.au"
  map 'Mark Lane',                  'DrMark'
  map 'Mark R. James',              'mrj'
  map 'Mark Somerville',            'Spakman'
  map 'Mark Van Holstyn',           'lotswholetime'
  map 'Markus Roberts',             "MarkusQ\100reality.com"
  map 'Martin Emde',                "zraii\100comcast.net", "martin.emde\100gmail.com"
  map 'Masashi Shimbo',             "shimbo\100is.naist.jp"
  map 'Marshall Roch',              'mroch'
  map 'Mathieu Arnold',             "mat\100absolight.fr"
  map 'Mathieu Jobin',              "somekool\100gmail.com"
  map 'Mats Persson',               "mats\100imediatec.co.uk"
  map 'Matt Aimonetti',             'matt'
  map 'Matt Bauer',                 'mattbauer'
  map 'Matt Freels',                'freels'
  map 'Matt Lyon',                  'mattly'
  map 'Matt Margolis',              "matt\100mattmargolis.net"
  map 'Matt Mower',                 "self\100mattmower.com"
  map 'Matt Palmer',                'mpalmer', "mpalmer\100hezmatt.org"
  map 'Matt Parrish',               "mparrish\100pearware.org"
  map 'Matt Pelletier',             "pelletierm\100eastmedia.net"
  map 'Matthew Bass',               'pelargir'
  map 'Matthew Deiters',            'mdeiters'
  map 'Matthew Painter',            "mail\100matthewpainter.co.uk"
  map 'Matthew Rudy Jacobs',        'MatthewRudy'
  map 'Matthew Vincent',            'neshmi'
  map 'Matthew Walker',             "matthew\100walker.wattle.id.au"
  map 'Micah Alles',                "alles\100atomicobject.com"
  map 'Michael Daines',             "me\100mdaines.com"
  map 'Michael Dewey',              "mike\100michaeldewey.org"
  map 'Michael Galero',             'mikong'
  map 'Michael Klishin',            'antares', 'Michael S. Klishin'
  map 'Michael Koziarski',          'Koz', 'nzkoz'
  map 'Michael Raidel',             "raidel\100onemail.at"
  map 'Michael Schoen',             'Michael A. Schoen', "schoenm\100earthlink.net"
  map 'Michael Schubert',           "michael\100schubert", "michael\100schubert.cx"
  map 'Michael Schuerig',           "michael\100schuerig.de", 'Michael Shuerig'
  map 'Michael Sheakoski',          'GMFlash'
  map 'Michal Šafránek',            "wejn\100box.cz"
  map 'Michiaki Baba',              "babie7a0\100ybb.ne.jp"
  map 'Mike Boone',                 'boone'
  map 'Mike Clark',                 "mike\100clarkware.com"
  map 'Mike Gunderloy',             'Michael Gunderloy'
  map 'Mike Laster',                "mlaster\100metavillage.com"
  map 'Mike Mangino',               "mmangino\100elevatedrails.com"
  map 'Mike Naberezny',             'mnaberez'
  map 'Mikel Lindsaar',             'mikel', 'raasdnil'
  map 'Miklós Fazekas',             'mfazekas'
  map 'Mislav Marohnić',            'mislav', 'mislaw', "mislav\100nippur.irb.hr"
  map 'Murray Steele',              'h-lame'
  map 'Nathan Weizenbaum',          'Nex3'
  map 'Nathaniel Talbott',          'ntalbott'
  map 'Neil Wilson',                'NeilW'
  map 'Nicholas Lee',               "emptysands\100gmail.com"
  map 'Nicholas Seckar',            'Ulysses'
  map 'Nick Kallen',                'nkallen'
  map 'Nick Sieger',                'nicksieger', "nicksieger\100gmail.com", 'Nick'
  map 'Nicolas Cavigneaux',         'Bounga'
  map 'Nicolas Pouillard',          "nicolas.pouillard\100gmail.com"
  map 'Nicolás Sanguinetti',        'foca'
  map 'Nik Wakelin',                'nik.wakelin', 'nik.kakelin'
  map 'Nikolay Petrachkov',         'jastix'
  map 'Nils-Helge Garli Hegvik',    'nilsga'
  map 'Nils Jonsson',               "nils\100alumni.rice.edu"
  map 'Nobuhiro Imai',              "nov\100yo.rim.or.jp"
  map 'Nobukazu Matake',            'nov'
  map 'Norbauer Inc',               'norbauer'
  map 'Norbert Crombach',           'norbert'
  map 'Norman Elton',               "normelton\100gmail.com"
  map 'Obie Fernandez',             'ObieFernandez'
  map 'okkez',                      "okkez000\100gmail.com"
  map 'Oleg Andreev',               'oleganza'
  map 'Oleg Frolov',                "oleg.frolov\100gmail.com"
  map 'Oleg Pudeyev',               "pudeyo\100rpi.com"
  map 'Olivier Ansaldi',            "olivier_ansaldi\100yahoo.com"
  map 'Olly Headey',                'lylo'
  map 'Otto Hilska',                'mutru'
  map 'Pascal Terjan',              "pterjan\100mandriva.com"
  map 'Pat Maddox',                 "pergesu\100gmail.com"
  map 'Patrick Burleson',           'pburleson', "pburleson\100gmail.com"
  map 'Patrick Hurley',             "phurley\100gmail.com"
  map 'Patrick Joyce',              "patrick.t.joyce"
  map 'Patrick Lenz',               "patrick\100lenz.sh"
  map 'Paul Butcher',               "paul\100paulbutcher.com"
  map 'Paul Smith',                 "paul\100cnt.org"
  map 'Pelle Braendgaard',          'pelle'
  map 'Per Wigren',                 "tuxie\100dekadance.se", 'Tuxie'
  map 'Perry Smith',                'pedz'
  map 'Pete Yandell',               'notahat'
  map 'Peter Michaux',              "petermichaux\100gmail.com"
  map 'Peter Williams',             'pezra'
  map 'Phil Bogle',                 "philbogle\100gmail.com"
  map 'Phil Hagelberg',             "technomancy\100gmail.com"
  map 'Phil Orwig',                 'cluon'
  map 'Philip Hallstrom',           'phallstrom'
  map 'Philip Ross',                "phil.ross\100gmail.com"
  map 'Philippe April',             "ror\100philippeapril.com"
  map 'Phillip J. Birmingham',      "phillip\100pjbsoftware.com"
  map 'Piers Cawley',               "pdcawley\100bofh.org.uk"
  map 'Piotr Banasik',              "piotr\100t-p-l.com", 'piotr'
  map 'PJ Hyett',                   "pjhyett\100gmail.com"
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
  map 'Rob Rasmussen',              "rob.rasmussen\100gmail.com"
  map 'Rob Sanheim',                'rsanheim', "rsanheim\100gmail.com", "rob\100thinkrelevance.com"
  map 'Robby Russell',              'robbyrussell'
  map 'Robin H. Johnson',           "robbat2\100gentoo.org"
  map 'Roderick van Domburg',       'roderickvd'
  map 'Rodney Ramdas',              "rramdas\100gmail.com"
  map 'Ron DiFrango',               "rdifrango\100captechventures.com"
  map 'Ross Kaffenberger',          'Ross Kaffenburger'
  map 'Ruben Nine',                 "ruben.nine\100gmail.com"
  map 'Russell Norris',             'RSL'
  map 'Ruy Asan',                   'rubyruy'
  map 'Ryan Bates',                 'ryanb'
  map 'Ryan Bigg',                  'Radar'
  map 'Ryan Davis',                 'zenspider'
  map 'Ryan Daigle',                'rwdaigle'
  map 'Ryan Davis',                 "ryand-ruby\100zenspider.com"
  map 'Ryan Duryea',                'aguynamedryan'
  map 'Ryan McGeary',               'rmm5t'
  map 'Ryan Raaum',                 "ryan.raaum\100gmail.com"
  map 'Ryan Tomayko',               "rtomayko\100gmail.com"
  map 'Sam Granieri',               'sjgman9'
  map 'Sam Kirchmeier',             "sam.kirchmeier\100gmail.com"
  map 'Sam Stephenson',             'Sam', 'sam'
  map 'Sandra Metz',                "sandra.metz\100duke.edu"
  map 'Scott Bronson',              'bronson'
  map 'Scott Fleckenstein',         'nullstyle'
  map 'Scott Laird',                "scott\100sigkill.org"
  map 'Scott Mace',                 "rscottmace\100gmail.com"
  map 'Scott Raymond',              "sco\100scottraymond.net"
  map 'Scott Reilly',               'coffee2code'
  map 'Sean T Allen',               "sean\100ardismg.com"
  map 'Sebastian Delmont',          "sd\100notso.net"
  map 'Sebastian Graessl',          'bastilian'
  map 'Sebastian Kanthak',          "sebastian.kanthak\100muehlheim.de", 'sebastian.kanthak', 'skanthak'
  map 'Sébastien Goetz',            "sebastien\100goetzilla.info"
  map 'Serge Balyuk',               'bgipsy'
  map 'Sergey Kojin',               "sergeykojin\100gmail.com"
  map 'Seth Rasmussen',             'loincloth'
  map 'Shu-yu Guo',                 "arc\100uchicago.edu"
  map 'Shugo Maeda',                'shugo', "shugo\100ruby-lang.org"
  map 'Simon Arnaud',               "maznawak\100nerim.net"
  map 'Simon Harris',               "simon\100redhillconsulting.com.au"
  map 'Simon Moore',                'saimonmoore'
  map 'Simon Stapleton',            "simon.stapleton\100gmail.com"
  map 'Stefan Kaes',                "skaes\100web.de", 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de', 'stefan', 'Stefan', 'skae', 'skaen'
  map 'Stephen Haberman',           "stephenh\100chase3000.com"
  map 'Stephen Sykes',              'sdsykes'
  map 'Stephen Touset',             "stephen\100touset.org"
  map 'Stephen Veit',               "sveit\100tradeharbor.com"
  map 'Steve Purcell',              "stephen_purcell\100yahoo.com"
  map 'Steven Bristol',             'stevenbristol'
  map 'Steven Soroka',              "ssoroka78\100gmail.com", 'ssoroka'
  map 'Stian Grytøyr',              "stian\100grytoyr.net"
  map 'Surendra Singhi',            "ssinghi\100kreeti.com"
  map 'Sven Klemm',                 "sven\100c3d2.de"
  map 'Tarmo Tänav',                'tarmo', 'tarmo_t', 'Tarmo Täna'
  map 'Taryn East',                 'taryn'
  map 'Thijs van der Vossen',       'thijsv', "thijs\100vandervossen.net", "thijs\100fngtps.com"
  map 'Thomas Enebo',               "tom.enebo\100gmail.com"
  map 'Thomas Fuchs',               "thomas\100fesch.at", 'madrobby'
  map 'Tiago Macedo',               'tmacedo'
  map 'Tieg Zaharia',               'tzaharia'
  map 'Tietew',                     "tietew\100tietew.net"
  map 'Tim Fletcher',               "twoggle\100gmail.com"
  map 'Tim Lucas',                  "t.lucas\100toolmantim.com"
  map 'Tim Pope',                   'tpope', 'Time Pope', "rails\100tpope.info", 'pope'
  map 'Tim Trautmann',              "timct\100mac.com"
  map 'Tobias Lütke',               'Tobias Luetke', 'TobiasLuetke', 'Tobias Luekte', 'xal'
  map 'Todd Gehman',                "todd\100robotcoop.com", 'todd'
  map 'Todd Hanson',                "hanson\100surgery.wisc.edu"
  map 'Tom Brice',                  'tomtoday', "tomtoday\100gmail.com"
  map 'Tom Fakes',                  "tom\100craz8.com"
  map 'Tom Lieber',                 "thomas\100columbus.rr.com"
  map 'Tom Moertel',                "tom\100moertel.com"
  map 'Tom Mornini',                "tmornini\100infomania.com"
  map 'Tom Preston-Werner',         'mojombo'
  map 'Tom Ward',                   'Tom ward', 'tomafro', "tom\100popdog.net"
  map 'Trent Ogren',                'misfo'
  map 'Trevor Squire',              'protocool'
  map 'Tyler Kiley',                "tyler\100kianta.com"
  map 'Tyler Kovacs',               "tyler.kovacs\100gmail.com"
  map 'Victor Jalencas',            "victor-ronr-trac\100carotena.net"
  map 'Wesley Moxam',               'wmoxam'
  map 'Will Bryant',                'will.bryant'
  map 'Wilson Bilkovich',           "wilsonb\100gmail.com"
  map 'Wolfgang Klinger',           "wolfgang\100stufenlos.net"
  map 'Xavier Noria',               'fxn'
  map 'Xavier Shay',                'xaviershay'
  map 'Yehuda Katz',                'wycats'
  map 'Yoji Shidara',               "darashi\100gmail.com"
  map 'Yonatan Feldman',            "yon\100milliped.com"
  map 'Yuri Leikind',               'leikind'
  map 'Yurii Rashkovskii',          "yrashk\100gmail.com", "yrashk\100fp.org.ua"
  map 'Zac Williams',               'jzw'
  map 'Zach Dennis',                'zdennis'
  map 'Zachary Holt',               "z\100wzph.com"
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
        # Signed-off-by: Michael Koziarski <michael\100koziarski.com> [#https://rails.lighthouseapp.com/attachments/106066/0001-Ensure-SqlBypass-use-ActiveRecord-Base-connection.patch state:committed]
        nil
      when 'Carlhuda'
        ['Yehuda Katz', 'Carl Lerche']
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
      when "jon\100blankpad.net)"
        # see 35d3ede
        ["jon\100blankpad.net"]
      when 'Nick Quaranto and Josh Nichols'
        ['Nick Quaranto', 'Josh Nichols']
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

#
# Some facts:
#   * the handler "todd" is not Todd Hanson
#
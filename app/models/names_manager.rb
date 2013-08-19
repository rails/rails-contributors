# encoding: utf-8

require 'set'

module NamesManager
  PEOPLE_WHO_PREFER_THEIR_HANDLER_TO_BE_LISTED = %w(
    okkez
    maiha
    burningTyger
  )

  module EmailAddresses
    # I've sent an email to these email addresses, and there's no response
    # so far.
    WAITING_FOR = %W(
      agkr\100pobox.com
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
      imbcmdth\100hotmail.com
      info\100loobmedia.com
      jan\100ulbrich-boerwang.de
      jhahn\100niveon.com
      jonrailsdev\100shumi.org
      junk\100miriamtech.com
      justin\100textdrive.com
      machomagna\100gmail.com
      me\100jonnii.com
      nick+rails\100ag.arizona.edu
      rails.20.clarry\100spamgourmet.com
      rails-bug\100owl.me.uk
      s.brink\100web.de
      schultzr\100gmail.com
      seattle\100rootimage.msu.edu
      yanowitz-rubyonrails\100quantumfoam.org
    )

    # I've sent an email to these addresses, and got some sort of error back.
    UNREACHABLE = %W(
      altano\100bigfoot.com
      asnem\100student.ethz.ch
      damn_pepe\100gmail.com
      dev.rubyonrails\100maxdunn.com
      kdole\100tamu.edu
      kevin-temp\100writesoon.com
      mklame\100atxeu.com
      nbpwie102\100sneakemail.com
      nkriege\100hotmail.com
      nwoods\100mail.com
      pfc.pille\100gmx.net
      rails\100cogentdude.com
      rcolli2\100tampabay.rr.com
      rubyonrails\100atyp.de
      solo\100gatelys.com
      starr\100starrnhorne.com
      zachary\100panandscan.com
    )

    ADDRESSES_WHOSE_CONTRIBUTORS_PREFER_TO_REMAIN_UNRESOLVED = %W(
      lagroue\100free.fr
    )
  end

  module GithubUsernames
    # I sent an internal message to these people asking for confirmation or full names.
    WAITING_FOR = %w(
      blackanger
      ian
      jerome
      mark
      Paul
      robby
      shane
      tom
      xavier
    )

    NOT_THEM = [
      'adam',
      'alex',
      'Andreas',
      'Caleb', # but wrote to Caleb Tennis, waiting for
      'dan',
      'David',
      'jamesh',
      'jonathan',
      'Kent',
      'mat',
      'Scott',
      'seth',
      'steve',
      'trevor'
    ]
  end

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
    SEEN_ALSO_AS[canonical_name.nfc] = also_as.map(&:nfc)
  end

  def self.authors_of_special_cased_commits(commit)
    case commit.sha1
    when '1382f4de1f9b0e443e7884bd4da53c20f0754568'
      # This was a commit backported from 2.3 that missed Dana in the way.
      ['David Burger', 'Dana Jones']
    when '882dd4e6054470ee56c46ab1432861952c81b633'
      # The following patch comes from this ticket https://rails.lighthouseapp.com/projects/8994/tickets/2856
      # but Yehuda told me credit for that commit was screwed up.
      ['David Calavera']
    when 'f9a02b12d15bdbd3c2ed18b16b31b712a77027bc'
      # The attribution is done with parens in a way we do not extract.
      ['Juan Lupión']
    when '4b4aa8f6e08ba2aa2ddce56f1d5b631a78eeef6c'
      # parens again
      ['Jesper Hvirring Henriksen']
    when '945d999aadc9df41487e675fa0a863396cb54e31'
      # Author is "pivotal", but Adam Milligan told me Chris is the author (via github).
      ['Chris Heisterkamp']
    when 'eb457ceee13779ade67e1bdebd2919d476148277'
      # Author is "pivotal", but Adam Milligan told me Joseph is the author (via github).
      ['Joseph Palermo']
    when '6f2c4991efbbc5f567a6df36ca78de4f3ca24ee2', '9dbde4f5cbd0617ee6cce3e41d41335f9c9ce3fd'
      # Author is "pivotal", but Adam Milligan told me he himself is the author (via github).
      ['Adam Milligan']
    when 'ddf2b4add33d5e54c5f5e7adacadbb50d3fa7b52'
      ['Xavier Noria']
    when '3b1c69d2dd2b24a29e4443d7dc481589320a3f3e'
      ['Kieran Pilkington']
    when 'e813ad2a42549e308a69fd9473f1b9ed531a0d7e'
      ['Andrew Grimm'] # see #3999
    when '2414fdb244cc0ba97620dd3f50e269d2e26c7392'
      ['Jens Kolind'] # see #1859
    when '1851af84c1c7244dc416be9c93a4700b70e801e3'
      # The commit message has a line ending with "user[password]", and the current heuristics
      # interpret "password" is the contributor. Changing the heuristic is brittle so by now
      # it is handled by hand so that at least the credit goes to Santiago.
      ['Santiago Pastorino']
    when '83ecd03e7d3472c16decbf1b9939da53347b36a3'
      # Similar issue, some lines in the commit message end with "[x86_64-darwin10.4.0]"
      # or similar.
      ['Stevie Graham']
    when 'a4041c5392457448cfdfef2e1b24007cfa46948b'
      # Vishnu forked using a different email address, and credit goes in the git commit
      # to Vishnu K. Sharma because of that, but the commit is his.
      ['Vishnu Atrai']
    when 'ec44763f03b49e8c6e3bff71772ba32863a01306'
      # @The_Empty asked for this fix on Twitter.
      ['Mohammad Typaldos']
    when '99dd117d6292b66a60567fd950c7ca2bda7e01f3'
      # same here
      ['Mohammad Typaldos']
    when '3582bce6fdb30730b34b91a17b8bb33066eed7b8'
      # The attribution was wrong, and amended later in 33736bc18a9733d95953f6eaec924db10badc908
      ['Juanjo Bazán', 'Tarmo Tänav', 'BigTitus']
    when 'bc43763247e25058ca1ab50637a649f0b5b186eb'
      # The author in Git is just "David", name clash with David.
      ['David Wang']
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
  map 'Aaron Eisenberger',          'Aaron'
  map 'Aaron Namba',                'anamba'
  map 'Aaron Pfeifer',              'obrie'
  map 'Aaron Todd',                 'ozzyaaron'
  map 'Abhay Kumar',                'abhay'
  map 'Adam Hawkins',               'twinturbo', 'adman65'
  map 'Adam Johnson',               'adamj'
  map 'Adam Kramer',                "adam\100the-kramers.net"
  map 'Adam Majer',                 "adamm\100galacticasoftware.com"
  map 'Adam Wiggins',               'adamwiggins'
  map 'Adam Williams',              'aiwilliams', 'awilliams'
  map 'Adelle Hartley',             "adelle\100bullet.net.au"
  map 'Adrien Coquio',              'bobbus'
  map 'Adrien Siami',               'Intrepidd'
  map 'Akio Tajima',                'arton', 'artonx'
  map 'Akira Ikeda',                "ikeda\100dream.big.or.jp"
  map 'Akira Matsuda',              '松田 明'
  map 'Akira Tagoh',                'tagoh'
  map 'alancfrancis',               "alancfrancis\100gmail.com"
  map 'Alan Francis',               'alancfrancis', 'acf'
  map 'Albert Lash',                'docunext'
  map 'Alex Chaffee',               'alexch'
  map 'Alex Mishyn',                'amishyn'
  map 'Alex Pooley',                "alex\100msgpad.com"
  map 'Alex Wayne',                 "rubyonrails\100beautifulpixel.com", 'Squeegy'
  map 'Alex Wolfe',                 "alexkwolfe\100gmail.com"
  map 'Alexander Baronec',          'abonec'
  map 'Alexander Borovsky',         "alex.borovsky\100gmail.com"
  map 'Alexander Dymo',             'adymo', "dymo\100mk.ukrtelecom.ua"
  map 'Alexander Staubo',           "alex\100purefiction.net", "alex\100byzantine.no"
  map 'Alexander Uvarov',           'wildchild'
  map 'Alexey Nikitin',             'tank-bohr'
  map 'Alexey Trofimenko',          'codesnik'
  map 'Alexey Zatsepin',            'alexey', 'Alexey'
  map 'Aliaksey Kandratsenka',      'Aleksey Kondratenko'
  map 'Aliaxandr Rahalevich',       'saksmlz', 'saks'
  map 'Alvaro Pereyra',             'Xenda'
  map 'Anand Muthukrishnan',        'Anand'
  map 'Anatoli Makarevich',         'Anatoly Makarevich'
  map 'Andrea Longhi',              'andrea longhi', 'spaghetticode'
  map 'Andreas Isaksson',           'isak'
  map 'Andreas Wurm',               'Kanetontli', 'Kane', 'kane'
  map 'Andrew A. Smith',            "andy\100tinnedfruit.org"
  map 'Andrew Bennett',             'PotatoSalad'
  map 'Andrew Chase',               'acechase', 'Andrew'
  map 'Andrew Grim',                'stopdropandrew'
  map 'Andrew Kaspick',             "akaspick\100gmail.com", 'akaspick', "andrew\100redlinesoftware.com"
  map 'Andrew Peters',              "andrew.john.peters\100gmail.com"
  map 'Andrew Shcheglov',           'windock'
  map 'Andrew White',               'pixeltrix'
  map 'Andrey Morskov',             'accessd', 'Accessd'
  map 'Andy Lien',                  "andylien\100gmail.com"
  map 'Angelo Capilleri',           'angelo giovanni capilleri', 'Angelo capilleri'
  map 'Ankit Gupta',                'ankit8898', 'Ankit Gupta-FIR'
  map 'Ant Ramm',                   'antramm'
  map 'Anthony Alberto',            'Anthony'
  map 'Anthony Eden',               'aeden'
  map 'Anton Cherepanov',           'davetoxa'
  map 'Antonio Tapiador del Dujo',  'Antonio Tapiador'
  map 'Anuj Dutta',                 'anuj  dutta'
  map 'Anup Narkhede',              'railsbob'
  map 'Ara T Howard',               'ara.t.howard'
  map 'Ariejan de Vroom',           'ariejan'
  map 'Arkadiy Zabazhanov',         'pyromaniac'
  map 'Artem Avetisyan',            'artemave'
  map 'Artem Kramarenko',           'artemk'
  map 'Arthur Zapparoli',           'arthurgeek'
  map 'Arvid Andersson',            'arvida'
  map 'Ashley Moran',               "work\100ashleymoran.me.uk"
  map 'Ask Bjørn Hansen',           "ask\100develooper.com"
  map 'Assaf Arkin',                "assaf.arkin\100gmail.com", 'Assaf'
  map 'AthonLab',                   'athonlab'
  map 'August Zaitzow Flatby',      "zaitzow\100gmail.com"
  map 'August Zajonc',              "augustz\100augustz.com"
  map 'Avner Cohen',                'AvnerCohen'
  map 'Ayose Cazorla',              'Ayose'
  map 'Bagwan Pankaj',              'bagwanpankaj'
  map 'Bas van Klinkenberg',        "flash\100vanklinkenbergsoftware.nl", 'Bas Van Klinkenberg'
  map 'Ben Bangert',                "ben\100groovie.org"
  map 'Ben Sandofsky',              'sandofsky'
  map 'Ben Scofield',               'bscofield'
  map 'Ben Sinclair',               "ben\100bensinclair.com"
  map 'Benedikt Deicke',            'benedikt'
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
  map 'Brian Pearce',               'brianp'
  map 'Bruce Williams',             "wbruce\100gmail.com"
  map 'Bruno Miranda',              'brupm'
  map 'Buddhika Laknath',           'laknath', 'Laknath'
  map 'Caio Chassot',               'caio', "k\100v2studio.com"
  map 'Caleb Tennis',               "caleb\100aei-tech.com"
  map 'Calvin Yu',                  'cyu'
  map 'Carina C. Zona',             'cczona'
  map 'Carl Tashian',               'tashian'
  map 'Cássio Marques',             'CassioMarques'
  map 'Cédric Fabianski',           'Cédric FABIANSKI', 'cfabianski'
  map 'Cesar Ho',                   'codafoo'
  map 'Chad Humphries',             'spicycode'
  map 'Chad Ingram',                'matrix9180'
  map 'Chad Pytel',                 'cpytel'
  map 'Chad Woolley',               'thewoolleyman'
  map 'Chaitanya Vellanki',         'chaitanyav'
  map 'Charles M. Gerungan',        "charles.gerungan\100gmail.com"
  map 'Charles Nutter',             "headius\100headius.com"
  map 'Chas Grundy',                'chas'
  map 'Cheah Chu Yeow',             'Chu Yeow', 'chuyeow'
  map 'Choon Keat',                 "choonkeat\100gmail.com", 'choonkeat'
  map 'Chris Anderson',             'jchris'
  map 'Chris Brinker',              "chris\100chrisbrinker.com"
  map 'Chris Carter',               "cdcarter\100gmail.com"
  map 'Chris Finne',                'chrisfinne', 'chris finne'
  map 'Chris Hapgood',              'cch1'
  map 'Chris Kampmeier',            'kampers'
  map 'Chris McGrath',              "c.r.mcgrath\100gmail.com", 'c.r.mcgrath', "chris\100octopod.info", 'octopod'
  map 'Chris Mear',                 "chris\100feedmechocolate.com", 'chrismear'
  map "Chris O'Sullivan",           'thechrisoshow'
  map 'Chris Roos',                 'chrisroos', "chris\100seagul.co.uk"
  map 'Chris Wanstrath',            "chris\100ozmm.org", 'defunkt'
  map 'Christopher Redinger',       'redinger'
  map 'Chriztian Steinmeier',       "chriztian.steinmeier\100gmail.com"
  map 'Claudio Baccigalupo',        'claudiob', 'Claudio B.'
  map 'Clifford Heath',             'cjheath'
  map 'Clifford T. Matthews',       'ctm'
  map 'Coda Hale',                  'codahale'
  map 'Cody Fauser',                "codyfauser\100gmail.com"
  map 'Corey Haines',               'coreyhaines'
  map 'Courtenay Gasking',          'court3nay', 'courtenay', "court3nay\100gmail.com"
  map 'Craig Davey',                'eigentone', "eigentone\100gmail.com"
  map 'Cristi Balan',               'Cristi BALAN'
  map 'Damian Janowski',            'djanowski'
  map 'Damien Mathieu',             'dmathieu'
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
  map 'Dave Murphy',                'Wintermute'
  map 'Dave Naffis',                'naffis'
  map 'Dave Thomas',                "dave\100pragprog.com", 'pragdave'
  map 'David A. Black',             'dblack', "dblack\100wobblini.net"
  map 'David Altenburg',            "gensym\100mac.com"
  map 'David Calavera',             'calavera', 'david.calavera'
  map 'David Chelimsky',            'dchelimsky'
  map 'David Demaree',              'ddemaree'
  map 'David Dollar',               'ddollar'
  map 'David E. Wheeler',           'Theory'
  map 'David Easley',               "easleydp\100gmail.com"
  map 'David Felstead',             "david.felstead\100gmail.com", "dfelstead\100site5.com"
  map 'David François',             'David FRANCOIS', 'davout'
  map 'David Heinemeier Hansson',   'DHH', 'David' # for David see 5d5f0bad6e934d9d4fad7d0fa4643d04c13709a9
  map 'David Morton',               "mortonda\100dgrmm.net"
  map 'David N. Welton',            'davidw'
  map 'David Raynes',               'rayners'
  map 'David Rice',                 'davidjrice'
  map 'David Roetzel',              "rails\100roetzel.de"
  map 'David Rose',                 "doppler\100gmail.com"
  map 'David Rupp',                 "david\100ruppconsulting.com"
  map 'David Wang',                 'dahakawang'
  map 'David Weitzman',             "dweitzman\100gmail.com"
  map 'Dee Zsombor',                'Dee.Zsombor', 'zsombor', "Dee.Zsombor\100gmail.com"
  map 'Deirdre Saoirse',            "deirdre\100deirdre.net"
  map 'DeLynn Berry',               'Delynn', 'DeLynn', 'delynnb', 'DeLynn Barry', 'DeLynnB', 'DelynnB', 'DeLynn B', "delynn\100gmail.com"
  map 'Demetrius Nunes',            'demetrius', 'Demetrius'
  map 'Derek DeVries',              'devrieda'
  map 'Derrick Spell',              "derrickspell\100cdmplus.com"
  map 'Dick Davies',                'rasputnik'
  map 'Diego Giorgini',             'ogeidix'
  map 'Dieter Komendera',           'kommen'
  map 'Dirkjan Bussink',            'dbussink'
  map 'Dmitry Vorotilin',           'Dmitriy Vorotilin'
  map 'Dmitrii Samoilov',           'german'
  map 'Dmitrij Mjakotnyi',          'kucaahbe'
  map 'Dmitry Dedov',               'dm1try'
  map 'Dmitry Lipovoi',             'pleax'
  map 'Dmitriy Timokhin',           'pager'
  map 'Dominic Sisneros',           "dom\100sisna.com"
  map 'Don Park',                   "don.park\100gmail.com"
  map 'Donald Piret',               "donald.piret\100synergetek.be"
  map 'Dr Nic Williams',            'drnic', 'Dr Nic'
  map 'Duane Johnson',              "duane.johnson\100gmail.com", 'canadaduane'
  map 'Duff OMelia',                "dj\100omelia.org"
  map 'Duncan Beevers',             'duncanbeevers'
  map 'Duncan Robertson',           "duncan\100whomwah.com"
  map 'Dustin Curtis',              'dcurtis'
  map 'Eaden McKee',                'eadz', 'Eadz'
  map 'Eddie Cianci',               'defeated'
  map 'Eddie Stanley',              "eddiewould\100paradise.net.nz"
  map 'Eduardo Cavazos',            'dharmatech'
  map 'Edward Betts',               "edward\100debian.org"
  map 'Eelco Lempsink',             "rails\10033lc0.net"
  map 'Egor Homakov',               'homa', 'homakov'
  map 'Elan Feingold',              "elan\100bluemandrill.com"
  map 'Elijah Miller',              "elijah.miller\100gmail.com", 'jqr'
  map 'Elliot Smith',               "elliot\100townx.org"
  map 'Elliot Winkler',             'mcmire'
  map 'Elliot Yates',               'ejy'
  map 'Eloy Duran',                 'alloy'
  map 'Emili Parreño',              'eparreno', 'Emili Parreno'
  map 'Emilio Tagua',               'miloops'
  map 'Eric Daspet',                "eric.daspet\100survol.net"
  map 'Eric Hodel',                 "drbrain\100segment7.net"
  map 'Erik Abele',                 "erik\100codefaktor.de"
  map 'Erik Ordway',                "ordwaye\100evergreen.edu"
  map 'Erik Terpstra',              "erik\100ruby-lang.nl"
  map 'Erlend Halvorsen',           "ehalvorsen+rails\100runbox.com"
  map 'Ernesto Jimenez',            'ernesto.jimenez'
  map 'Ershad Kunnakkadan',         'Ershad K', 'ershad'
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
  map 'Felix Dominguez',            'dacat'
  map 'Ferdinand Svehla',           "f.svehla\100gmail.com", 'f.svehla'
  map 'Florian Munz',               'theflow'
  map 'Francesco Rodríguez',        'Francesco Rodriguez'
  map 'François Beausoleil',        'FranÃ§ois Beausolei', 'Francois Beausoleil', "fbeausoleil\100ftml.net", "francois.beausoleil\100gmail.com"
  map 'Frank Müller',               'suchasurge'
  map 'Frederick Cheung',           'fcheung', 'Fred Cheung', 'frederick.cheung', "frederick.cheung\100gmail.com"
  map 'Frederico Macedo',           'frederico'
  map 'G S Phani Kumar',            'gsphanikumar'
  map 'Gabe da Silveira',           'dasil003'
  map 'Gabriel Gironda',            "gabriel.gironda\100gmail.com", "gabriel\100gironda.org"
  map 'Ganesh Kumar',               'ganesh'
  map 'Gaspard Bucher',             "g.bucher\100teti.ch"
  map 'Gavin Morrice',              'Bodacious'
  map 'Genki Takiuchi',             "takiuchi\100drecom.co.jp"
  map 'Geoff Buesing',              'gbuesing', 'Geoffrey Buesing'
  map 'Geoff Coffey',               'gwcoffey'
  map 'Geoff Garside',              'ggarside'
  map 'Geoff Jacobsen',             'jacott'
  map 'Geoffrey Grosenbach',        'topfunky'
  map 'Georg Friedrich',            'gfriedrich'
  map 'Giovanni Intini',            "medlar\100medlar.it", 'intinig'
  map 'Glen Gibb',                  'grg'
  map 'Glenn Vanderburg',           'glv'
  map 'Graeme Mathieson',           'mathie'
  map 'Grant Hollingworth',         "grant\100antiflux.org"
  map 'Greg Lappen',                "greg\100lapcominc.com"
  map 'Greg Miller',                'vertigoclinic'
  map 'Grzegorz Daniluk',           "daniluk\100yahoo.com"
  map 'Guillaume Carbonneau',       'guillaume'
  map 'Gustavo Leon',               'HPNeo'
  map 'Guy Naor',                   "guy.naor\100famundo.com"
  map 'Hal Brodigan',               'postmodern'
  map 'Hampton Catlin',             "hcatlin\100gmail.com"
  map 'Hendrik Mans',               "hendrik\100mans.de"
  map 'Hendy Irawan',               'ceefour'
  map 'Henrik Nyh',                 'Henrik N', "henrik\100nyh.se", 'henrik'
  map 'Herryanto Siatono',          'jugend'
  map 'Hiroshi Saito',              'hiroshi'
  map 'Hongli Lai (Phusion)',       'FooBarWidget', 'Hongli Lai', 'Hongli Lai (Phusion'
  map 'Ian White',                  "ian.w.white\100gmail.com"
  map 'Ibrahim Abdullah',           'simply-phi'
  map 'Igor Fedoronchuk',           'Igor', 'Fivell'
  map 'Indrek Juhkam',              'innu'
  map 'Innokenty Mikhailov',        'gregolsen'
  map 'Irfan Adilovic',             'Irfy'
  map 'Isaac Feliu',                'isaacfeliu'
  map 'Isaac Reuben',               "isaac\100reuben.com"
  map 'Iván Vega',                  'ivanvr'
  map 'J Kittiyachavalit',          'jkit'
  map 'Jack Christensen',           "jackc\100hylesanderson.com"
  map 'Jack Danger Canty',          'danger', 'Danger'
  map 'Jacob Atzen',                'jacobat'
  map 'Jacob Fugal',                'lukfugl'
  map 'Jacob Straszynski',          'jacobstr'
  map 'Jake Janovetz',              'janovetz'
  map 'Jakob Skjerning',            'Jakob S', "jakob\100mentalized.net"
  map 'Jarkko Laine',               "jarkko\100jlaine.net", 'Jarkko', 'jarkko'
  map 'James Adam',                 'lazyatom', "james.adam\100gmail.com"
  map 'James Coglan',               'jcoglan'
  map 'James Conroy-Finn',          'jcf'
  map 'James Cox',                  'imajes'
  map 'James Edward Gray II',       "james\100grayproductions.net", 'JEG2'
  map 'James Golick',               'jamesgolick'
  map 'James Healy',                'yob'
  map 'James Lindley',              'jlindley'
  map 'James Mead',                 'floehopper'
  map 'James Megquier',             "james\100slashetc.com"
  map 'James Miller',               'bensie'
  map 'James Strachan',             "jstrachan"
  map 'James Tucker',               'raggi'
  map 'Jamie Hill',                 'jamie'
  map 'Jamie Macey',                "jamie\100bravenet.com", "maceywj\100telus.net"
  map 'Jamie Orchard-Hays',         "jamie\100dang.com"
  map 'Jamie van Dyke',             'fearoffish'
  map 'Jamis Buck',                 'Jamis'
  map 'Jan Berdajs',                'MrBrdo', 'mrbrdo'
  map 'Jan De Poorter',             'DefV'
  map 'Jan Krutisch',               'halfbyte'
  map 'Jan Prill',                  "JanPrill\100blauton.de"
  map 'Jan Schwenzien',             'jeanmartin'
  map 'Jan Xie',                    'Jan'
  map 'Jared Haworth',              'jardeon'
  map 'Jason Garber',               'jgarber'
  map 'Jason Frey',                 'Jason Frey (Fryguy)'
  map 'Jason Ketterman',            'anshkakashi'
  map 'Jason L Perry',              'ambethia'
  map 'Jason Roth',                 'Jason'
  map 'Jason Stewart',              'jstewart'
  map 'Jason Stirk',                "jstirk\100oobleyboo.com"
  map 'Javier Ramírez',             'jramirez'
  map 'Jay Levitt',                 "jay\100jay.fm"
  map 'Jean Baptiste Barth',        'jbbarth'
  map 'Jean Helou',                 "jean.helou\100gmail.com", 'jean.helou'
  map 'Jean-Philippe Bougie',       "jp.bougie\100gmail.com"
  map 'Jeff Berg',                  "jeff\100ministrycentered.com"
  map 'Jeff Cohen',                 "cohen.jeff\100gmail.com"
  map 'Jeff Cole',                  "rails\100jeffcole.net"
  map 'Jeff Dutil',                 'jdutil'
  map 'Jeff Lindsay',               "progrium\100gmail.com"
  map 'Jeffrey Hardy',              'packagethief'
  map 'Jeffrey Moss',               "jeff\100opendbms.com"
  map 'Jens-Christian Fischer',     "jcfischer\100gmail.com"
  map 'Jeremy Durham',              "jeremydurham\100gmail.com"
  map 'Jeremy Evans',               "jeremyevans0\100gmail.com", 'jeremyevans', "jeremye\100bsa.ca.gov", "code\100jeremyevans.net"
  map 'Jeremy Jackson',             'jejacks0n'
  map 'Jeremy Kemper',              'bitsweat'
  map 'Jeremy Hopple',              "jeremy\100jthopple.com"
  map 'Jeremy Lightsmith',          'stellsmi'
  map 'Jeremy McAnally',            'jeremymcnally', 'jeremymcanally'
  map 'Jeremy Voorhis',             "jeremy\100planetargon.com", 'jvoorhis'
  map 'Jeroen van Ingen',           'jeroeningen'
  map 'Jérôme Lipowicz',            'jerome'
  map 'Jerrett Taylor',             "jerrett\100bravenet.com"
  map 'Jesse Merriman',             "jessemerriman\100warpmail.net"
  map 'Jim Helm',                   "perlguy\100gmail.com"
  map 'Jim Hughes',                 'jeem'
  map 'Jim Meyer',                  'purp'
  map 'Jim Winstead',               "jimw\100mysql.com"
  map 'Joe Ferris',                 'jferris'
  map 'Joe Goldwasser',             "joe\100mjg2.com"
  map 'Joel Watson',                'watsonian'
  map 'Joerg Diekmann',             "joergd\100pobox.com"
  map 'Johan Sørensen',             'Johan Sorensen', 'Johan Sörensen', "johan\100johansorensen.com", "johan\100textdrive.com"
  map 'Johannes Barre',             'iGEL'
  map 'John Barnette',              'jbarnette'
  map 'John Barton',                'johnb'
  map 'John F. Douthat',            'johndouthat'
  map 'John J. Wang',               'wangjohn'
  map 'John Mettraux',              'jmettraux'
  map 'John Nunemaker',             "nunemaker\100gmail.com"
  map 'John Pignata',               'Developer', 'Jay Pignata' # see 179b451
  map 'Josh Owens',                 'queso'
  map 'John Sheets',                "dev\100metacasa.net", "jsheets"
  map 'John Wells',                 'jbwiv'
  map 'John Wilger',                'jwilger'
  map 'Johnson Wang',               'spyhole'
  map 'Jon Bright',                 "jon\100siliconcircus.com"
  map 'Jon Evans',                  "jon.evans\100pobox.com", 'evansj'
  map 'Jon Moses',                  "jon\100burningbush.us"
  map 'Jon Olson',                  "jsolson\100damogran.org"
  map 'John Oxton',                 "rails\100electricvisions.com"
  map 'John Warwick',               'jwarwick'
  map 'Jon Seidel',                 'JESii'
  map 'Jon Wood',                   "jon\100instance-design.co.uk", "jon\100blankpad.net"
  map 'Jonathan Bartlett',          'johnnyb'
  map 'Jonathan Garvin',            "jsgarvin"
  map 'Jonathan Goldman',           'jonnii'
  map 'Jonathan Leighton',          "turnip\100turnipspatch.com"
  map 'Jonathan del Strother',      'Catfish', 'catfish'
  map 'Jonathan Viney',             "jonathan\100bluewire.net.nz"
  map 'Jonathan Weiss',             'jweiss'
  map 'Jonathan Younger',           "jonathan\100daikini.com"
  map 'Joost Baaij',                'joost', "joost\100spacebabies.nl"
  map 'Jordan McKible',             "jmckible\100gmail.com"
  map 'Jordan Staub',               'jordanstaub'
  map 'Jordi Bunster',              'jordi'
  map 'Jørgen Orehøj Erichsen',     'joerichsen'
  map 'Jose Angel Cortinas',        'jacortinas'
  map 'José Valim',                 'josevalim', "Jose' Valim"
  map 'Joseph A. Martin',           "jmartin\100desertflood.com"
  map 'Joseph Hosteny',             "jhosteny\100mac.com"
  map 'Josh Goebel',                'Dreamer3', "dreamer3\100gmail.com", 'yyyc514'
  map 'Josh Knowles',               "joshknowles\100gmail.com"
  map 'Josh Peek',                  'josh', 'Josh', 'Joshua Peek', 'joshpeek', "josh\100joshpeek.com"
  map 'Josh Starcher',              "josh.starcher\100gmail.com"
  map 'Josh Susser',                'hasmanyjosh', "josh\100hasmanythrough.com"
  map 'Joshua Wehner',              'jaw6'
  map 'Joshua Sierles',             'jsierles'
  map 'Juan David Pastas',          'juanpastas', 'juan david pastas'
  map 'Juan De Bravo',              'juandebravo'
  map 'Juanjo Bazán',               'Juanjo Bazan', 'juanjo.bazan'
  map 'Julian Doherty',             'madlep'
  map 'Julian Tarkhanov',           "me\100julik.nl", 'julik'
  map 'Jun Jiang',                  'jasl'
  map 'Justin Ball',                'jbasdf'
  map 'Justin French',              'justinfrench'
  map 'Justin Mecham',              "justin\100aspect.net"
  map 'Kamal Fariz Mahyuddin',      'kamal'
  map 'Kamil Kukura',               'kamk'
  map 'Karel Miarka',               "kajism\100yahoo.com"
  map 'Karel Minařík',              'karmi', 'Karel Minarik'
  map 'Kaspar Schiess',             "eule\100space.ch"
  map 'Kazuhiro Yoshida',           "moriq\100moriq.com", 'moriq', "kazuhiko\100fdiary.net"
  map 'Keegan Quinn',               "keegan\100thebasement.org"
  map 'Kei Shiratsuchi',            'kei'
  map 'Keith Gautreaux',            'kaygee', 'kgautreaux'
  map 'Keith Morrison',             "keithm\100infused.org"
  map 'Ken Barker',                 "ken.barker\100gmail.com"
  map 'Ken Kunz',                   "kennethkunz\100gmail.com"
  map 'Ken Gerrard',                'backspace'
  map 'Ken Miller',                 "kenneth.miller\100bitfield.net"
  map 'Kevin Barnes',               "vinbarnes\100gmail.com"
  map 'Kevin Clark',                "Kevin Clark kevin.clark\100gmail.com", "kevin.clark\100gmail.com", "kevin.clark\100gmal.com"
  map 'Kevin Jackson',              "foamdino\100gmail.com"
  map 'Kevin Smith',                'codebrulee'
  map 'Kevin Watt',                 "kevin\100writesoon.com"
  map 'Kevin Williams',             "kevwil\100gmail.com"
  map 'Kim Shrier',                 "kim\100tinker.com"
  map 'Kir Shatrov',                'kirs', 'Kir'
  map 'Kjetil Lerøen',              "leroen\100gmail.com"
  map 'Koichi Tsutsumi',            "hakuja\100hakuja.net"
  map 'Kornelius Kalnbach',         "murphy\100cYcnus.de", "murpyh\100rubychan.de", 'murphy'
  map 'Kouhei Sutou',               'kou'
  map 'Krishna Kotecha',            'krishna'
  map 'Kristopher Chambers',        "kristopher.chambers\100gmail.com", 'kris_chambers'
  map 'Krzysztof Knapik',           'knapo'
  map 'Kubo Takehiro',              'kubo'
  map 'Kym McInerney',              'holodigm', 'Kym'
  map 'Kyosuke Morohashi',          'moro'
  map 'Lakshan Perera',             'laktek', 'lakshan'
  map 'Larry Lv',                   'larrylv'
  map 'Larry Williams',             "larrywilliams1\100gmail.com"
  map 'Lars Francke',               "l.francke\100gmx.de"
  map 'Lars Kanis',                 "kanis\100comcard.de"
  map 'Lars Pind',                  "lars\100pinds.com", "lars\100pind.com", 'Lars pind', 'lars pind'
  map 'Laurel Fan',                 "laurel\100gorgorg.org", 'laurelfan'
  map 'Lawrence Pit',               'lawrence'
  map 'Lebin Sebastian F',          'libin'
  map 'Lee Jensen',                 'outerim'
  map 'Lee Marlow',                 'lmarlow', "lmarlow\100yahoo.com"
  map "Lee O'Mara",                 "lee\100omara.ca"
  map 'Lennon Day-Reynolds',        'rcoder'
  map 'Leo Lou',                    'l4u'
  map 'Leon Breedt',                'Leon Bredt'
  map 'Leslie A. Hensley',          "hensleyl\100papermountain.org"
  map 'Lewis Jubb',                 "minimudboy\100gmail.com"
  map 'Lihan Li',                   'lihanli', 'lihan'
  map 'Logy Laps',                  'logylaps'
  map 'Lon Baker',                  "lon\100speedymac.com"
  map 'Loren Johnson',              'lorenjohnson'
  map 'Lori Holden',                'lholden'
  map 'Louis St-Amour',             "LouisStAmour\100gmail.com"
  map 'Lourens Naudé',              'Lourens Naude'
  map 'Luca Guidi',                 'l.guidi'
  map 'Lucas Catón',                'Lucas Caton'
  map 'Lugovoi Nikolai',            "meadow.nnick\100gmail.com"
  map 'Luismi Cavallé',             'cavalle', 'cavelle'
  map 'Luke Ludwig',                'lukeludwig'
  map 'Luke Redpath',               "contact\100lukeredpath.co.uk"
  map 'maiha',                      'anna', "anna\100wota.jp", "maiha\100wota.jp"
  map 'Maik Schmidt',               "contact\100maik-schmidt.de", 'maik schmidt'
  map 'Manfred Stienstra',          "m.stienstra\100fngtps.com", 'manfred'
  map 'Manu J',                     "Manu"
  map 'Manuel Holtgrewe',           "purestorm\100ggnore.net"
  map 'Marc Love',                  'marclove'
  map 'Marc-André Cournoyer',       'macournoyer'
  map 'Marc-André Lafortune',       'Marc-Andre Lafortune'
  map 'Marc Huffnagle',             'mhuffnagle'
  map 'Marcel Molina Jr.',          'Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio', 'Marcel Mollina Jr.'
  map 'Marcello Nuccio',            'marcenuc'
  map 'Marcin Szczepański',         "marcin\100junkheap.net"
  map 'Marcos Tapajós',             'Marcos Tapajos'
  map 'Mariusz Pękala',             'Arsen7'
  map 'Marjan Hratson',             'gmarik'
  map 'Mark A. Richman',            'mrichman'
  map 'Mark H. Wilkinson',          'mhw'
  map 'Mark Imbriaco',              "mark.imbriaco\100pobox.com"
  map 'Mark James',                 "mrj\100bigpond.net.au"
  map 'Mark J. Titorenko',          'mtitorenko'
  map 'Mark Lane',                  'DrMark'
  map 'Mark R. James',              'mrj'
  map 'Mark Somerville',            'Spakman'
  map 'Mark Van Holstyn',           'lotswholetime'
  map 'Mark W. Foster',             'mfoster'
  map 'Markus Roberts',             "MarkusQ\100reality.com"
  map 'Marten Veldthuis',           'Marten'
  map 'Martin Emde',                "zraii\100comcast.net", "martin.emde\100gmail.com"
  map 'Martin Schuerrer',           "@MSch", "MSch", "Martin Schürrer"
  map 'Masashi Shimbo',             "shimbo\100is.naist.jp"
  map 'Mark Daggett',               'heavysixer'
  map 'Marshall Roch',              'mroch'
  map 'Martin Gamsjaeger',          'snusnu'
  map 'Mason Hale',                 'flowdelic'
  map 'Mathieu Arnold',             "mat\100absolight.fr"
  map 'Mathieu Jobin',              "somekool\100gmail.com"
  map 'Mathieu Ravaux',             'mathieuravaux'
  map 'Mats Persson',               "mats\100imediatec.co.uk"
  map 'Matt Boehlig',               'Matt B.'
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
  map 'Mattt Thompson',             '@mattt'
  map 'Maxime Réty',                'Maxime RETY', 'maximerety'
  map 'Melih Arda Yalçiner',        'Wizard'
  map 'Mica Eked',                  'mica eked'
  map 'Micah Alles',                "alles\100atomicobject.com"
  map 'Michael Cetrulo',            'Samus_'
  map 'Michael Coyne',              'mikeycgto'
  map 'Michael Daines',             "me\100mdaines.com"
  map 'Michael Dewey',              "mike\100michaeldewey.org"
  map 'Michael Hoffman',            'hoffm'
  map 'Michael Galero',             'mikong'
  map 'Michael Grosser',            'grosser'
  map 'Michael Hutchinson',         'mhutchin'
  map 'Michael Klishin',            'antares', 'Michael S. Klishin'
  map 'Michael Koziarski',          'Koz', 'nzkoz'
  map 'Michael Pearson',            'Mip Earson'
  map 'Michael Raidel',             "raidel\100onemail.at"
  map 'Michael Schoen',             'Michael A. Schoen', "schoenm\100earthlink.net"
  map 'Michael Schubert',           "michael\100schubert", "michael\100schubert.cx"
  map 'Michael Schuerig',           "michael\100schuerig.de", 'Michael Shuerig'
  map 'Michael Sheakoski',          'GMFlash'
  map 'Michal Šafránek',            "wejn\100box.cz"
  map 'Michiaki Baba',              "babie7a0\100ybb.ne.jp"
  map 'Miguel Fernández',           'Miguel', 'miguelff'
  map 'Mike Boone',                 'boone'
  map 'Mike Clark',                 "mike\100clarkware.com"
  map 'Mike Gunderloy',             'Michael Gunderloy'
  map 'Mike Laster',                "mlaster\100metavillage.com"
  map 'Mike Mangino',               "mmangino\100elevatedrails.com"
  map 'Mike Naberezny',             'mnaberez'
  map 'Mike Subelsky',              'subelsky'
  map 'Mikel Lindsaar',             'mikel', 'raasdnil'
  map 'Miklós Fazekas',             'mfazekas'
  map 'Mislav Marohnić',            'mislav', 'mislaw', "mislav\100nippur.irb.hr", 'Mislav Marohnic'
  map 'Moses Hohman',               'moses'
  map 'Murahashi Sanemat Kenichi',  'sanemat'
  map 'Murray Steele',              'h-lame'
  map 'Nathan Weizenbaum',          'Nex3'
  map 'Nathaniel Talbott',          'ntalbott'
  map 'Neil Wilson',                'NeilW'
  map 'Nicholas Lee',               "emptysands\100gmail.com"
  map 'Nicholas Seckar',            'Ulysses'
  map 'Nick Cox',                   'thenickcox'
  map 'Nick Kallen',                'nkallen'
  map 'Nick Plante',                'zapnap'
  map 'Nick Sieger',                'nicksieger', "nicksieger\100gmail.com", 'Nick'
  map 'Nicolas Blanco',             'slainer68'
  map 'Nicolas Cavigneaux',         'Bounga'
  map 'Nicolás Hock Isaza',         'Nicolas Hock Isaza'
  map 'Nicolas Pouillard',          "nicolas.pouillard\100gmail.com"
  map 'Nicolás Sanguinetti',        'foca', 'Nicolas Sanguinetti'
  map 'Nik Wakelin',                'nik.wakelin', 'nik.kakelin'
  map 'Nikolay Petrachkov',         'jastix'
  map 'Nils-Helge Garli Hegvik',    'nilsga'
  map 'Nils Jonsson',               "nils\100alumni.rice.edu"
  map 'Nobuhiro Imai',              "nov\100yo.rim.or.jp", 'Nobuhiro IMAI'
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
  map 'Oliver Legg',                'Olly Legg'
  map 'Olli Rissanen',              'Noemj'
  map 'Olly Headey',                'lylo'
  map 'Orta Therox',                'orta'
  map 'Otto Hilska',                'mutru'
  map 'Pablo Astigarraga',          'pote', 'PoTe'
  map 'Pascal Belloncle',           'psq'
  map 'Pascal Terjan',              "pterjan\100mandriva.com"
  map 'Pat Maddox',                 "pergesu\100gmail.com"
  map 'Patrick Burleson',           'pburleson', "pburleson\100gmail.com"
  map 'Patrick Hurley',             "phurley\100gmail.com"
  map 'Patrick Joyce',              "patrick.t.joyce"
  map 'Patrick Lenz',               "patrick\100lenz.sh"
  map 'Pau',                        'nosolopau'
  map 'Paul Butcher',               "paul\100paulbutcher.com"
  map 'Paul Carey',                 'paulccarey'
  map 'Paul Smith',                 "paul\100cnt.org"
  map 'Paweł Mikołajewski',         'dfens'
  map 'Pelle Braendgaard',          'pelle', 'Pelle'
  map 'Per Wigren',                 "tuxie\100dekadance.se", 'Tuxie'
  map 'Perry Flinn',                'pbflinn'
  map 'Perry Smith',                'pedz'
  map 'Pete Brown',                 'beerlington'
  map 'Pete Yandell',               'notahat'
  map 'Peter Michaux',              "petermichaux\100gmail.com"
  map 'Peter Williams',             'pezra'
  map 'Phil Bogle',                 "philbogle\100gmail.com"
  map 'Phil Hagelberg',             "technomancy\100gmail.com", 'technomancy'
  map 'Phil Orwig',                 'cluon'
  map 'Philip Hallstrom',           'phallstrom'
  map 'Philip Ross',                "phil.ross\100gmail.com"
  map 'Philipp Weißensteiner',      'Philipp Weissensteiner'
  map 'Philippe April',             "ror\100philippeapril.com"
  map 'Phillip J. Birmingham',      "phillip\100pjbsoftware.com"
  map 'Piers Cawley',               "pdcawley\100bofh.org.uk"
  map 'Piotr Banasik',              "piotr\100t-p-l.com", 'piotr'
  map 'Pirogov Evgenij',            'gmile'
  map 'Pivotal Labs',               'pivotal', 'Pivotal  Labs'
  map 'PJ Hyett',                   "pjhyett\100gmail.com"
  map 'Prakash Murthy',             'prakashmurthy'
  map 'Pratik Naik',                'Pratik', 'pratik', 'lifofifo', 'lifo'
  map 'Rafael Mendonça França',     'Rafael França'
  map 'Rahul P. Chaudhari',         'RAHUL CHAUDHARI', 'Rahul Chaudhari'
  map 'Rainer Blessing',            'RainerBlessing'
  map 'Rajarshi Das',               'rajarshi', 'rajars2576', 'rajcybage','Rajarshi', 'RAJARSHI', 'RAJARSHI DAS'
  map 'Ramon Quezada',              'rayq', 'rpq'
  map 'Raphael Bauduin',            "raphinou\100yahoo.com"
  map 'Ravil Bayramgalin',          'brainopia'
  map 'Rein Henrichs',              "ReinH"
  map "Remco van 't Veer",          'remvee'
  map 'Rémy Coutable',              'rymai', 'remy', "rymai\100rymai.com", "remy.coutable\100gmail.com"
  map 'Richard Schneeman',          'Schneems', 'schneems', '@schneems'
  map 'Rick Bradley',               "rick\100rickbradley.com"
  map 'Rich Collins',               'richcollins', "richcollins\100gmail.com"
  map 'Rick DeNatale',              'RubyRedRick'
  map 'Rick Olson',                 'rick', 'Rick', 'Rick Olsen', "technoweenie\100gmail.com", 'Rich Olson'
  map 'Riley Lynch',                'Riley', 'teleological'
  map 'Rizwan Reza',                'rizwanreza'
  map 'Robert Evans',               'revans'
  map 'Roberto Miranda',            'robertomiranda'
  map 'Roman Le Négrate',           'Roman Le Negrate'
  map 'Russell Norris',             'rsl', 'RSL'
  map 'Rob Anderton',               'Rob'
  map 'Rob Biedenharn',             'rabiedenharn', "Rob\100AgileConsultingLLC.com"
  map 'Rob Halff',                  "info\100rhalff.com"
  map 'Rob Rasmussen',              "rob.rasmussen\100gmail.com"
  map 'Rob Sanheim',                'rsanheim', "rsanheim\100gmail.com", "rob\100thinkrelevance.com"
  map 'Robby Russell',              'robbyrussell'
  map 'Robert Pankowecki',          'Robert Pankowecki (Gavdi)'
  map 'Robert Speicher',            'rspeicher'
  map 'Robin Fisher',               'robinjfisher'
  map 'Robin H. Johnson',           "robbat2\100gentoo.org"
  map 'Roderick van Domburg',       'roderickvd'
  map 'Rodney Ramdas',              "rramdas\100gmail.com"
  map 'Rodrigo Navarro',            'reu'
  map 'Rohit Arondekar',            'rohit'
  map 'Roman Dittert',              'RomD'
  map 'Roman Le Négrate',           'Roman2K', 'Roman Le Negrate'
  map 'Ron DiFrango',               "rdifrango\100captechventures.com"
  map 'Ross Kaffenberger',          'Ross Kaffenburger'
  map 'Ruben Nine',                 "ruben.nine\100gmail.com"
  map 'Russell Norris',             'RSL', 'rsl'
  map 'Ruy Asan',                   'rubyruy'
  map 'Ryan Bates',                 'ryanb'
  map 'Ryan Bigg',                  'Radar'
  map 'Ryan Daigle',                'rwdaigle'
  map 'Ryan Davis (zenspider)',     'Ryan Davis', 'zenspider', "ryand-ruby\100zenspider.com"
  map 'Ryan Davis (ryepup)',        'ryepup'
  map 'Ryan Duryea',                'aguynamedryan'
  map 'Ryan Heath',                 'rpheath'
  map 'Ryan McGeary',               'rmm5t'
  map 'Ryan Raaum',                 "ryan.raaum\100gmail.com"
  map 'Ryan Tomayko',               "rtomayko\100gmail.com"
  map 'Sachin Singh',               'sachin87', 'Sachin87'
  map 'Sam Elliott',                'Samuel Elliott'
  map 'Sam Granieri',               'sjgman9'
  map 'Sam Kirchmeier',             "sam.kirchmeier\100gmail.com"
  map 'Sam Stephenson',             'Sam', 'sam'
  map 'Sandra Metz',                "sandra.metz\100duke.edu"
  map 'Sasha Gerrand',              'sgerrand'
  map 'Scott Bronson',              'bronson'
  map 'Scott Fleckenstein',         'nullstyle'
  map 'Scott Laird',                "scott\100sigkill.org"
  map 'Scott Mace',                 "rscottmace\100gmail.com"
  map 'Scott Meade',                'smeade'
  map 'Scott Raymond',              "sco\100scottraymond.net"
  map 'Scott Reilly',               'coffee2code'
  map 'Scott Schram',               'ScottSchram'
  map 'Scott Willson',              'scottwillson', 'scott_willson'
  map 'Sean Dent',                  'doabit'
  map 'Sean Geoghegan',             'seangeo'
  map 'Sean Hussey',                'seanhussey'
  map 'Sean T Allen',               "sean\100ardismg.com"
  map 'Sebastian Delmont',          "sd\100notso.net"
  map 'Sebastian Graessl',          'bastilian'
  map 'Sebastian Kanthak',          "sebastian.kanthak\100muehlheim.de", 'sebastian.kanthak', 'skanthak'
  map 'Sebastian Spieszko',         'ciastek'
  map 'Serg Podtynnyi',             'shtirlic'
  map 'Serge Balyuk',               'bgipsy'
  map 'Sergey Kojin',               "sergeykojin\100gmail.com"
  map 'Sergey Nartimov',            'lest'
  map 'Sergio Gil',                 'Sergio Gil Pérez de la Manga'
  map 'Seth Ladd',                  'sethladd'
  map 'Seth Rasmussen',             'loincloth'
  map 'Shu-yu Guo',                 "arc\100uchicago.edu"
  map 'Shugo Maeda',                'shugo', "shugo\100ruby-lang.org"
  map 'Si Jobling',                 'Si'
  map 'Simon Arnaud',               "maznawak\100nerim.net"
  map 'Simon Harris',               "simon\100redhillconsulting.com.au", 'haruki_zaemon'
  map 'Simon Jefford',              'simonjefford'
  map 'Simon Moore',                'saimonmoore'
  map 'Simon Stapleton',            "simon.stapleton\100gmail.com"
  map 'Solomon White',              "solo\100gatelys.com"
  map 'Stanislav Sobolev',          'Stanislav'
  map 'Starr Horne',                "starr\100starrnhorne.com"
  map 'Stefan Kaes',                "skaes\100web.de", 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de', 'stefan', 'Stefan', 'skae', 'skaen'
  map 'St. Louis Ruby Users Group', "stlruby\100googlegroups.com"
  map 'Stephen Blackstone',         'sblackstone'
  map 'Stephen Haberman',           "stephenh\100chase3000.com"
  map 'Stephen St. Martin',         'Steve St. Martin'
  map 'Stephen Sykes',              'sdsykes'
  map 'Stephen Touset',             "stephen\100touset.org"
  map 'Stephen Veiss',              'sveiss'
  map 'Stephen Veit',               "sveit\100tradeharbor.com"
  map 'Steve Purcell',              "stephen_purcell\100yahoo.com"
  map 'Steve Richert',              'laserlemon'
  map 'Steven Bristol',             'stevenbristol', 'steve'
  map 'Steven Soroka',              "ssoroka78\100gmail.com", 'ssoroka'
  map 'Stian Grytøyr',              "stian\100grytoyr.net"
  map 'Sudara Williams',            'Sudara'
  map 'Sung-hee Kang',              'paranoiase Kang', 'paranoiase'
  map 'Sur Max',                    'sur'
  map 'Surendra Singhi',            "ssinghi\100kreeti.com"
  map 'Sven Klemm',                 "sven\100c3d2.de"
  map 'Sven Kräuter',               'Sven Kraeuter | 5v3n', 'Sven Kraeuter', '5v3n'
  map 'Tadas Tamošauskas',          'Tadas Tamosauskas'
  map 'Takoyaki Kamen',             'タコ焼き仮面'
  map 'Tal Rotbart',                'redbeard'
  map 'Tarmo Tänav',                'tarmo', 'tarmo_t', 'Tarmo Täna'
  map 'Taryn East',                 'taryn', 'taryneast', "rubygirl\100taryneast.org"
  map 'Tekin Suleyman',             'Tekin'
  map 'Teng Siong Ong',             'siong1987'
  map 'Thierry Zires',              'zires'
  map 'Thijs van der Vossen',       'thijsv', "thijs\100vandervossen.net", "thijs\100fngtps.com"
  map 'Thomas Enebo',               "tom.enebo\100gmail.com"
  map 'Thomas Fuchs',               "thomas\100fesch.at", 'madrobby'
  map 'Thomas R. Koll',             'TomK32'
  map 'Thomas Sawyer',              'trans'
  map 'Thomas Watson Steen',        'watson'
  map 'Thong Kuah',                 'kuahyeow'
  map 'Tiago Macedo',               'tmacedo'
  map 'Tieg Zaharia',               'tzaharia'
  map 'Tietew',                     "tietew\100tietew.net"
  map 'Tim Carpenter',              'timc'
  map 'Tim Fletcher',               "twoggle\100gmail.com"
  map 'Tim Forbes',                 'leprasmurf'
  map 'Tim Lucas',                  "t.lucas\100toolmantim.com", 'toolmantim'
  map 'Tim Pope',                   'tpope', 'Time Pope', "rails\100tpope.info", 'pope'
  map 'Tim Trautmann',              "timct\100mac.com"
  map 'Tobias Lütke',               'Tobias Luetke', 'TobiasLuetke', 'Tobias Luekte', 'xal'
  map 'Toby Cabot',                 'toby cabot'
  map 'Todd Gehman',                "todd\100robotcoop.com", 'todd'
  map 'Todd Hanson',                "hanson\100surgery.wisc.edu"
  map 'Tom Brice',                  'tomtoday', "tomtoday\100gmail.com"
  map 'Tom Fakes',                  "tom\100craz8.com"
  map 'Tom Hoefer',                 'thoefer'
  map 'Tom Lieber',                 "thomas\100columbus.rr.com"
  map 'Tom Moertel',                "tom\100moertel.com"
  map 'Tom Mornini',                "tmornini\100infomania.com"
  map 'Tom Preston-Werner',         'mojombo'
  map 'Tom Stone',                  'iaddict'
  map 'Tom Ward',                   'Tom ward', 'tomafro', "tom\100popdog.net"
  map 'Tony Jian',                  '簡煒航'
  map 'Toshinori Kajihara',         'kennyj'
  map 'Trek Glowacki',              'trek'
  map 'Trent Ogren',                'misfo'
  map 'Trevor Squire',              'protocool'
  map 'Troels Petersen',            'tnp'
  map 'Tyler Kiley',                "tyler\100kianta.com"
  map 'Tyler Kovacs',               "tyler.kovacs\100gmail.com"
  map 'Uģis Ozols',                 'Ugis Ozols'
  map 'Vasili Kachalko',            'dreamfall'
  map 'Victor Babenko',             'virusman'
  map 'Victor Jalencas',            "victor-ronr-trac\100carotena.net"
  map 'Vijay Dev',                  'vijay', 'vijaydev'
  map 'Vitalii Khustochka',         "xyctka\100gmail.com", 'khustochka'
  map 'Vitaly Kushner',             'vitaly'
  map 'Vlad Romascanu',             'vladr'
  map 'Volodymyr Shatsky',          'shock_one', 'shockone'
  map 'Wang Chun',                  'wangchun'
  map 'Wes Gamble',                 'weyus'
  map 'Wesley Beary',               'geemus'
  map 'Wesley Moxam',               'wmoxam', 'wesley.moxam'
  map 'Will Bryant',                'will.bryant', 'Will'
  map 'Will Harris',                'wharris'
  map 'Wilson Bilkovich',           "wilsonb\100gmail.com", 'wilson'
  map 'Winston Teo Yong Wei',       'Winston'
  map 'Wolfgang Klinger',           "wolfgang\100stufenlos.net"
  map 'Xavier Defrang',             'xavier'
  map 'Xavier Noria',               'fxn'
  map 'Xavier Shay',                'xaviershay'
  map 'Yehuda Katz',                'wycats'
  map 'Yoji Shidara',               "darashi\100gmail.com"
  map 'Yonatan Feldman',            "yon\100milliped.com", 'yon'
  map 'Yossef Mendelssohn',         'ymendel'
  map 'Yury Korolev',               'yury'
  map 'Yuri Leikind',               'leikind'
  map 'Yurii Rashkovskii',          "yrashk\100gmail.com", "yrashk\100fp.org.ua"
  map 'Zac Williams',               'jzw'
  map 'Zach Dennis',                'zdennis'
  map 'Zachary Holt',               "z\100wzph.com"
  map 'Zack Chandler',              'zackchandler'
  map 'Zheng Jia',                  'zhengjia'

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

  # Removes email addresses (anything between <...>), and strips whitespace.
  def self.sanitize(name)
    name.sub(/<[^>]+>/, '').strip
  end

  CONNECTORS_REGEXP = %r{(?:[,/&+]|\band\b)}

  # Inspects raw candidates in search for rare cases.
  #
  # Returns +nil+ if +name+ is known *not* to correspond to an author, the
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
      when '\\x00-\\x1f'
        #  Fix ActiveSupport::JSON encoding of control characters [\x00-\x1f]
        nil
      when /\ACloses #\d+\z/i
        # Add shallow routes to the new router [Closes #3765]
        nil
      when /\AFixes #\d+\z/i
        # see https://github.com/rails/rails/commit/7db2ef47a1966113dd5d52c2f620b8496acabf56
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
      when /ci[ _-]skip/i
        # see https://github.com/rails/rails/commit/86c5cea9f414d34fd92adb064fde5ecc7b40c727
        #     https://github.com/rails/rails/commit/86c5cea9f414d34fd92adb064fde5ecc7b40c727
        nil
      when /skip[ _-]ci/i
        # see https://github.com/rails/rails/commit/b1c28d710521c6931abc2b394de34ac8a174d844
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

#
# Some facts:
#   * the handler "todd" is not Todd Hanson
#

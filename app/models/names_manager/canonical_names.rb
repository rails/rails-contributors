module NamesManager
  module CanonicalNames
    # Returns the canonical name for +name+.
    #
    # Email addresses are removed, leading/trailing whitespace and
    # surrounding Markdown *s are deleted. If no equivalence is known
    # the canonical name is the resulting sanitized string by definition.
    def canonical_name_for(name, email)
      name = name.sub(/<[^>]+>/, '') # remove any email address in angles
      name.strip!

      # Commit 28d52c59f2cb32180ca24770bf95597ea3ad8198 for example uses
      # Markdown in the commit message: [*Godfrey Chan*, *Aaron Patterson*].
      # This is really exceptional so we special-case this instead of doing
      # anything more generic.
      name.sub!(/\A\*/, '')
      name.sub!(/\*\z/, '')
      disambiguate(name, email) || multialias(name) || CANONICAL_NAME_FOR[name] || name
    end

    private

    def disambiguate(name, email)
      case name
      when 'abhishek'
        case email
        when 'abhishek.jain@vinsol.com' then 'Abhishek Jain'
        when 'bigbeliever@gmail.com'    then 'Abhishek Yadav'
        end
      when 'Adam'
        case email
        when 'Adam89@users.noreply.github.com' then 'Adam Magan'
        when 'kohnkecomm@Adam-iMac.local' then 'kohnkecomm'
        end
      when 'Alexander'
        case email
        when "avabonec\100gmail.com", "abonec\100gmail.com" then 'Alexander Baronec'
        when "alxndr+github\100gmail.com" then 'Alexander Quine'
        when "dembskoi\100gmail.com" then 'Dembskiy Alexander'
        end
      when 'Akshay'
        case email
        when "akshaymohite31\100yahoo.com" then 'Akshay Mohite'
        end
      when 'Sam'
        case email
        when "sam.saffron\100gmail.com" then 'Sam Saffron'
        end
      when 'James'
        case email
        when "james.bowles\100abletech.co.nz" then 'James Bowles'
        end
      when 'root'
        case email
        when "mohamed.o.alnagdy\100gmail.com" then 'Mohamed Osama'
        end
      when 'unknown'
        case email
        when "agrimm\100.(none)" then 'Andrew Grimm'
        when "jeko1\100.npfit.nhs.uk" then 'Jens Kolind'
        when "Manish Puri\100NYO000011657014.ads.mckinsey.com" then 'Manish Puri'
        end
      when 'David'
        case email
        when "david\100loudthinking.com" then 'David Heinemeier Hansson'
        when "DevilDavidWang\100gmail.com" then 'David Wang'
        end
      when 'Dan'
        case email
        when "dan.burnette\100watershed5.com" then 'Daniel Burnette'
        end
      when 'Jan'
        case email
        when "jan\100habermann24.com" then 'Jan Habermann'
        when "jan.h.xie\100gmail.com" then 'Jan Xie'
        end
      when 'Mark'
        case email
        when "mark\100rakino.(none)" then 'MarkMT'
        when "markchav3z\100gmail.com" then 'mrkjlchvz'
        end
      when 'Jonathan'
        case email
        when "greenbigfrog\100gmail.com" then 'greenbigfrog'
        end
      when 'Jack'
        case email
        when "aquajach\100gmail.com" then 'aquajach'
        end
      when ''
        case email
        when "JRadosz\100gmail.com" then 'Jarek Radosz'
        end
      end
    end

    def multialias(name)
      case name
      when 'Carlhuda'
        ['Yehuda Katz', 'Carl Lerche']
      when 'tomhuda'
        ['Yehuda Katz', 'Tom Dale']
      end
    end

    # canonical name => handlers, emails, typos, etc.
    SEEN_ALSO_AS = {}
    def self.map(canonical_name, *also_as)
      SEEN_ALSO_AS[canonical_name.nfc] = also_as.map(&:nfc)
    end

    # Some people appear in Rails logs under different names, there are nicks,
    # typos, email addresses, shortenings, etc. This is a hand-made list to map
    # them in order to be able to aggregate commits from the same real author.
    #
    # This mapping does not use regexps on purpose, it is more robust to put the
    # exact string equivalences. The manager has to be very strict about this.

    map 'Aaron Eisenberger',          'Aaron'
    map 'Aaron Gray',                 'aarongray'
    map 'Aaron Namba',                'anamba'
    map 'Aaron Pfeifer',              'obrie'
    map 'Aaron Todd',                 'ozzyaaron'
    map 'Abhay Kumar',                'abhay'
    map 'Abhishek Yadav',             'abhishek'
    map 'Adam Hawkins',               'twinturbo', 'adman65'
    map 'Adam Johnson',               'adamj'
    map 'Adam Kramer',                "adam\100the-kramers.net"
    map 'Adam Magan',                 'Adam89', 'mrageh'
    map 'Adam Majer',                 "adamm\100galacticasoftware.com"
    map 'Adam Wiggins',               'adamwiggins'
    map 'Adam Williams',              'aiwilliams', 'awilliams'
    map 'Adelle Hartley',             "adelle\100bullet.net.au"
    map 'Aditya Chadha',              'Aditya'
    map 'Aditya Kapoor',              'aditya-kapoor'
    map 'Adrien Coquio',              'bobbus'
    map 'Adrien Siami',               'Intrepidd'
    map 'Agis Anastasopoulos',        'Agis-'
    map 'Akio Tajima',                'arton', 'artonx'
    map 'Akira Ikeda',                "ikeda\100dream.big.or.jp"
    map 'Akira Matsuda',              '松田 明'
    map 'Akira Tagoh',                'tagoh'
    map 'Akshay Gupta',               'kitallis'
    map 'Akshay Vishnoi',             'Mr A'
    map 'Alan Francis',               'alancfrancis', 'acf',"alancfrancis\100gmail.com"
    map 'Albert Lash',                'docunext'
    map 'Alberto Almagro',            'Alberto Almagro Sotelo'
    map 'Alex Chaffee',               'alexch'
    map 'Alex Mishyn',                'amishyn'
    map 'Alex Pooley',                "alex\100msgpad.com"
    map 'Alex Riabov',                'ariabov'
    map 'Alex Wayne',                 "rubyonrails\100beautifulpixel.com", 'Squeegy'
    map 'Alex Wolfe',                 "alexkwolfe\100gmail.com"
    map 'Alexander Baronec',          'abonec'
    map 'Alexander Belaev',           'alexbel'
    map 'Alexander Borovsky',         "alex.borovsky\100gmail.com"
    map 'Alexander Dymo',             'adymo', "dymo\100mk.ukrtelecom.ua"
    map 'Alexander Karmes',           '90yukke'
    map 'Alexander Staubo',           "alex\100purefiction.net", "alex\100byzantine.no"
    map 'Alexander Uvarov',           'wildchild'
    map 'Alexey Nikitin',             'tank-bohr'
    map 'Alexey Trofimenko',          'codesnik'
    map 'Alexey Zatsepin',            'alexey', 'Alexey'
    map 'Ali Ibrahim',                'alimi'
    map 'Aliaksey Kandratsenka',      'Aleksey Kondratenko'
    map 'Aliaxandr Rahalevich',       'saksmlz', 'saks'
    map 'Alessandra Pereyra',         'Xenda'
    map 'Amit Kumar Suroliya',        'amitkumarsuroliya'
    map 'Anand Muthukrishnan',        'Anand'
    map 'Anatoli Makarevich',         'Anatoly Makarevich'
    map 'Andrea Longhi',              'andrea longhi', 'spaghetticode'
    map 'Andreas Isaksson',           'isak'
    map 'Andreas Wurm',               'Kanetontli', 'Kane', 'kane'
    map 'Andrew A. Smith',            "andy\100tinnedfruit.org"
    map 'Andrew Bennett',             'PotatoSalad'
    map 'Andrew Chase',               'acechase', 'Andrew'
    map 'Andrew Evans',               'agius'
    map 'Andrew Grim',                'stopdropandrew'
    map 'Andrew Kaspick',             "akaspick\100gmail.com", 'akaspick', "andrew\100redlinesoftware.com"
    map 'Andrew Peters',              "andrew.john.peters\100gmail.com"
    map 'Andrew Shcheglov',           'windock'
    map 'Andrew White',               'pixeltrix'
    map 'Andrey Molchanov',           'Neodelf', 'Molchanov Andrey'
    map 'Andrey Morskov',             'accessd', 'Accessd'
    map 'Andrey Nering',              "andrey.nering\100gmail.com"
    map 'Andy Lien',                  "andylien\100gmail.com"
    map 'Angelo Capilleri',           'angelo giovanni capilleri', 'Angelo capilleri', 'acapilleri'
    map 'Anil Kumar Maurya',          'anilmaurya'
    map 'Ankit Bansal',               'ankit1910'
    map 'Ankit Gupta',                'ankit8898', 'Ankit Gupta-FIR', 'Ankit gupta'
    map 'Anna Ershova',               'AnnaErshova'
    map 'Ant Ramm',                   'antramm'
    map 'Anthony Alberto',            'Anthony'
    map 'Anthony Eden',               'aeden'
    map 'Anthony Navarre',            'anthonynavarre'
    map 'Anton Cherepanov',           'davetoxa'
    map 'Antonio Tapiador del Dujo',  'Antonio Tapiador'
    map 'Anuj Dutta',                 'anuj  dutta'
    map 'Anup Narkhede',              'railsbob'
    map 'Ara T Howard',               'ara.t.howard'
    map 'Ariejan de Vroom',           'ariejan'
    map 'Arkadiusz Holko',            'fastred'
    map 'Arkadiy Zabazhanov',         'pyromaniac'
    map 'Artem Avetisyan',            'artemave'
    map 'Artem Kramarenko',           'artemk'
    map 'Arthur Neves',               'Arthur Nogueira Neves'
    map 'Arthur Zapparoli',           'arthurgeek'
    map 'Arvid Andersson',            'arvida'
    map 'Arvind Mehra',               'arvind'
    map 'Ashley Moran',               "work\100ashleymoran.me.uk"
    map 'Ask Bjørn Hansen',           "ask\100develooper.com"
    map 'Assaf Arkin',                "assaf.arkin\100gmail.com", 'Assaf'
    map 'AthonLab',                   'athonlab'
    map 'Atsushi Nakamura',           'alfa-jpn'
    map 'August Zaitzow Flatby',      "zaitzow\100gmail.com"
    map 'August Zajonc',              "augustz\100augustz.com"
    map 'Avner Cohen',                'AvnerCohen'
    map 'Ayose Cazorla',              'Ayose'
    map 'Bagwan Pankaj',              'bagwanpankaj'
    map 'Bas van Klinkenberg',        "flash\100vanklinkenbergsoftware.nl", 'Bas Van Klinkenberg'
    map 'Bart de Water',              'Bart'
    map 'Ben A. Morgan',              'Ben A Morgan'
    map 'Ben Bangert',                "ben\100groovie.org"
    map 'Ben Holley',                 'benolee'
    map 'Ben Murphy',                 'benmmurphy'
    map 'Ben Sandofsky',              'sandofsky'
    map 'Ben Scofield',               'bscofield'
    map 'Ben Sinclair',               "ben\100bensinclair.com"
    map 'Benedikt Deicke',            'benedikt'
    map 'Benjamin Curtis',            "rails\100bencurtis.com"
    map 'Benny Klotz',                'Benjamin Klotz'
    map 'Bermi Ferrer',               'bermi'
    map 'Bert Goethals',              'BertG'
    map 'Blaine Cook',                'Blaine', 'blaine', "blaine\100odeo.com"
    map 'Blair Zajac',                "blair\100orcaware.com"
    map 'Blake Watters',              "blake\100near-time.com"
    map 'Blane Dabney',               "mdabney\100cavoksolutions.com"
    map 'Bob Aman',                   "bob\100sporkmonger.com"
    map 'Bob Silva',                  'BobSilva', "ruby\100bobsilva.com"
    map 'bogdanvlviv',                'Bogdan'
    map 'Brad Ediger',                "brad.ediger\100madriska.com", "brad\100madriska.com", 'bradediger'
    map 'Brad Ellis',                 "bellis\100deepthought.org"
    map 'Brad Greenlee',              'bgreenlee'
    map 'Bogdan Gusiev',              'bogdan'
    map 'Brad Robertson',             'bradrobertson'
    map 'Brandon Keepers',            'brandon', "brandon\100opensoul.org"
    map 'Brandt Kurowski',            "brandt\100kurowski.net"
    map 'Brendan Baldwin',            'brendan'
    map 'Brent Miller',               'Foliosus'
    map 'Brian Donovan',              'eventualbuddha', "devslashnull\100gmail.com"
    map 'Brian Egge',                 "brianegge\100yahoo.com"
    map 'Brian Gernhardt',            "benji\100silverinsanity.com"
    map 'Brian Mattern',              "rephorm\100rephorm.com"
    map 'Brian Morearty',             'BMorearty'
    map 'Brian Pearce',               'brianp'
    map 'Bruce Williams',             "wbruce\100gmail.com"
    map 'Bruno Miranda',              'brupm'
    map 'Bryan Helmkamp',             'brynary'
    map 'Bryan Kang',                 'deepblue'
    map 'Buddhika Laknath',           'laknath', 'Laknath'
    map 'Caio Chassot',               'caio', "k\100v2studio.com"
    map 'Caleb Tennis',               "caleb\100aei-tech.com"
    map 'Calvin Yu',                  'cyu'
    map 'Carina C. Zona',             'cczona'
    map 'Carl Tashian',               'tashian'
    map 'Cássio Marques',             'CassioMarques'
    map 'Cédric Fabianski',           'Cédric FABIANSKI', 'cfabianski'
    map 'Celestino Gomes',            'tinogomes'
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
    map 'Chris Kampmeier',            'kampers', 'chrisk'
    map 'Chris Kohlbrenner',          'chriskohlbrenner'
    map 'Chris McGrath',              "c.r.mcgrath\100gmail.com", 'c.r.mcgrath', "chris\100octopod.info", 'octopod'
    map 'Chris Mear',                 "chris\100feedmechocolate.com", 'chrismear'
    map "Chris O'Sullivan",           'thechrisoshow'
    map 'Chris Roos',                 'chrisroos', "chris\100seagul.co.uk"
    map 'Chris Wanstrath',            "chris\100ozmm.org", 'defunkt'
    map 'Christof Spies',             'wingfire'
    map 'Christopher Redinger',       'redinger'
    map 'Chriztian Steinmeier',       "chriztian.steinmeier\100gmail.com"
    map 'Claudio Baccigalupo',        'claudiob', 'Claudio B.', 'claudiofullscreen', 'Claudio B'
    map 'Clayton Liggitt',            'arktisklada'
    map 'Clifford Heath',             'cjheath'
    map 'Clifford T. Matthews',       'ctm'
    map 'Coda Hale',                  'codahale'
    map 'Cody Fauser',                "codyfauser\100gmail.com"
    map 'Colman Nady',                "colman\100rominato.com"
    map 'Corey Haines',               'coreyhaines'
    map 'Corey Leveen',               'mntj'
    map 'Cory Gwin',                  "Cory Gwin \100gwincr11"
    map 'Courtenay Gasking',          'court3nay', 'courtenay', "court3nay\100gmail.com", 'Court3nay'
    map 'Craig Davey',                'eigentone', "eigentone\100gmail.com"
    map 'Cristi Balan',               'Cristi BALAN'
    map 'Daisuke Taniwaki',           'dtaniwaki'
    map 'Damian Janowski',            'djanowski'
    map 'Damien Mathieu',             'dmathieu'
    map 'Dan Cheail',                 'codeape'
    map 'Dan Croak',                  'dancroak'
    map 'Dan Kaplan',                 'dkaplan88'
    map 'Dan Kubb',                   'dkubb'
    map 'Dan Manges',                 'dcmanges'
    map 'Dan Peterson',               "dpiddy\100gmail.com"
    map 'Dan Sketcher',               "dansketcher\100gmail.com"
    map 'Dane Jensen',                'careo'
    map 'Daniel Cohen',               'danielc192'
    map 'Daniel Hobe',                "daniel\100nightrunner.com"
    map 'Daniel Morrison',            'danielmorrison'
    map 'Daniel Rodríguez Troitiño',  'drodriguez'
    map 'Daniel Sheppard',            "daniels\100pronto.com.au"
    map 'Daniel Wanja',               "daniel\100nouvelles-solutions.com"
    map 'Danni Friedland',            'BlueHotDog'
    map 'Dave Dribin',                "dave-ml\100dribin.org"
    map 'Dave Goodchild',             'buddhamagnet'
    map 'Dave Lee',                   "dave\100cherryville.org"
    map 'Dave Moore',                 'DAVID MOORE'
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
    map 'Dawid Janczak',              'DawidJanczak'
    map 'Dee Zsombor',                'Dee.Zsombor', 'zsombor', "Dee.Zsombor\100gmail.com"
    map 'Deirdre Saoirse',            "deirdre\100deirdre.net"
    map 'DeLynn Berry',               'Delynn', 'DeLynn', 'delynnb', 'DeLynn Barry', 'DeLynnB', 'DelynnB', 'DeLynn B', "delynn\100gmail.com"
    map 'Demetrius Nunes',            'demetrius', 'Demetrius'
    map 'Derek DeVries',              'devrieda'
    map 'Derrick Spell',              "derrickspell\100cdmplus.com"
    map 'Dev Mehta',                  'dpmehta02'
    map 'Dick Davies',                'rasputnik'
    map 'Diego Algorta'               'Diego Algorta Casamayou'
    map 'Diego Giorgini',             'ogeidix'
    map 'Dieter Komendera',           'kommen'
    map 'Dirkjan Bussink',            'dbussink'
    map 'Dmitrii Samoilov',           'german'
    map 'Dmitrij Mjakotnyi',          'kucaahbe'
    map 'Dmitriy Budnik',             "Дмитро Будник"
    map 'Dmitriy Timokhin',           'pager'
    map 'Dmitry Dedov',               'dm1try'
    map 'Dmitry Lipovoi',             'pleax'
    map 'Dmitry Vorotilin',           'Dmitriy Vorotilin'
    map 'Dmytro Vasin',               'Vasin Dmitriy'
    map 'Dominic Sisneros',           "dom\100sisna.com"
    map 'Don Park',                   "don.park\100gmail.com"
    map 'Donald Piret',               "donald.piret\100synergetek.be"
    map 'Dr Nic Williams',            'drnic', 'Dr Nic'
    map 'Duane Johnson',              "duane.johnson\100gmail.com", 'canadaduane'
    map 'Duff OMelia',                "dj\100omelia.org"
    map 'Duncan Beevers',             'duncanbeevers'
    map 'Duncan Robertson',           "duncan\100whomwah.com"
    map 'Dustin Curtis',              'dcurtis'
    map 'Dylan Thacker-Smith',        'Dylan Smith'
    map 'Eaden McKee',                'eadz', 'Eadz'
    map 'Eddie Cianci',               'defeated'
    map 'Eddie Stanley',              "eddiewould\100paradise.net.nz"
    map 'Edho Arief',                 'edogawaconan'
    map 'Eduardo Cavazos',            'dharmatech'
    map 'Edward Betts',               "edward\100debian.org"
    map 'Eelco Lempsink',             "rails\10033lc0.net"
    map 'Egor Homakov',               'homa', 'homakov', '@homakov'
    map 'Eileen M. Uchitelle',        'eileencodes', 'Eileen Uchitelle'
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
    map 'Eugene Gilburg',             'egilburg'
    map 'Eugene Pimenov',             'libc'
    map 'Evan DiBiase',               'edibiase'
    map 'Evan Henshaw-Plath',         "evan\100protest.net"
    map 'Evan Weaver',                'evan'
    map 'Evgeny Zislis',              "evgeny.zislis\100gmail.com"
    map 'Fabián Rodríguez',           'Fabian Rodriguez'
    map 'Fabien Mannessier',          "fabien\100odilat.com"
    map 'Farley Knight',              'farleyknight'
    map 'Farzad Farid',               'farzy'
    map 'Fedot Praslov',              'fedot'
    map 'Felix Dominguez',            'dacat'
    map 'Ferdinand Niedermann',       'nerdinand'
    map 'Ferdinand Svehla',           "f.svehla\100gmail.com", 'f.svehla'
    map 'Florian Munz',               'theflow'
    map 'Francesco Rodríguez',        'Francesco Rodriguez'
    map 'François Beausoleil',        'FranÃ§ois Beausolei', 'Francois Beausoleil', "fbeausoleil\100ftml.net", "francois.beausoleil\100gmail.com"
    map 'Frank Müller',               'suchasurge'
    map 'Franky Wahl',                'Franky W'
    map 'Frederick Cheung',           'fcheung', 'Fred Cheung', 'frederick.cheung', "frederick.cheung\100gmail.com"
    map 'Frederico Macedo',           'frederico'
    map 'G S Phani Kumar',            'gsphanikumar'
    map 'Gabe da Silveira',           'dasil003'
    map 'Gabriel Gironda',            "gabriel.gironda\100gmail.com", "gabriel\100gironda.org"
    map 'Ganesh Kumar',               'ganesh'
    map 'Gaspard Bucher',             "g.bucher\100teti.ch"
    map 'Gaurav Sharma',              'Gaurav Sharam'
    map 'Gavin Morrice',              'Bodacious'
    map 'Genki Takiuchi',             "takiuchi\100drecom.co.jp"
    map 'Geoff Buesing',              'gbuesing', 'Geoffrey Buesing'
    map 'Geoff Coffey',               'gwcoffey'
    map 'Geoff Garside',              'ggarside'
    map 'Geoff Jacobsen',             'jacott'
    map 'Geoffrey Grosenbach',        'topfunky'
    map 'Geoffrey Roguelon',          'Geoffrey ROGUELON'
    map 'Geoffroy Lorieux',           'glorieux'
    map 'Georg Friedrich',            'gfriedrich'
    map 'Giovanni Intini',            "medlar\100medlar.it", 'intinig'
    map 'Girish Sonawane',            'Girish S'
    map 'Glen Gibb',                  'grg'
    map 'Glenn Vanderburg',           'glv'
    map 'Go Sueyoshi',                'sue445'
    map 'Gonzalo Rodríguez-Baltanás Díaz', 'Nerian'
    map 'Graeme Mathieson',           'mathie'
    map 'Grant Hollingworth',         "grant\100antiflux.org"
    map 'Greg Lappen',                "greg\100lapcominc.com"
    map 'Greg Miller',                'vertigoclinic'
    map 'Greg Spiers',                'gspiers'
    map 'Grzegorz Daniluk',           "daniluk\100yahoo.com"
    map 'Guillaume Carbonneau',       'guillaume'
    map 'Guo Xiang Tan',              'Guo Xiang', 'Alan Tan'
    map 'Gustavo Leon',               'HPNeo'
    map 'Guy Naor',                   "guy.naor\100famundo.com"
    map 'Hakan Ensari',               'hakanensari'
    map 'Hal Brodigan',               'postmodern'
    map 'Hampton Catlin',             "hcatlin\100gmail.com"
    map 'Hendrik Mans',               "hendrik\100mans.de"
    map 'Hendy Irawan',               'ceefour'
    map 'Henrik Nyh',                 'Henrik N', "henrik\100nyh.se", 'henrik'
    map 'Herryanto Siatono',          'jugend'
    map 'Hirofumi Wakasugi',          'WAKASUGI 5T111111'
    map 'Hiroshi Saito',              'hiroshi'
    map 'Hongli Lai (Phusion)',       'FooBarWidget', 'Hongli Lai', 'Hongli Lai (Phusion'
    map 'Huiming Teo',                'Teo Hui Ming'
    map 'Ian White',                  "ian.w.white\100gmail.com"
    map 'Ibrahim Abdullah',           'simply-phi'
    map 'Ignazio Mostallino',         'gnagno'
    map 'Igor Fedoronchuk',           'Igor', 'Fivell'
    map 'Igor Guzak',                 'igor04'
    map 'Indrek Juhkam',              'innu'
    map 'Iñigo Solano Pàez',          '1334'
    map 'Innokenty Mikhailov',        'gregolsen'
    map 'Ionatan Wiznia',             'iwiznia'
    map 'Irfan Adilovic',             'Irfy'
    map 'Irina Bednova',              'jafrog'
    map 'Isaac Feliu',                'isaacfeliu'
    map 'Isaac Reuben',               "isaac\100reuben.com"
    map 'Ivan Korunkov',              'Ivan'
    map 'Iván Vega',                  'ivanvr'
    map 'J Kittiyachavalit',          'jkit'
    map 'Jack Christensen',           "jackc\100hylesanderson.com"
    map 'Jack Danger Canty',          'danger', 'Danger'
    map 'Jacob Atzen',                'jacobat'
    map 'Jacob Fugal',                'lukfugl'
    map 'Jacob Straszynski',          'jacobstr'
    map 'Jaehyun Shin',               'keepcosmos'
    map 'Jake Janovetz',              'janovetz'
    map 'Jake Waller',                'wallerjake'
    map 'Jakob Skjerning',            'Jakob S', "jakob\100mentalized.net"
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
    map 'Jared Haworth',              'jardeon'
    map 'Jarkko Laine',               "jarkko\100jlaine.net", 'Jarkko', 'jarkko'
    map 'Jason Frey',                 'Jason Frey (Fryguy)'
    map 'Jason Garber',               'jgarber'
    map 'Jason Kaye',                 'JayK31'
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
    map 'Jeff Dickey',                'dickeyxxx'
    map 'Jeff Dutil',                 'jdutil'
    map 'Jeff Lindsay',               "progrium\100gmail.com"
    map 'Jeffrey Hardy',              'packagethief'
    map 'Jeffrey Moss',               "jeff\100opendbms.com"
    map 'Jens-Christian Fischer',     "jcfischer\100gmail.com"
    map 'Jeong Changhoon',            'seapy'
    map 'Jeremy Daer',                'Jeremy Daer (Kemper)', 'Jeremy Kemper', 'bitsweat'
    map 'Jeremy Durham',              "jeremydurham\100gmail.com"
    map 'Jeremy Evans',               "jeremyevans0\100gmail.com", 'jeremyevans', "jeremye\100bsa.ca.gov", "code\100jeremyevans.net"
    map 'Jeremy Hopple',              "jeremy\100jthopple.com"
    map 'Jeremy Jackson',             'jejacks0n'
    map 'Jeremy Lightsmith',          'stellsmi'
    map 'Jeremy McAnally',            'jeremymcnally', 'jeremymcanally'
    map 'Jeremy Voorhis',             "jeremy\100planetargon.com", 'jvoorhis'
    map 'Jeroen van Ingen',           'jeroeningen'
    map 'Jérôme Lipowicz',            'jerome'
    map 'Jerrett Taylor',             "jerrett\100bravenet.com"
    map 'Jesse Merriman',             "jessemerriman\100warpmail.net"
    map '簡煒航 (Jian Weihang)',      'Jian Weihang'
    map 'Jim Helm',                   "perlguy\100gmail.com"
    map 'Jim Hughes',                 'jeem'
    map 'Jim Meyer',                  'purp'
    map 'Jim Winstead',               "jimw\100mysql.com"
    map 'Joe Ellis',                  'joeellis'
    map 'Joe Ferris',                 'jferris'
    map 'Joe Goldwasser',             "joe\100mjg2.com"
    map 'Joe Lewis',                  'swapdisc'
    map 'Joel Smith',                 'jbsmith86'
    map 'Joel Watson',                'watsonian'
    map 'Joerg Diekmann',             "joergd\100pobox.com"
    map 'Johan Sørensen',             'Johan Sorensen', 'Johan Sörensen', "johan\100johansorensen.com", "johan\100textdrive.com"
    map 'Johannes Barre',             'iGEL'
    map 'John Barnette',              'jbarnette'
    map 'John Barton',                'johnb'
    map 'John Dewey',                 'retr0h'
    map 'John F. Douthat',            'johndouthat'
    map 'John J. Wang',               'wangjohn', 'John J Wang'
    map 'John Mettraux',              'jmettraux'
    map 'John Nunemaker',             "nunemaker\100gmail.com"
    map 'John Oxton',                 "rails\100electricvisions.com"
    map 'John Pignata',               'Developer', 'Jay Pignata' # see 179b451
    map 'John Sheets',                "dev\100metacasa.net", "jsheets"
    map 'John Warwick',               'jwarwick'
    map 'John Wells',                 'jbwiv'
    map 'John Wilger',                'jwilger'
    map 'Johnson Wang',               'spyhole'
    map 'Jon Bright',                 "jon\100siliconcircus.com"
    map 'Jon Evans',                  "jon.evans\100pobox.com", 'evansj'
    map 'Jon Moses',                  "jon\100burningbush.us"
    map 'Jon Moss',                   'maclover7'
    map 'Jon Olson',                  "jsolson\100damogran.org"
    map 'Jon Seidel',                 'JESii'
    map 'Jon Wood',                   "jon\100instance-design.co.uk", "jon\100blankpad.net"
    map 'Jonathan Bartlett',          'johnnyb'
    map 'Jonathan del Strother',      'Catfish', 'catfish'
    map 'Jonathan Garvin',            "jsgarvin"
    map 'Jonathan Goldman',           'jonnii', "me\100jonnii.com"
    map 'Jonathan Leighton',          "turnip\100turnipspatch.com"
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
    map 'Josh Owens',                 'queso'
    map 'Josh Peek',                  'josh', 'Josh', 'Joshua Peek', 'joshpeek', "josh\100joshpeek.com"
    map 'Josh Starcher',              "josh.starcher\100gmail.com"
    map 'Josh Susser',                'hasmanyjosh', "josh\100hasmanythrough.com"
    map 'Joshua Sierles',             'jsierles'
    map 'Joshua Wehner',              'jaw6'
    map 'Juan David Pastas',          'juanpastas', 'juan david pastas'
    map 'Juan De Bravo',              'juandebravo'
    map 'Juanito Fatas',              'JuanitoFatas'
    map 'Juanjo Bazán',               'Juanjo Bazan', 'juanjo.bazan'
    map 'Julia López',                'Julia Lopez'
    map 'Julian Doherty',             'madlep'
    map 'Julian Tarkhanov',           "me\100julik.nl", 'julik'
    map 'Julien Portalier',           'ysbaddaden'
    map 'Jun Jiang',                  'jasl'
    map 'Justin Ball',                'jbasdf'
    map 'Justin French',              'justinfrench'
    map 'Justin Mecham',              "justin\100aspect.net"
    map 'Kamal Fariz Mahyuddin',      'kamal'
    map 'Kamil Kukura',               'kamk'
    map 'Karan Arora',                'karanarora'
    map 'Karel Miarka',               "kajism\100yahoo.com"
    map 'Karel Minařík',              'karmi', 'Karel Minarik'
    map 'Karim El-Husseiny',          'Azzurrio'
    map 'Karol Bucek',                'kares'
    map 'Kaspar Schiess',             "eule\100space.ch"
    map 'Kasper Timm Hansen',         'Timm'
    map 'Kazuhiko Shiozaki',          "kazuhiko\100fdiary.net", 'Kazuhiko'
    map 'Kazuhiro Yoshida',           "moriq\100moriq.com", 'moriq'
    map 'Keegan Quinn',               "keegan\100thebasement.org"
    map 'Kei Shiratsuchi',            'kei'
    map 'Keith Gautreaux',            'kaygee', 'kgautreaux'
    map 'Keith Morrison',             "keithm\100infused.org"
    map 'Ken Barker',                 "ken.barker\100gmail.com"
    map 'Ken Gerrard',                'backspace'
    map 'Ken Kunz',                   "kennethkunz\100gmail.com"
    map 'Ken Miller',                 "kenneth.miller\100bitfield.net"
    map 'Kenta Okamoto',              "chocoby"
    map 'Kenta Tanoue',               'regonn'
    map 'kenta-s',                    "白井 健太"
    map 'Keith Payne',                "kp"
    map 'Kevin Barnes',               "vinbarnes\100gmail.com"
    map 'Kevin Chavanne',             'kevcha'
    map 'Kevin Clark',                "Kevin Clark kevin.clark\100gmail.com", "kevin.clark\100gmail.com", "kevin.clark\100gmal.com"
    map 'Kevin Jackson',              "foamdino\100gmail.com"
    map 'Kevin Smith',                'codebrulee'
    map 'Kevin Watt',                 "kevin\100writesoon.com"
    map 'Kevin Williams',             "kevwil\100gmail.com"
    map 'Kim Shrier',                 "kim\100tinker.com"
    map 'Kir Shatrov',                'kirs', 'Kir'
    map 'Kirill Gorin',               'kgorin'
    map 'Kishore Mohan',              'kishore-mohan'
    map 'Kjetil Lerøen',              "leroen\100gmail.com"
    map 'Koichi Tsutsumi',            "hakuja\100hakuja.net"
    map 'Kornelius Kalnbach',         "murphy\100cYcnus.de", "murpyh\100rubychan.de", 'murphy'
    map 'Kouhei Sutou',               'kou'
    map 'Krishna Kotecha',            'krishna'
    map 'Kristopher Chambers',        "kristopher.chambers\100gmail.com", 'kris_chambers'
    map 'Krzysztof Knapik',           'knapo'
    map 'Kubo Takehiro',              'kubo'
    map 'Kuldeep Aggarwal',           'KD', 'kuldeepaggarwal'
    map 'Kym McInerney',              'holodigm', 'Kym'
    map 'Kyosuke Morohashi',          'moro'
    map 'Lachlan Sylvester',          'lsylvester'
    map 'Lakshan Perera',             'laktek', 'lakshan'
    map 'Larry Lv',                   'larrylv'
    map 'Larry Williams',             "larrywilliams1\100gmail.com"
    map 'Lars Francke',               "l.francke\100gmx.de"
    map 'Lars Kanis',                 "kanis\100comcard.de"
    map 'Lars Pind',                  "lars\100pinds.com", "lars\100pind.com", 'Lars pind', 'lars pind'
    map 'Laurel Fan',                 "laurel\100gorgorg.org", 'laurelfan'
    map 'Lauro Caetano',              'laurocaetano'
    map 'Lawrence Pit',               'lawrence'
    map 'Lebin Sebastian F',          'libin'
    map 'Lee Jensen',                 'outerim'
    map 'Lee Marlow',                 'lmarlow', "lmarlow\100yahoo.com"
    map "Lee O'Mara",                 "lee\100omara.ca"
    map 'Leif Eriksen',               'leriksen'
    map 'Lennon Day-Reynolds',        'rcoder'
    map 'Leo Lou',                    'l4u'
    map 'Leon Breedt',                'Leon Bredt'
    map 'Leslie A. Hensley',          "hensleyl\100papermountain.org"
    map 'Leung Ho Kuen',              'PikachuEXE'
    map 'Lewis Jubb',                 "minimudboy\100gmail.com"
    map 'Lihan Li',                   'lihanli', 'lihan'
    map 'Lim Chee Hau',               'ch33hau'
    map 'Logy Laps',                  'logylaps'
    map 'Lon Baker',                  "lon\100speedymac.com"
    map 'Loren Johnson',              'lorenjohnson'
    map 'Lori Holden',                'lholden'
    map 'Louis St-Amour',             "LouisStAmour\100gmail.com"
    map 'Lourens Naudé',              'Lourens Naude'
    map 'Luca Guidi',                 'l.guidi'
    map 'Lucas Catón',                'Lucas Caton'
    map 'Lugovoi Nikolai',            "meadow.nnick\100gmail.com"
    map 'Luís Ferreira',              'Zamith'
    map 'Luismi Cavallé',             'cavalle', 'cavelle'
    map 'Lukas Rieder',               'Overbryd'
    map 'Łukasz Sarnacki',            'Lukasz Sarnacki'
    map 'Łukasz Strzałkowski',        'Lukasz Strzalkowski'
    map 'Luke Ludwig',                'lukeludwig'
    map 'Luke Redpath',               "contact\100lukeredpath.co.uk"
    map 'maiha',                      'anna', "anna\100wota.jp", "maiha\100wota.jp"
    map 'Maik Schmidt',               "contact\100maik-schmidt.de", 'maik schmidt'
    map 'Manfred Stienstra',          "m.stienstra\100fngtps.com", 'manfred'
    map 'Manish Shrivastava',         'Manish shrivastava', 'manish-shrivastava'
    map 'Manu J',                     "Manu"
    map 'Manuel Holtgrewe',           "purestorm\100ggnore.net"
    map 'Marc Huffnagle',             'mhuffnagle'
    map 'Marc Love',                  'marclove'
    map 'Marc Rendl Ignacio',         'Marc Ignacio'
    map 'Marc-André Cournoyer',       'macournoyer'
    map 'Marc-André Lafortune',       'Marc-Andre Lafortune'
    map 'Marcel Molina Jr.',          'Marcel Molina', 'Marcel', 'Marcel Molina Jr', 'marcel', 'noradio', 'Marcel Mollina Jr.'
    map 'Marcello Nuccio',            'marcenuc'
    map 'Marcin Szczepański',         "marcin\100junkheap.net"
    map 'Marcos Tapajós',             'Marcos Tapajos'
    map 'Mario Zigliotto',            'mariozig'
    map 'Mariusz Pękala',             'Arsen7'
    map 'Marjan Hratson',             'gmarik'
    map 'Mark A. Richman',            'mrichman'
    map 'Mark Daggett',               'heavysixer'
    map 'Mark H. Wilkinson',          'mhw'
    map 'Mark Imbriaco',              "mark.imbriaco\100pobox.com"
    map 'Mark J. Titorenko',          'mtitorenko'
    map 'Mark James',                 "mrj\100bigpond.net.au"
    map 'Mark Lane',                  'DrMark'
    map 'Mark R. James',              'mrj'
    map 'Mark Rushakoff',             'Mark Rushakof'
    map 'Mark Somerville',            'Spakman'
    map 'Mark Van Holstyn',           'lotswholetime'
    map 'Mark W. Foster',             'mfoster'
    map 'Markov Alexey',              'Alexey Markov'
    map 'Markus Roberts',             "MarkusQ\100reality.com"
    map 'Marshall Roch',              'mroch'
    map 'Marten Veldthuis',           'Marten'
    map 'Martin Emde',                "zraii\100comcast.net", "martin.emde\100gmail.com"
    map 'Martin Gamsjaeger',          'snusnu'
    map 'Martin Linkhorst',           'Martin'
    map 'Martin Schuerrer',           'Martin Schürrer'
    map 'Masaki Yamada',              'Yamada Masaki', 'masarakki'
    map 'Masashi Shimbo',             "shimbo\100is.naist.jp"
    map 'Mason Hale',                 'flowdelic'
    map 'Mathieu Arnold',             "mat\100absolight.fr"
    map 'Mathieu Jobin',              "somekool\100gmail.com"
    map 'Mathieu Ravaux',             'mathieuravaux'
    map 'Mats Persson',               "mats\100imediatec.co.uk"
    map 'Matt Aimonetti',             'matt'
    map 'Matt Bauer',                 'mattbauer'
    map 'Matt Boehlig',               'Matt B.'
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
    map 'Matthew Stopa',              'Matt Stopa'
    map 'Matthew Vincent',            'neshmi'
    map 'Matthew Walker',             "matthew\100walker.wattle.id.au"
    map 'Matthias Neumayr',           'neumayr'
    map 'Mattt Thompson',             '@mattt'
    map 'Max Melentiev',              'printercu'
    map 'Max Mitchell',               'mazuhl'
    map 'Maxime Réty',                'Maxime RETY', 'maximerety'
    map 'Mehmet Emin İNAÇ',           'Mehmet Emin INAC'
    map 'Melih Arda Yalçiner',        'Wizard'
    map 'Mica Eked',                  'mica eked'
    map 'Micah Alles',                "alles\100atomicobject.com"
    map 'Michael Cetrulo',            'Samus_'
    map 'Michael Coyne',              'mikeycgto'
    map 'Michael Daines',             "me\100mdaines.com"
    map 'Michael Dewey',              "mike\100michaeldewey.org"
    map 'Michael Galero',             'mikong'
    map 'Michael Grosser',            'grosser'
    map 'Michael Hoffman',            'hoffm'
    map 'Michael Hutchinson',         'mhutchin'
    map 'Michael Kintzer',            'rockrep'
    map 'Michael Klishin',            'antares', 'Michael S. Klishin'
    map 'Michael Koziarski',          'Koz', 'nzkoz'
    map 'Michael Minter',             'michaelminter'
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
    map 'Mike Breen',                 'hardbap'
    map 'Mike Clark',                 "mike\100clarkware.com"
    map 'Mike Gunderloy',             'Michael Gunderloy'
    map 'Mike Laster',                "mlaster\100metavillage.com"
    map 'Mike Mangino',               "mmangino\100elevatedrails.com"
    map 'Mike Naberezny',             'mnaberez'
    map 'Mike Subelsky',              'subelsky'
    map 'Mike Taylor',                'sealocal'
    map 'Mikel Lindsaar',             'mikel', 'raasdnil'
    map 'Miklós Fazekas',             'mfazekas', 'Miklos Fazkeas', 'Miklos Fazekas'
    map 'Misaki Shioi',               'shioimm'
    map 'Mislav Marohnić',            'mislav', 'mislaw', "mislav\100nippur.irb.hr", 'Mislav Marohnic'
    map 'Mitsutaka Mimura',           'takkanm'
    map 'Mo Khan',                    'mo khan'
    map 'Mohamed Osama',              'oss92'
    map 'Moses Hohman',               'moses'
    map 'Muhammad Muhammad Ibrahim',  'Muhammad'
    map 'Murahashi Sanemat Kenichi',  'sanemat'
    map 'Murray Steele',              'h-lame'
    map 'Nacho Caballero',            'nachocab'
    map 'Nathan Kontny',              'nate'
    map 'Nathan Weizenbaum',          'Nex3'
    map 'Nathaniel Talbott',          'ntalbott'
    map 'Neil Wilson',                'NeilW'
    map 'Nicholas Greenfield',        'Greenie0506'
    map 'Nicholas Lee',               "emptysands\100gmail.com"
    map 'Nicholas Seckar',            'Ulysses'
    map 'Nick Cox',                   'thenickcox'
    map 'Nick Kallen',                'nkallen'
    map 'Nick Murphy',                "nick+rails\100ag.arizona.edu"
    map 'Nick Plante',                'zapnap'
    map 'Nick Sieger',                'nicksieger', "nicksieger\100gmail.com", 'Nick'
    map 'Nicolas Blanco',             'slainer68'
    map 'Nicolas Cavigneaux',         'Bounga'
    map 'Nicolás Hock Isaza',         'Nicolas Hock Isaza'
    map 'Nicolas Pouillard',          "nicolas.pouillard\100gmail.com"
    map 'Nicolás Sanguinetti',        'foca', 'Nicolas Sanguinetti'
    map 'Nik Wakelin',                'nik.wakelin', 'nik.kakelin'
    map 'Nikita Loskutov',            'cnaize'
    map 'Nikolay Petrachkov',         'jastix'
    map 'Nils-Helge Garli Hegvik',    'nilsga'
    map 'Nils Jonsson',               "nils\100alumni.rice.edu"
    map 'Nishant Tuteja',             'nishant-cyro'
    map 'Noam Gagliardi Rabinovich',  'noam'
    map 'Nobuhiro Imai',              "nov\100yo.rim.or.jp", 'Nobuhiro IMAI'
    map 'Nobukazu Matake',            'nov'
    map 'Norbauer Inc',               'norbauer'
    map 'Norbert Crombach',           'norbert'
    map 'Norman Elton',               "normelton\100gmail.com"
    map 'Obie Fernandez',             'ObieFernandez'
    map 'okkez',                      "okkez000\100gmail.com"
    map 'OKURA Masafumi',             "okuramasafumi"
    map 'Oleg Andreev',               'oleganza'
    map 'Oleg Frolov',                "oleg.frolov\100gmail.com"
    map 'Oleg Pudeyev',               "pudeyo\100rpi.com"
    map 'Oliver Legg',                'Olly Legg'
    map 'Olivier Ansaldi',            "olivier_ansaldi\100yahoo.com"
    map 'Olli Rissanen',              'Noemj'
    map 'Olly Headey',                'lylo'
    map 'Orta Therox',                'orta'
    map 'Otto Hilska',                'mutru'
    map 'Pablo Astigarraga',          'pote', 'PoTe'
    map 'Pablo Ifrán',                'Pablo Ifran'
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
    map 'Paul Hieromnimon',           'pavlos'
    map 'Paul Hinze',                 'phinze'
    map 'Paul Smith',                 "paul\100cnt.org"
    map 'Pawel Janiak',               'pawel2105'
    map 'Paweł Mikołajewski',         'dfens'
    map 'Pelle Braendgaard',          'pelle', 'Pelle'
    map 'Petrik de Heus',             'Petrik'
    map 'Per Wigren',                 "tuxie\100dekadance.se", 'Tuxie'
    map 'Perry Flinn',                'pbflinn'
    map 'Perry Smith',                'pedz'
    map 'Pete Brown',                 'beerlington'
    map 'Pete Yandell',               'notahat'
    map 'Peter Haight',               'Dawnthorn'
    map 'Peter Michaux',              "petermichaux\100gmail.com"
    map 'Peter Schröder',             "phoet"
    map 'Peter Williams',             'pezra'
    map 'Petra Jaros',                'Peter Jaros'
    map 'Phil Bogle',                 "philbogle\100gmail.com"
    map 'Phil Hagelberg',             "technomancy\100gmail.com", 'technomancy'
    map 'Phil Lee',                   'asmega'
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
    map 'Prakash Laxkar',             'prakash'
    map 'Prakash Murthy',             'prakashmurthy'
    map 'Pramod Sharma',              'Akshat Sharma'
    map 'Pratik Naik',                'Pratik', 'pratik', 'lifofifo', 'lifo'
    map 'Prathamesh Sonpatki',        'प्रथमेश Sonpatki', 'प्रथमेश'
    map 'Pravin Mishra',              'diatmpravin'
    map 'Rafael Mendonça França',     'Rafael França'
    map 'Rahul P. Chaudhari',         'RAHUL CHAUDHARI', 'Rahul Chaudhari'
    map 'Rainer Blessing',            'RainerBlessing'
    map 'Rajarshi Das',               'rajarshi', 'rajars2576', 'rajcybage','Rajarshi', 'RAJARSHI', 'RAJARSHI DAS'
    map 'Ramon Quezada',              'rayq', 'rpq'
    map 'Raphael Bauduin',            "raphinou\100yahoo.com"
    map 'Raphael Lee',                'Raphomet'
    map 'Ravil Bayramgalin',          'brainopia'
    map 'Ravindra Kumar Kumawat',     'ravindra kumar kumawat'
    map 'Rein Henrichs',              "ReinH"
    map "Remco van 't Veer",          'remvee'
    map 'Rémy Coutable',              'rymai', 'remy', "rymai\100rymai.com", "remy.coutable\100gmail.com"
    map 'Rich Collins',               'richcollins', "richcollins\100gmail.com"
    map 'Richard Macklin',            'rmacklin'
    map 'Richard Schneeman',          'Schneems', 'schneems', '@schneems'
    map 'Rick Bradley',               "rick\100rickbradley.com"
    map 'Rick DeNatale',              'RubyRedRick'
    map 'Rick Olson',                 'rick', 'Rick', 'Rick Olsen', "technoweenie\100gmail.com", 'Rich Olson'
    map 'Riley Lynch',                'Riley', 'teleological'
    map 'Rizwan Reza',                'rizwanreza'
    map 'Rob Anderton',               'Rob'
    map 'Rob Biedenharn',             'rabiedenharn', "Rob\100AgileConsultingLLC.com"
    map 'Rob Halff',                  "info\100rhalff.com"
    map 'Rob Rasmussen',              "rob.rasmussen\100gmail.com"
    map 'Rob Sanheim',                'rsanheim', "rsanheim\100gmail.com", "rob\100thinkrelevance.com"
    map 'Robby Russell',              'robbyrussell', "robby\100planetargon.com"
    map 'Robert Evans',               'revans'
    map 'Robert Krzyzanowski',        'RobertZK'
    map 'Robert Pankowecki',          'Robert Pankowecki (Gavdi)'
    map 'Robert Speicher',            'rspeicher'
    map 'Roberto Miranda',            'robertomiranda'
    map 'Robin Fisher',               'robinjfisher'
    map 'Ryunosuke Sato',             'Ryunosuke SATO'
    map 'Robin H. Johnson',           "robbat2\100gentoo.org"
    map 'Roderick van Domburg',       'roderickvd'
    map 'Rodney Ramdas',              "rramdas\100gmail.com"
    map 'Rodrigo Navarro',            'reu'
    map 'Rohit Arondekar',            'rohit'
    map 'Roman Dittert',              'RomD'
    map 'Roman Le Négrate',           'Roman Le Negrate'
    map 'Roman Le Négrate',           'Roman2K', 'Roman Le Negrate'
    map 'Ron DiFrango',               "rdifrango\100captechventures.com"
    map 'Ross Kaffenberger',          'Ross Kaffenburger'
    map 'Ruben Nine',                 "ruben.nine\100gmail.com"
    map 'Ruslan Korolev',             'rusikf'
    map 'Russell Norris',             'RSL', 'rsl'
    map 'Russell Norris',             'rsl', 'RSL'
    map 'Ruy Asan',                   'rubyruy'
    map 'Ryan Bates',                 'ryanb'
    map 'Ryan Bigg',                  'Radar'
    map 'Ryan Daigle',                'rwdaigle'
    map 'Ryan Davis (ryepup)',        'ryepup'
    map 'Ryan Davis (zenspider)',     'Ryan Davis', 'zenspider', "ryand-ruby\100zenspider.com"
    map 'Ryan Duryea',                'aguynamedryan'
    map 'Ryan Heath',                 'rpheath'
    map 'Ryan McGeary',               'rmm5t'
    map 'Ryan Raaum',                 "ryan.raaum\100gmail.com"
    map 'Ryan Tomayko',               "rtomayko\100gmail.com"
    map 'Sachin Singh',               'sachin87', 'Sachin87'
    map 'Sakshi Jain',                'sjain1107'
    map 'Sadman Khan',                'sh6khan'
    map 'Sam Elliott',                'Samuel Elliott'
    map 'Sam Granieri',               'sjgman9'
    map 'Sam Kirchmeier',             "sam.kirchmeier\100gmail.com"
    map 'Sandi Metz',                 "sandra.metz\100duke.edu"
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
    map 'Sean Griffin',               'sgrif', '@sgrif'
    map 'Sean Hussey',                'seanhussey'
    map 'Sean T Allen',               "sean\100ardismg.com"
    map 'Sebastian Delmont',          "sd\100notso.net"
    map 'Sebastian Graessl',          'bastilian'
    map 'Sebastian Kanthak',          "sebastian.kanthak\100muehlheim.de", 'sebastian.kanthak', 'skanthak'
    map 'Sebastian Spieszko',         'ciastek'
    map 'Sen Zhang',                  'Sen-Zhang'
    map 'Serg Podtynnyi',             'shtirlic'
    map 'Serge Balyuk',               'bgipsy'
    map 'Sergey Karpesh',             'kasper'
    map 'Sergey Kojin',               "sergeykojin\100gmail.com"
    map 'Sergey Nartimov',            'lest'
    map 'Sergio Gil',                 'Sergio Gil Pérez de la Manga'
    map 'Seth Ladd',                  'sethladd'
    map 'Seth Rasmussen',             'loincloth'
    map 'Shu-yu Guo',                 "arc\100uchicago.edu"
    map 'Shugo Maeda',                'shugo', "shugo\100ruby-lang.org"
    map 'Shunsuke Aida',              'shunsukeaida', 'ShunsukeAida'
    map 'Si Jobling',                 'Si'
    map 'Simon Arnaud',               "maznawak\100nerim.net"
    map 'Simon Harris',               "simon\100redhillconsulting.com.au", 'haruki_zaemon'
    map 'Simon Jefford',              'simonjefford'
    map 'Simon Moore',                'saimonmoore'
    map 'Simon Stapleton',            "simon.stapleton\100gmail.com"
    map 'shingo-nakanishi',           'shingo.nakanishi'
    map 'Shinichi Maeshima',          'willnet'
    map 'Skye Shaw',                  'sshaw'
    map 'Slava Markevich',            'markevich'
    map 'Soichiro Ogawa',             'ogawaso'
    map 'Solomon White',              "solo\100gatelys.com"
    map 'Sonny Michaud',              'sonnym'
    map 'St. Louis Ruby Users Group', "stlruby\100googlegroups.com"
    map 'Stan Lo',                    "st0012"
    map 'Stanislav Sobolev',          'Stanislav'
    map 'Starr Horne',                "starr\100starrnhorne.com"
    map 'Stefan Hollmann',            'sthollmann'
    map 'Stefan Kaes',                "skaes\100web.de", 'skaes', 'Stephan Kaes', 'Skaes', 'skaes.web.de', 'stefan', 'Stefan', 'skae', 'skaen'
    map 'Stephen Blackstone',         'sblackstone'
    map 'Stephen Haberman',           "stephenh\100chase3000.com"
    map 'Stephen St. Martin',         'Steve St. Martin'
    map 'Stephen Sykes',              'sdsykes'
    map 'Stephen Touset',             "stephen\100touset.org"
    map 'Stephen Veiss',              'sveiss'
    map 'Stephen Veit',               "sveit\100tradeharbor.com"
    map 'Steve Agalloco',             'stve'
    map 'Steve Purcell',              "stephen_purcell\100yahoo.com"
    map 'Steve Richert',              'laserlemon'
    map 'Steven Bristol',             'stevenbristol', 'steve'
    map 'Steven Soroka',              "ssoroka78\100gmail.com", 'ssoroka'
    map 'Stian Grytøyr',              "stian\100grytoyr.net"
    map 'Sudara Williams',            'Sudara'
    map 'Sugino Yasuhiro',            'SUGINO Yasuhiro', 'suginoy'
    map 'Sung-hee Kang',              'paranoiase Kang', 'paranoiase'
    map 'Sunny Ripert',               'Sunny'
    map 'Sur Max',                    'sur'
    map 'Surendra Singhi',            "ssinghi\100kreeti.com"
    map 'Sven Klemm',                 "sven\100c3d2.de"
    map 'Sven Kräuter',               'Sven Kraeuter | 5v3n', 'Sven Kraeuter', '5v3n'
    map 'Tadas Tamošauskas',          'Tadas Tamosauskas'
    map 'Takayuki Matsubara',         'ma2gedev'
    map 'Takoyaki Kamen',             'タコ焼き仮面'
    map 'Tal Rotbart',                'redbeard'
    map 'Tanmay Sinha',               'tanmay3011'
    map 'Tarmo Tänav',                'tarmo', 'tarmo_t', 'Tarmo Täna'
    map 'Taryn East',                 'taryn', 'taryneast', "rubygirl\100taryneast.org"
    map 'Tekin Suleyman',             'Tekin'
    map 'Teng Siong Ong',             'siong1987'
    map 'Thiago Augusto',             'thiagoaugusto'
    map 'Thibaut Leneveu',            'tleneveu'
    map 'Thierry Zires',              'zires'
    map 'Thijs van der Vossen',       'thijsv', "thijs\100vandervossen.net", "thijs\100fngtps.com"
    map 'Thillai Arasu',              'Jude Arasu', 'JudeArasu', 'genlinux'
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
    map 'Tim Masliuchenko',           'Tima Maslyuchenko'
    map 'Tim Pope',                   'tpope', 'Time Pope', "rails\100tpope.info", 'pope'
    map 'Tim Trautmann',              "timct\100mac.com"
    map 'Titus Ramczykowski',         '_tiii'
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
    map 'Tomohiro Hashidate',         'joker1007'
    map 'Tõnis Simo',                 'Anton'
    map 'Tony Jian',                  '簡煒航'
    map 'Toshimaru',                  'toshimaru'
    map 'Toshinori Kajihara',         'kennyj'
    map 'Travis Vander Hoop',         'vanderhoop'
    map 'Trek Glowacki',              'trek'
    map 'Trent Ogren',                'misfo'
    map 'Trevor Squire',              'protocool'
    map 'Troels Petersen',            'tnp'
    map 'Tsukasa OISHI',              'tsukasaoishi'
    map 'Tyler Kiley',                "tyler\100kianta.com"
    map 'Tyler Kovacs',               "tyler.kovacs\100gmail.com"
    map 'Uģis Ozols',                 'Ugis Ozols'
    map 'utilum',                     'oz'
    map 'Vasili Kachalko',            'dreamfall'
    map 'Victor Babenko',             'virusman'
    map 'Victor Jalencas',            "victor-ronr-trac\100carotena.net"
    map 'Vijay Dev',                  'vijay', 'vijaydev'
    map 'Vitalii Khustochka',         "xyctka\100gmail.com", 'khustochka'
    map 'Vitaly Kushner',             'vitaly'
    map 'Vlad Romascanu',             'vladr'
    map 'Vladimir Dementyev',         'palkan'
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
    map 'Yanhao Yang',                'YanhaoYang'
    map 'Yasuhiko Katoh',             'Yasuhiko Katoh (y@su)'
    map 'Yehuda Katz',                'wycats'
    map 'Yoji Shidara',               "darashi\100gmail.com"
    map 'Yonatan Feldman',            "yon\100milliped.com", 'yon'
    map 'Yoshiyuki Hirano',           'yhirano55'
    map 'Yossef Mendelssohn',         'ymendel'
    map 'Yuki Minamiya',              'yuki3738'
    map 'Yuri Leikind',               'leikind'
    map 'Yurii Rashkovskii',          "yrashk\100gmail.com", "yrashk\100fp.org.ua"
    map 'Yury Korolev',               'yury'
    map 'Yuuji Yaginuma',             'yuuji.yaginuma', 'Yuji Yaginuma'
    map 'Yves Senn',                  'senny'
    map 'Yves Siegrist',              'Elektron1c97'
    map 'Zac Williams',               'jzw'
    map 'Zach Dennis',                'zdennis'
    map 'Zachary Holt',               "z\100wzph.com"
    map 'Zack Chandler',              'zackchandler'
    map 'Zheng Jia',                  'zhengjia'
    # Reverse SEEN_ALSO_AS to be able to go from handler to canonical name.
    CANONICAL_NAME_FOR = {}
    SEEN_ALSO_AS.each do |canonical_name, also_as|
      also_as.each do |alt|
        if CANONICAL_NAME_FOR.key?(alt)
          raise "duplicate alias #{alt}"
        else
          CANONICAL_NAME_FOR[alt] = canonical_name
        end
      end
    end
  end
end

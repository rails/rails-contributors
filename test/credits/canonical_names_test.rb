require 'test_helper'

module Credits
  class CanonicalNamesTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'タコ焼き仮面' do
      assert_contributor_names '84403ae', 'Takoyaki Kamen'
    end

    test '松田 明' do
      assert_contributor_names 'bb33432', 'Akira Matsuda'
    end

    test '簡煒航' do
      assert_contributor_names 'c32978d', 'Tony Jian'
    end

    test '簡煒航 (Jian Weihang)' do
      assert_contributor_names '4459576', '簡煒航 (Jian Weihang)'
    end

    test '1334' do
      assert_contributor_names '47d95c8', 'Iñigo Solano Pàez'
    end

    test '90yukke' do
      assert_contributor_names 'b289519', 'Alexander Karmes'
    end

    test '_tiii' do
      assert_contributor_names 'a4b02be', 'Titus Ramczykowski'
    end

    test 'Aaron' do
      assert_contributor_names '1477a61', 'Aaron Eisenberger'
    end

    test 'aarongray' do
      assert_contributor_names 'b30805b', 'Aaron Gray'
    end

    test 'abhay' do
      assert_contributor_names '3353b85', 'Abhay Kumar'
    end

    test 'abonec' do
      assert_contributor_names '20519ef', 'Alexander Baronec'
    end

    test 'acapilleri' do
      assert_contributor_names 'c08c468', 'Angelo Capilleri'
    end

    test 'Accessd' do
      assert_contributor_names 'db25ca7', 'Andrey Morskov'
    end

    test 'acechase' do
      assert_contributor_names '331d9c0', 'Andrew Chase'
    end

    test 'Adam' do
      assert_contributor_names '5dc1f09', 'Adam Magan'
    end

    test "adam\100the-kramers.net" do
      assert_contributor_names '01cfd2b', 'Adam Kramer'
    end

    test 'Adam89' do
      assert_contributor_names '52720b4', 'Adam Magan'
    end

    test 'adamj' do
      assert_contributor_names '4d96ece', 'Adam Johnson'
    end

    test "adamm\100galacticasoftware.com" do
      assert_contributor_names '10a86b2', 'Adam Majer'
    end

    test 'adamwiggins' do
      assert_contributor_names 'ee6b607', 'Adam Wiggins'
    end

    test "adelle\100bullet.net.au" do
      assert_contributor_names '101968f', 'Adelle Hartley'
    end

    test 'Aditya' do
      assert_contributor_names 'd67adf1', 'Aditya Chadha'
    end

    test 'aditya-kapoor' do
      assert_contributor_names '426f42c', 'Aditya Kapoor'
    end

    test 'adman65' do
      assert_contributor_names '7dfa8c0', 'Adam Hawkins'
    end

    test 'Adrian' do
      assert_contributor_names '475bb4b', 'Adrian Marin'
    end

    test 'adymo' do
      assert_contributor_names '9d03813', 'Alexander Dymo'
    end

    test 'aeden' do
      assert_contributor_names 'c9770d8', 'Anthony Eden'
    end

    test 'Agis-' do
      assert_contributor_names '666a248', 'Agis Anastasopoulos'
    end

    test 'agius' do
      assert_contributor_names '1ff67d8', 'Andrew Evans'
    end

    test 'aguynamedryan' do
      assert_contributor_names '4eaa8ba', 'Ryan Duryea'
    end

    test 'aiwilliams' do
      assert_contributor_names 'dd605e9', 'Adam Williams'
    end

    test 'akaspick' do
      assert_contributor_names '0d82b14', 'Andrew Kaspick'
    end

    test "akaspick\100gmail.com" do
      assert_contributor_names 'e30699f', 'Andrew Kaspick'
    end

    test 'akhilgkrishnan' do
      assert_contributor_names 'bf79a4c', 'Akhil G Krishnan'
    end

    test 'Akshay' do
      assert_contributor_names '4d62704', 'Akshay Mohite'
    end

    test 'Akshat Sharma' do
      assert_contributor_names '2438a1c', 'Pramod Sharma'
    end

    test 'alancfrancis' do
      assert_contributor_names '0b45b89', 'Alan Francis'
    end

    test "alancfrancis\100gmail.com" do
      assert_contributor_names 'dfd0bdf', 'Alan Francis'
    end

    test 'Alan Tan' do
      assert_contributor_names 'c9430db', 'Guo Xiang Tan'
    end

    test 'Alan Guo Xiang Tan' do
      assert_contributor_names 'e6da3eb', 'Guo Xiang Tan'
    end

    test 'Alberto Almagro Sotelo' do
      assert_contributor_names '5c62bd5', 'Gannon McGibbon', 'Alberto Almagro'
    end

    test 'Aleksandr Koss' do
      assert_contributor_names 'b7bdacf', 'Sasha Koss'
    end

    test 'Aleksey Kondratenko' do
      assert_contributor_names 'a9113b8', 'Aliaksey Kandratsenka'
    end

    test "alex.borovsky\100gmail.com" do
      assert_contributor_names 'f1a01c8', 'Alexander Borovsky'
    end

    test "alex\100byzantine.no" do
      assert_contributor_names 'ad63c96', 'Alexander Staubo'
    end

    test "alex\100msgpad.com" do
      assert_contributor_names '4277568', 'Alex Pooley'
    end

    test "alex\100purefiction.net" do
      assert_contributor_names 'd016d9a', 'Alexander Staubo'
    end

    test 'Alexander' do
      assert_contributor_names 'bdcc271', 'Alexander Baronec'
      assert_contributor_names '9e39dc4', 'Alexander Baronec'
      assert_contributor_names '7c643d9', 'Alexander Quine'
      assert_contributor_names 'ca6a12d', 'Dembskiy Alexander'
    end

    test 'alexbel' do
      assert_contributor_names '6aaf4bf', 'Alexander Belaev'
    end

    test 'alexch' do
      assert_contributor_names '2559feb', 'Alex Chaffee'
    end

    test 'Alexey' do
      assert_contributor_names 'd336ca5', 'Alexey Zatsepin'
    end

    test 'alexey' do
      assert_contributor_names '52fe604', 'Alexey Zatsepin'
    end

    test 'Alexey Markov' do
      assert_contributor_names '0c85705', 'Markov Alexey'
    end

    test "alexkwolfe\100gmail.com" do
      assert_contributor_names 'b5c2366', 'Alex Wolfe'
    end

    test 'alfa-jpn' do
      assert_contributor_names '9bd4386', 'Atsushi Nakamura'
    end

    test 'alimi' do
      assert_contributor_names '6b5df90', 'Ali Ibrahim'
    end

    test 'alkesh26' do
      assert_contributor_names '393566c', 'Alkesh Ghorpade'
    end

    test 'alkeshghorpade' do
      assert_contributor_names 'aed448c', 'Alkesh Ghorpade'
    end

    test "alles\100atomicobject.com" do
      assert_contributor_names '68dfe3e', 'Micah Alles'
    end

    test 'alloy' do
      assert_contributor_names '4d1c87a', 'Eloy Duran'
    end

    test 'ambethia' do
      assert_contributor_names '18c663e', 'Jason L Perry'
    end

    test 'amishyn' do
      assert_contributor_names 'e32149a', 'Alex Mishyn'
    end

    test 'amitkumarsuroliya' do
      assert_contributor_names '44e94a3', 'Amit Kumar Suroliya'
    end

    test 'anamba' do
      assert_contributor_names '6ccbef5', 'Aaron Namba'
    end

    test 'Anand' do
      assert_contributor_names '25f60cc', 'Anand Muthukrishnan'
    end

    test 'Anatoly Makarevich' do
      assert_contributor_names 'fce0d08', 'Anatoli Makarevich'
    end

    test 'andrea longhi' do
      assert_contributor_names 'd7f0e43', 'Andrea Longhi'
    end

    test 'Andrew' do
      assert_contributor_names '3d6ed50', 'Andrew Chase'
    end

    test "andrew.john.peters\100gmail.com" do
      assert_contributor_names '03097d3', 'Andrew Peters'
    end

    test "andrew\100redlinesoftware.com" do
      assert_contributor_names 'd3cf2a6', 'Andrew Kaspick'
    end

    test "andrey.nering\100gmail.com" do
      assert_contributor_names '6d59473', 'Andrey Nering'
    end

    test "andy\100tinnedfruit.org" do
      assert_contributor_names 'ab7c7a8', 'Andrew A. Smith'
    end

    test "andylien\100gmail.com" do
      assert_contributor_names '35240ba', 'Andy Lien'
    end

    test 'Angelo capilleri' do
      assert_contributor_names 'b97e0a1', 'Angelo Capilleri'
    end

    test 'angelo giovanni capilleri' do
      assert_contributor_names '64af96b', 'Angelo Capilleri'
    end

    test 'anilmaurya' do
      assert_contributor_names '41722dd', 'Anil Kumar Maurya'
    end

    test 'Ankit Gupta-FIR' do
      assert_contributor_names '6a71d09', 'Ankit Gupta'
    end

    test 'ankit1910' do
      assert_contributor_names '3900671', 'Ankit Bansal'
    end

    test 'ankit8898' do
      assert_contributor_names '46a0eac', 'Ankit Gupta'
    end

    test 'Ankit gupta' do
      assert_contributor_names '72c5b5', 'Ankit Gupta'
    end

    test 'anna' do
      assert_contributor_names '9326222', 'maiha'
    end

    test "anna\100wota.jp" do
      assert_contributor_names 'e72ff35', 'maiha'
    end

    test 'AnnaErshova' do
      assert_contributor_names '0166adc', 'Anna Ershova'
    end

    test 'anshkakashi' do
      assert_contributor_names 'ab09984', 'Jason Ketterman'
    end

    test 'Anthony' do
      assert_contributor_names '78f5874', 'Anthony Alberto'
    end

    test 'anthonynavarre' do
      assert_contributor_names 'bdc5141', 'Anthony Navarre'
    end

    test 'Anton' do
      assert_contributor_names 'f0ae503', 'Tõnis Simo'
    end

    test 'Antonio Tapiador' do
      assert_contributor_names '5dd80db', 'Antonio Tapiador del Dujo'
    end

    test 'antramm' do
      assert_contributor_names '083b0b7', 'Ant Ramm'
    end

    test 'anuj  dutta' do
      assert_contributor_names 'd572bf9', 'Anuj Dutta'
    end

    test 'aquajach' do
      assert_contributor_names 'c0eb542', 'aquajach'
    end

    test 'ara.t.howard' do
      assert_contributor_names '99c08c7', 'Ara T Howard'
    end

    test "arc\100uchicago.edu" do
      assert_contributor_names '5177333', 'Shu-yu Guo'
    end

    test 'ariabov' do
      assert_contributor_names '34a3d42', 'Alex Riabov'
    end

    test 'ariejan' do
      assert_contributor_names '388e5d3', 'Ariejan de Vroom'
    end

    test 'arktisklada' do
      assert_contributor_names 'd8bd9cf', 'Clayton Liggitt'
    end

    test 'Arsen7' do
      assert_contributor_names 'f756bfb', 'Mariusz Pękala'
    end

    test 'artemave' do
      assert_contributor_names '6c5a3bb', 'Artem Avetisyan'
    end

    test 'artemk' do
      assert_contributor_names 'b386951', 'Artem Kramarenko'
    end

    test 'Arthur Nogueira Neves' do
      assert_contributor_names '5772ffe', 'Arthur Neves'
    end

    test 'arthurgeek' do
      assert_contributor_names '6ddde02', 'Arthur Zapparoli'
    end

    test 'arton' do
      assert_contributor_names 'c11e78c', 'Akio Tajima'
    end

    test 'arvida' do
      assert_contributor_names '2a7230a', 'Arvid Andersson'
    end

    test 'arvind' do
      assert_contributor_names 'dad0c26', 'Arvind Mehra'
    end

    test 'Ashe Connor' do
      assert_contributor_names '8f5f2bf', 'Asherah Connor'
    end

    test "ask\100develooper.com" do
      assert_contributor_names '17ef706', 'Ask Bjørn Hansen'
    end

    test 'asmega' do
      assert_contributor_names '61fa600', 'Phil Lee'
    end

    test 'Assaf' do
      assert_contributor_names '87ef365', 'Assaf Arkin'
    end

    test "assaf.arkin\100gmail.com" do
      assert_contributor_names '3142502', 'Assaf Arkin'
    end

    test 'athonlab' do
      assert_contributor_names 'ce2eadb', 'AthonLab'
    end

    test "augustz\100augustz.com" do
      assert_contributor_names '3d99d33', 'August Zajonc'
    end

    test 'AvnerCohen' do
      assert_contributor_names 'd20a529', 'Avner Cohen'
    end

    test 'awilliams' do
      assert_contributor_names 'b045b5c', 'Adam Williams'
    end

    test 'Ayose' do
      assert_contributor_names '6ad8f6e', 'Ayose Cazorla'
    end

    test 'Azzurrio' do
      assert_contributor_names '80e8259', 'Karim El-Husseiny'
    end

    test "babie7a0\100ybb.ne.jp" do
      assert_contributor_names '9ded584', 'Michiaki Baba'
    end

    test 'backspace' do
      assert_contributor_names '3b795c1', 'Ken Gerrard'
    end

    test 'bagwanpankaj' do
      assert_contributor_names 'c424fb2', 'Bagwan Pankaj'
    end

    test 'Bart' do
      assert_contributor_names 'c2f59f3', 'Bart de Water'
    end

    test 'Bas Van Klinkenberg' do
      assert_contributor_names 'b99914c', 'Bas van Klinkenberg'
    end

    test 'Ben A. Morgan' do
      assert_contributor_names 'bee4c8f', 'Ben A. Morgan'
    end

    test 'bastilian' do
      assert_contributor_names '071f48b', 'Sebastian Graessl'
    end

    test 'beerlington' do
      assert_contributor_names '3da275c', 'Pete Brown'
    end

    test "bellis\100deepthought.org" do
      assert_contributor_names 'dc87eba', 'Brad Ellis'
    end

    test "ben\100bensinclair.com" do
      assert_contributor_names '1d9905a', 'Ben Sinclair'
    end

    test "ben\100groovie.org" do
      assert_contributor_names 'b9c79f1', 'Ben Bangert'
    end

    test 'benedikt' do
      assert_contributor_names 'b17fd25', 'Benedikt Deicke'
    end

    test 'Benjamin Klotz' do
      assert_contributor_names 'd5847f4', 'Benny Klotz'
    end

    test "benji\100silverinsanity.com" do
      assert_contributor_names 'd08f838', 'Brian Gernhardt'
    end

    test 'benmmurphy' do
      assert_contributor_names 'c8168a7', 'Ben Murphy'
    end

    test 'benolee' do
      assert_contributor_names '008023c', 'Ben Holley'
    end

    test 'bermi' do
      assert_contributor_names '6ca789b', 'Bermi Ferrer'
    end

    test 'BertG' do
      assert_contributor_names '06afb8c', 'Bert Goethals'
    end

    test 'bgipsy' do
      assert_contributor_names '88f2284', 'Serge Balyuk'
    end

    test 'bgreenlee' do
      assert_contributor_names '083b0b7', 'Brad Greenlee'
    end

    test 'bitsweat' do
      assert_contributor_names '253a2bb', 'Jeremy Daer'
    end

    test 'Blaine' do
      assert_contributor_names 'f5977b2', 'Blaine Cook'
    end

    test 'blaine' do
      assert_contributor_names '7d517a1', 'Blaine Cook'
    end

    test "blaine\100odeo.com" do
      assert_contributor_names 'bf3f920', 'Blaine Cook'
    end

    test "blair\100orcaware.com" do
      assert_contributor_names '46796e7', 'Blair Zajac'
    end

    test "blake\100near-time.com" do
      assert_contributor_names '604eb8a', 'Blake Watters'
    end

    test 'BlueHotDog' do
      assert_contributor_names '8642c2a', 'Danni Friedland'
    end

    test 'BMorearty' do
      assert_contributor_names '436da68', 'Brian Morearty'
    end

    test "bob\100sporkmonger.com" do
      assert_contributor_names 'ce458a7', 'Bob Aman'
    end

    test 'bobbus' do
      assert_contributor_names '7ded3b8', 'Adrien Coquio'
    end

    test 'BobSilva' do
      assert_contributor_names '0c94868', 'Bob Silva'
    end

    test 'Bodacious' do
      assert_contributor_names '39b9c94', 'Gavin Morrice'
    end

    test 'bogdan' do
      assert_contributor_names 'b644964', 'Bogdan Gusiev'
    end

    test 'Bogdan' do
      assert_contributor_names '2686130', 'bogdanvlviv'
    end

    test 'boone' do
      assert_contributor_names '3486d54', 'Mike Boone'
    end

    test 'Bounga' do
      assert_contributor_names '39de84d', 'Nicolas Cavigneaux'
    end

    test "brad\100madriska.com" do
      assert_contributor_names '785e1fa5', 'Brad Ediger'
    end

    test 'bradediger' do
      assert_contributor_names '6c77370', 'Brad Ediger'
    end

    test 'bradrobertson' do
      assert_contributor_names '0252376', 'Brad Robertson'
    end

    test 'brainopia' do
      assert_contributor_names 'da82b0a', 'Ravil Bayramgalin'
    end

    test 'brandon' do
      assert_contributor_names '35ffc1a', 'Brandon Keepers'
    end

    test "brandon\100opensoul.org" do
      assert_contributor_names 'fe4d5ea', 'Brandon Keepers'
    end

    test "brandt\100kurowski.net" do
      assert_contributor_names '6d7175d', 'Brandt Kurowski'
    end

    test 'brendan' do
      assert_contributor_names '88f2284', 'Brendan Baldwin'
    end

    test "brianegge\100yahoo.com" do
      assert_contributor_names 'a092749', 'Brian Egge'
    end

    test 'brianp' do
      assert_contributor_names '50a7391', 'Brian Pearce'
    end

    test 'bronson' do
      assert_contributor_names 'cb1f569', 'Scott Bronson'
    end

    test 'brupm' do
      assert_contributor_names '4e7d332', 'Bruno Miranda'
    end

    test 'brynary' do
      assert_contributor_names '5dc831f', 'Bryan Helmkamp'
    end

    test 'bscofield' do
      assert_contributor_names '81991d6', 'Ben Scofield'
    end

    test 'buddhamagnet' do
      assert_contributor_names 'a85729c', 'Dave Goodchild'
    end

    test 'c.r.mcgrath' do
      assert_contributor_names '838ae35', 'Chris McGrath'
    end

    test 'chaadow' do
      assert_contributor_names 'a5e1fc97d2', 'Chedli Bourguiba'
    end

    test "c.r.mcgrath\100gmail.com" do
      assert_contributor_names '6a51940', 'Chris McGrath'
    end

    test 'caio' do
      assert_contributor_names 'c089974', 'Caio Chassot'
    end

    test 'calavera' do
      assert_contributor_names '4196616', 'David Calavera'
    end

    test "caleb\100aei-tech.com" do
      assert_contributor_names 'd5b67ed8', 'Caleb Tennis'
    end

    test 'canadaduane' do
      assert_contributor_names 'cab2494', 'Duane Johnson'
    end

    test 'careo' do
      assert_contributor_names '50ee332', 'Dane Jensen'
    end

    test 'Carlhuda' do
      assert_contributor_names 'c102db9', 'Yehuda Katz', 'Carl Lerche'
    end

    test 'CassioMarques' do
      assert_contributor_names '053afbe', 'Cássio Marques'
    end

    test 'Catfish' do
      assert_contributor_names '9679cb4', 'Jonathan del Strother'
    end

    test 'catfish' do
      assert_contributor_names 'eff27ab', 'Jonathan del Strother'
    end

    test 'cavalle' do
      assert_contributor_names 'b96db52', 'Luismi Cavallé'
    end

    test 'cavelle' do
      assert_contributor_names '9e45586', 'Luismi Cavallé'
    end

    test 'cch1' do
      assert_contributor_names '569a78c', 'Chris Hapgood'
    end

    test 'cczona' do
      assert_contributor_names '6ee8e92', 'Carina C. Zona'
    end

    test "cdcarter\100gmail.com" do
      assert_contributor_names '2139921', 'Chris Carter'
    end

    test 'Cédric FABIANSKI' do
      assert_contributor_names '9f54921', 'Cédric Fabianski'
    end

    test 'ceefour' do
      assert_contributor_names '7e33de4', 'Hendy Irawan'
    end

    test 'ch33hau' do
      assert_contributor_names 'ac85125', 'Lim Chee Hau'
    end

    test 'chaitanyav' do
      assert_contributor_names '449cf50', 'Chaitanya Vellanki'
    end

    test "charles.gerungan\100gmail.com" do
      assert_contributor_names '3c0e7b1', 'Charles M. Gerungan'
    end

    test 'chas' do
      assert_contributor_names '6f63287', 'Chas Grundy'
    end

    test 'chocoby' do
      assert_contributor_names '04907b6', 'Kenta Okamoto'
    end

    test 'choonkeat' do
      assert_contributor_names '099c206', 'Choon Keat'
    end

    test "choonkeat\100gmail.com" do
      assert_contributor_names '89840c4', 'Choon Keat'
    end

    test "chris\100chrisbrinker.com" do
      assert_contributor_names 'a685579', 'Chris Brinker'
    end

    test 'chris finne' do
      assert_contributor_names 'b80fa81', 'Chris Finne'
    end

    test "chris\100octopod.info" do
      assert_contributor_names '3c0e7b1', 'Chris McGrath'
    end

    test "chris\100ozmm.org" do
      assert_contributor_names '11c715a', 'Chris Wanstrath'
    end

    test "chris\100seagul.co.uk" do
      assert_contributor_names '760bcc6', 'Chris Roos'
    end

    test 'chrisfinne' do
      assert_contributor_names '76d2c45', 'Chris Finne'
    end

    test 'chrisk' do
      assert_contributor_names '19a1586', 'Chris Kampmeier'
    end

    test 'chriskohlbrenner' do
      assert_contributor_names '2ec51d0', 'Chris Kohlbrenner'
    end

    test 'chrismear' do
      assert_contributor_names 'afd288c', 'Chris Mear'
    end

    test 'chrisroos' do
      assert_contributor_names '50253ed', 'Chris Roos'
    end

    test "chriztian.steinmeier\100gmail.com" do
      assert_contributor_names 'd40af24', 'Chriztian Steinmeier'
    end

    test 'Chu Yeow' do
      assert_contributor_names 'dc3e55d', 'Cheah Chu Yeow'
    end

    test 'chuyeow' do
      assert_contributor_names '56e6462', 'Cheah Chu Yeow'
    end

    test 'ciastek' do
      assert_contributor_names '2bcfdec', 'Sebastian Spieszko'
    end

    test 'cjheath' do
      assert_contributor_names '12d8d48', 'Clifford Heath'
    end

    test 'Claudio B' do
      assert_contributor_names '0b0042c', 'Claudio Baccigalupo'
    end

    test 'Claudio B.' do
      assert_contributor_names '2651810', 'Claudio Baccigalupo'
    end

    test 'claudiob' do
      assert_contributor_names '0e56c1d', 'Claudio Baccigalupo'
    end

    test 'claudiofullscreen' do
      assert_contributor_names '0b725aa', 'Claudio Baccigalupo'
    end

    test 'cluon' do
      assert_contributor_names 'deda0ee', 'Phil Orwig'
    end

    test 'cnaize' do
      assert_contributor_names 'bf15169', 'Nikita Loskutov'
    end

    test 'codafoo' do
      assert_contributor_names 'be827f9', 'Cesar Ho'
    end

    test 'codahale' do
      assert_contributor_names '4aabe46', 'Coda Hale'
    end

    test 'codeape' do
      assert_contributor_names '9a42096', 'Dan Cheail'
    end

    test 'codebrulee' do
      assert_contributor_names 'ebe8dd6', 'Kevin Smith'
    end

    test 'codesnik' do
      assert_contributor_names '96d4da1', 'Alexey Trofimenko'
    end

    test "codyfauser\100gmail.com" do
      assert_contributor_names 'f49ba11', 'Cody Fauser'
    end

    test 'coffee2code' do
      assert_contributor_names 'ab9f324', 'Scott Reilly'
    end

    test "cohen.jeff\100gmail.com" do
      assert_contributor_names 'e57bd72', 'Jeff Cohen'
    end

    test "colman\100rominato.com" do
      assert_contributor_names 'b762e01', 'Colman Nady'
    end

    test "contact\100lukeredpath.co.uk" do
      assert_contributor_names 'e9d4b36', 'Luke Redpath'
    end

    test "contact\100maik-schmidt.de" do
      assert_contributor_names '2d24bed', 'Maik Schmidt'
    end

    test 'coreyhaines' do
      assert_contributor_names 'df755d4', 'Corey Haines'
    end

    test 'Cory Gwin' do
      assert_contributor_names '31021c7', 'Cory Gwin'
    end

    test 'court3nay' do
      assert_contributor_names '891a962', 'Courtenay Gasking'
    end

    test 'Court3nay' do
      assert_contributor_names 'ee87dbe', 'Courtenay Gasking'
    end

    test "court3nay\100gmail.com" do
      assert_contributor_names 'df97ed5', 'Courtenay Gasking'
    end

    test 'courtenay' do
      assert_contributor_names '14e7c7c', 'Courtenay Gasking'
    end

    test 'cpytel' do
      assert_contributor_names 'f254616', 'Chad Pytel'
    end

    test 'Cristi BALAN' do
      assert_contributor_names '6d566e8', 'Cristi Balan'
    end

    test 'ctm' do
      assert_contributor_names 'c26cca3', 'Clifford T. Matthews'
    end

    test 'cyu' do
      assert_contributor_names '2b68762', 'Calvin Yu'
    end

    test 'dacat' do
      assert_contributor_names 'f854ecd', 'Felix Dominguez'
    end

    test 'dancroak' do
      assert_contributor_names '569a78c', 'Dan Croak'
    end

    test 'danger' do
      assert_contributor_names '1dd0034', 'Jack Danger Canty'
    end

    test 'Danger' do
      assert_contributor_names '2c6e616', 'Jack Danger Canty'
    end

    test 'Daniel Burnette' do
      assert_contributor_names 'b93ae0c', 'Daniel Burnette'
    end

    test "daniel\100nightrunner.com" do
      assert_contributor_names 'ba309a3', 'Daniel Hobe'
    end

    test "daniel\100nouvelles-solutions.com" do
      assert_contributor_names '1671609', 'Daniel Wanja'
    end

    test 'danielc192' do
      assert_contributor_names '0fc481d', 'Daniel Cohen'
    end

    test 'danielmorrison' do
      assert_contributor_names 'cb5b8a7', 'Daniel Morrison'
    end

    test "daniels\100pronto.com.au" do
      assert_contributor_names '6a1a1e5', 'Daniel Sheppard'
    end

    test "daniluk\100yahoo.com" do
      assert_contributor_names 'c99df46', 'Grzegorz Daniluk'
    end

    test "dansketcher\100gmail.com" do
      assert_contributor_names 'fb619127', 'Dan Sketcher'
    end

    test "darashi\100gmail.com" do
      assert_contributor_names '17d2732', 'Yoji Shidara'
    end

    test 'dasil003' do
      assert_contributor_names '2a07886', 'Gabe da Silveira'
    end

    test "dave\100cherryville.org" do
      assert_contributor_names 'b66b1ff', 'Dave Lee'
    end

    test "dave-ml\100dribin.org" do
      assert_contributor_names '2fe8610', 'Dave Dribin'
    end

    test "dave\100pragprog.com" do
      assert_contributor_names 'c80c636', 'Dave Thomas'
    end

    test 'davetoxa' do
      assert_contributor_names 'cc585c8', 'Anton Cherepanov'
    end

    test 'david.calavera' do
      assert_contributor_names '7e1c04d', 'David Calavera'
    end

    test "david.felstead\100gmail.com" do
      assert_contributor_names '8dda7c5', 'David Felstead'
    end

    test 'David FRANCOIS' do
      assert_contributor_names '18aa1ae', 'David François'
    end

    test 'DAVID MOORE' do
      assert_contributor_names '4c945cc', 'Dave Moore'
    end

    test "david\100ruppconsulting.com" do
      assert_contributor_names 'c4a3634', 'David Rupp'
    end

    test 'davidauza-engineer' do
      assert_contributor_names 'e3d496a', 'David Auza'
    end

    test 'davidjrice' do
      assert_contributor_names '82a85e8', 'David Rice'
    end

    test 'davidw' do
      assert_contributor_names '1f80296', 'David N. Welton'
    end

    test 'DawidJanczak' do
      assert_contributor_names '89a8143', 'Dawid Janczak'
    end

    test 'Dawnthorn' do
      assert_contributor_names 'f999ab0', 'Peter Haight'
    end

    test 'dblack' do
      assert_contributor_names '11a5492', 'David A. Black'
    end

    test "dblack\100wobblini.net" do
      assert_contributor_names '91247b6', 'David A. Black'
    end

    test 'dbussink' do
      assert_contributor_names '78727dd', 'Dirkjan Bussink'
    end

    test 'dchelimsky' do
      assert_contributor_names '42ebf55', 'David Chelimsky'
    end

    test 'dcmanges' do
      assert_contributor_names '16fde4c', 'Dan Manges'
    end

    test 'dcurtis' do
      assert_contributor_names '248fa70', 'Dustin Curtis'
    end

    test 'ddemaree' do
      assert_contributor_names 'f90160c', 'David Demaree'
    end

    test 'ddollar' do
      assert_contributor_names '8ff9e93', 'David Dollar'
    end

    test 'Dee.Zsombor' do
      assert_contributor_names '2bf2230', 'Dee Zsombor'
    end

    test "Dee.Zsombor\100gmail.com" do
      assert_contributor_names '26022d8', 'Dee Zsombor'
    end

    test 'deepblue' do
      assert_contributor_names '2a34e08', 'Bryan Kang'
    end

    test 'defeated' do
      assert_contributor_names 'dcaa074', 'Eddie Cianci'
    end

    test 'defunkt' do
      assert_contributor_names '49cb412', 'Chris Wanstrath'
    end

    test 'DefV' do
      assert_contributor_names 'c71de03', 'Jan De Poorter'
    end

    test "deirdre\100deirdre.net" do
      assert_contributor_names '9105cd1', 'Deirdre Saoirse'
    end

    test 'DeLynn' do
      assert_contributor_names 'aa09c77', 'DeLynn Berry'
    end

    test 'DeLynn B' do
      assert_contributor_names '6cd3bda', 'DeLynn Berry'
    end

    test 'DeLynn Barry' do
      assert_contributor_names 'f2e6945', 'DeLynn Berry'
    end

    test 'delynnb' do
      assert_contributor_names '665ab93', 'DeLynn Berry'
    end

    test 'DelynnB' do
      assert_contributor_names 'ba96827', 'DeLynn Berry'
    end

    test 'DeLynnB' do
      assert_contributor_names 'ed46cc3', 'DeLynn Berry'
    end

    test 'demetrius' do
      assert_contributor_names 'ec6f0a1', 'Demetrius Nunes'
    end

    test 'Demetrius' do
      assert_contributor_names '93ec130', 'Demetrius Nunes'
    end

    test "derrickspell\100cdmplus.com" do
      assert_contributor_names '416385a', 'Derrick Spell'
    end

    test "dev\100metacasa.net" do
      assert_contributor_names '9a5b91a', 'John Sheets'
    end

    test 'Developer' do
      assert_contributor_names '179b451', 'John Pignata'
    end

    test 'Dmitriy Budnik' do
      assert_contributor_names 'a209652', 'Dmitriy Budnik'
    end

    test 'devrieda' do
      assert_contributor_names '45d679b', 'Derek DeVries'
    end

    test "devslashnull\100gmail.com" do
      assert_contributor_names '4bd80f1', 'Brian Donovan'
    end

    test "dfelstead\100site5.com" do
      assert_contributor_names '5e5b87b', 'David Felstead'
    end

    test 'dfens' do
      assert_contributor_names 'ab9140f', 'Paweł Mikołajewski'
    end

    test 'dharmatech' do
      assert_contributor_names 'f74a4d8', 'Eduardo Cavazos'
    end

    test 'Dima Fatko' do
      assert_contributor_names '238432d', 'Jorge Manrubia', 'fatkodima'
    end

    test 'dixpac' do
      assert_contributor_names 'c520417', 'Dino Maric'
    end

    test 'DHH' do
      assert_contributor_names 'bd261ff', 'David Heinemeier Hansson'
    end

    test 'diatmpravin' do
      assert_contributor_names 'a302597', 'Pravin Mishra'
    end

    test 'dickeyxxx' do
      assert_contributor_names '21586d3', 'Jeff Dickey'
    end

    test "dj\100omelia.org" do
      assert_contributor_names 'f6ec9e3', 'Duff OMelia'
    end

    test 'djanowski' do
      assert_contributor_names '0e6c8e5', 'Damian Janowski'
    end

    test 'dkaplan88' do
      assert_contributor_names 'a0bdf2f', 'Dan Kaplan'
    end

    test 'dkubb' do
      assert_contributor_names '11a92b3', 'Dan Kubb'
    end

    test 'dm1try' do
      assert_contributor_names 'c12024b', 'Dmitry Dedov'
    end

    test 'dmathieu' do
      assert_contributor_names '18bce29', 'Damien Mathieu'
    end

    test 'Dmitriy Vorotilin' do
      assert_contributor_names '705a1d5', 'Dmitry Vorotilin'
    end

    test 'Vasin Dmitriy' do
      assert_contributor_names 'dc8ddea', 'Dmytro Vasin'
    end

    test 'doabit' do
      assert_contributor_names '8094156', 'Sean Dent'
    end

    test 'docunext' do
      assert_contributor_names 'c070cc4', 'Albert Lash'
    end

    test "dom\100sisna.com" do
      assert_contributor_names 'c81af99', 'Dominic Sisneros'
    end

    test "don.park\100gmail.com" do
      assert_contributor_names '2ed6d36', 'Don Park'
    end

    test "donald.piret\100synergetek.be" do
      assert_contributor_names 'd94af9a', 'Donald Piret'
    end

    test "doppler\100gmail.com" do
      assert_contributor_names 'f4f7e75', 'David Rose'
    end

    test "dpiddy\100gmail.com" do
      assert_contributor_names '58f2bd0c', 'Dan Peterson'
    end

    test 'dpmehta02' do
      assert_contributor_names 'b9ead0f', 'Dev Mehta'
    end

    test 'Dr Nic' do
      assert_contributor_names '868e6b0', 'Dr Nic Williams'
    end

    test "drbrain\100segment7.net" do
      assert_contributor_names 'ce0653b', 'Eric Hodel'
    end

    test 'Dreamer3' do
      assert_contributor_names 'c6a1830', 'Josh Goebel'
    end

    test "dreamer3\100gmail.com" do
      assert_contributor_names 'dfa8aa0', 'Josh Goebel'
    end

    test 'dreamfall' do
      assert_contributor_names '7c3a5ec', 'Vasili Kachalko'
    end

    test 'Drew' do
      assert_contributor_names '28a9b65', 'Drew Bragg'
    end

    test 'DrMark' do
      assert_contributor_names '56fec2f', 'Mark Lane'
    end

    test 'drnic' do
      assert_contributor_names '346d36b', 'Dr Nic Williams'
    end

    test 'drodriguez' do
      assert_contributor_names '046a87a', 'Daniel Rodríguez Troitiño'
    end

    test 'dtaniwaki' do
      assert_contributor_names 'c91e1cc', 'Daisuke Taniwaki'
    end

    test "duane.johnson\100gmail.com" do
      assert_contributor_names '0b92d38', 'Duane Johnson'
    end

    test "duncan\100whomwah.com" do
      assert_contributor_names 'fd8ee0a', 'Duncan Robertson'
    end

    test 'duncanbeevers' do
      assert_contributor_names '9f1fdcc', 'Duncan Beevers'
    end

    test "dweitzman\100gmail.com" do
      assert_contributor_names '9ca9f95', 'David Weitzman'
    end

    test 'Dylan Smith' do
      assert_contributor_names 'b4be619', 'Dylan Thacker-Smith'
    end

    test "dymo\100mk.ukrtelecom.ua" do
      assert_contributor_names '6ce3bf7', 'Alexander Dymo'
    end

    test 'Eadz' do
      assert_contributor_names '6a17151', 'Eaden McKee'
    end

    test 'eadz' do
      assert_contributor_names '9b6207c', 'Eaden McKee'
    end

    test "easleydp\100gmail.com" do
      assert_contributor_names 'eede40b', 'David Easley'
    end

    test "eddiewould\100paradise.net.nz" do
      assert_contributor_names '1e7ce13', 'Eddie Stanley'
    end

    test 'edibiase' do
      assert_contributor_names 'cb978ba', 'Evan DiBiase'
    end

    test 'edogawaconan' do
      assert_contributor_names '650a05c', 'Edho Arief'
    end

    test "edward\100debian.org" do
      assert_contributor_names '7d09b8d', 'Edward Betts'
    end

    test 'egilburg' do
      assert_contributor_names '7c34548', 'Eugene Gilburg'
    end

    test "ehalvorsen+rails\100runbox.com" do
      assert_contributor_names '49efa02', 'Erlend Halvorsen'
    end

    test 'eigentone' do
      assert_contributor_names 'b62243a', 'Craig Davey'
    end

    test "eigentone\100gmail.com" do
      assert_contributor_names '5130fc8', 'Craig Davey'
    end

    test 'eileencodes' do
      assert_contributor_names '7caceee', 'Eileen M. Uchitelle'
    end

    test 'Eileen Uchitelle' do
      assert_contributor_names 'aec635d', 'Eileen M. Uchitelle'
    end

    test 'ejy' do
      assert_contributor_names '740e531', 'Elliot Yates'
    end

    test 'Elektron1c97' do
      assert_contributor_names '6bd417d', 'Yves Siegrist'
    end

    test "elan\100bluemandrill.com" do
      assert_contributor_names 'a46214c', 'Elan Feingold'
    end

    test "elliot\100townx.org" do
      assert_contributor_names '68e35f1', 'Elliot Smith'
    end

    test 'Emili Parreno' do
      assert_contributor_names '3616141', 'Emili Parreño'
    end

    test "emptysands\100gmail.com" do
      assert_contributor_names 'da874a4', 'Nicholas Lee'
    end

    test 'eparreno' do
      assert_contributor_names '344a695', 'Emili Parreño'
    end

    test "eric.daspet\100survol.net" do
      assert_contributor_names '9153137', 'Eric Daspet'
    end

    test "erik\100codefaktor.de" do
      assert_contributor_names 'eefc22f', 'Erik Abele'
    end

    test "erik\100ruby-lang.nl" do
      assert_contributor_names 'e54b4d3', 'Erik Terpstra'
    end

    test 'ernesto.jimenez' do
      assert_contributor_names '5932357', 'Ernesto Jimenez'
    end

    test 'Ershad K' do
      assert_contributor_names '6389571', 'Ershad Kunnakkadan'
    end

    test 'esad' do
      assert_contributor_names '4917813', 'Esad Hajdarevic'
    end

    test "esad\100esse.at" do
      assert_contributor_names '6ef5b74', 'Esad Hajdarevic'
    end

    test "eule\100space.ch" do
      assert_contributor_names 'bf8b101', 'Kaspar Schiess'
    end

    test 'evan' do
      assert_contributor_names '00cecf8', 'Evan Weaver'
    end

    test "evan\100protest.net" do
      assert_contributor_names '68608e3', 'Evan Henshaw-Plath'
    end

    test 'evansj' do
      assert_contributor_names '211ffd3', 'Jon Evans'
    end

    test 'eventualbuddha' do
      assert_contributor_names 'debaf20', 'Brian Donovan'
    end

    test "evgeny.zislis\100gmail.com" do
      assert_contributor_names '842ce34', 'Evgeny Zislis'
    end

    test 'f.svehla' do
      assert_contributor_names '3cf2c63', 'Ferdinand Svehla'
    end

    test "f.svehla\100gmail.com" do
      assert_contributor_names 'a53372c', 'Ferdinand Svehla'
    end

    test 'Fabian Rodriguez' do
      assert_contributor_names 'f374720', 'Fabián Rodríguez'
    end

    test "fabien\100odilat.com" do
      assert_contributor_names 'f9103e1', 'Fabien Mannessier'
    end

    test 'farleyknight' do
      assert_contributor_names 'f3b3826', 'Farley Knight'
    end

    test 'farzy' do
      assert_contributor_names 'f18c24c', 'Farzad Farid'
    end

    test 'fastred' do
      assert_contributor_names '4ea9a8d', 'Arkadiusz Holko'
    end

    test "fbeausoleil\100ftml.net" do
      assert_contributor_names '6d336753', 'François Beausoleil'
    end

    test 'fcheung' do
      assert_contributor_names '083b0b7', 'Frederick Cheung'
    end

    test 'fearoffish' do
      assert_contributor_names 'df27fb8', 'Jamie van Dyke'
    end

    test 'fedot' do
      assert_contributor_names '70d7b37', 'Fedot Praslov'
    end

    test "flash\100vanklinkenbergsoftware.nl" do
      assert_contributor_names 'de1f231', 'Bas van Klinkenberg'
    end

    test 'floehopper' do
      assert_contributor_names '4f39382', 'James Mead'
    end

    test 'flowdelic' do
      assert_contributor_names 'c59bce8', 'Mason Hale'
    end

    test "foamdino\100gmail.com" do
      assert_contributor_names '7635fac', 'Kevin Jackson'
    end

    test 'foca' do
      assert_contributor_names '458ef3b', 'Nicolás Sanguinetti'
    end

    test 'Foliosus' do
      assert_contributor_names '0c4ba90', 'Brent Miller'
    end

    test 'FooBarWidget' do
      assert_contributor_names '9e13b96', 'Hongli Lai (Phusion)'
    end

    test 'FranÃ§ois Beausolei' do
      assert_contributor_names 'd496db1', 'François Beausoleil'
    end

    test 'Francesco Rodriguez' do
      assert_contributor_names '3326b8b', 'Francesco Rodríguez'
    end

    test 'Francois Beausoleil' do
      assert_contributor_names '07f92e8', 'François Beausoleil'
    end

    test "francois.beausoleil\100gmail.com" do
      assert_contributor_names '127ee8c', 'François Beausoleil'
    end

    test 'Franky W' do
      assert_contributor_names 'b1d2635', 'Franky Wahl'
    end

    test 'Fred Cheung' do
      assert_contributor_names '220a64e', 'Frederick Cheung'
    end

    test "frederick.cheung\100gmail.com" do
      assert_contributor_names '078bd05', 'Frederick Cheung'
    end

    test 'frederico' do
      assert_contributor_names '11a75f9', 'Frederico Macedo'
    end

    test 'freels' do
      assert_contributor_names '36b8073', 'Matt Freels'
    end

    test 'fxn' do
      assert_contributor_names '75aef09', 'Xavier Noria'
    end

    test "g.bucher\100teti.ch" do
      assert_contributor_names '3574ab3', 'Gaspard Bucher'
    end

    test "gabriel.gironda\100gmail.com" do
      assert_contributor_names '258bacb', 'Gabriel Gironda'
    end

    test "gabriel\100gironda.org" do
      assert_contributor_names 'ba2619f', 'Gabriel Gironda'
    end

    test 'ganesh' do
      assert_contributor_names 'b3ade0c', 'Ganesh Kumar'
    end

    test 'Gaurav Sharam' do
      assert_contributor_names '434c768', 'Gaurav Sharma'
    end

    test 'gbuesing' do
      assert_contributor_names '41adf87', 'Geoff Buesing'
    end

    test 'Girish S' do
      assert_contributor_names 'bbf6df7', 'Girish Sonawane'
    end

    test 'geemus' do
      assert_contributor_names 'ed2eb6f', 'Wesley Beary'
    end

    test 'genlinux' do
      assert_contributor_names '23a5be7', 'Thillai Arasu'
    end

    test "gensym\100mac.com" do
      assert_contributor_names '5241b97', 'David Altenburg'
    end

    test 'Geoffrey Buesing' do
      assert_contributor_names 'cfd5688', 'Geoff Buesing'
    end

    test 'Geoffrey ROGUELON' do
      assert_contributor_names '96e483a', 'Geoffrey Roguelon'
    end

    test 'german' do
      assert_contributor_names 'adbae9a', 'Dmitrii Samoilov'
    end

    test 'gfriedrich' do
      assert_contributor_names 'd5e1220', 'Georg Friedrich'
    end

    test 'ggarside' do
      assert_contributor_names '5a3b4cf', 'Geoff Garside'
    end

    test 'glorieux' do
      assert_contributor_names 'c8b7ad1', 'Geoffroy Lorieux'
    end

    test 'glv' do
      assert_contributor_names 'dd665ff', 'Glenn Vanderburg'
    end

    test 'gmarik' do
      assert_contributor_names 'b0be721', 'Marjan Hratson'
    end

    test 'GMFlash' do
      assert_contributor_names '21c75e5', 'Michael Sheakoski'
    end

    test 'gmile' do
      assert_contributor_names '56c162e', 'Pirogov Evgenij'
    end

    test 'gnagno' do
      assert_contributor_names 'fdc0468', 'Ignazio Mostallino'
    end

    test "grant\100antiflux.org" do
      assert_contributor_names '63a9516', 'Grant Hollingworth'
    end

    test 'greenbigfrog' do
      assert_contributor_names '9233f52', 'greenbigfrog'
    end

    test 'Greenie0506' do
      assert_contributor_names 'a1ae17e', 'Nicholas Greenfield'
    end

    test "greg\100lapcominc.com" do
      assert_contributor_names '7f00f51', 'Greg Lappen'
    end

    test 'gregolsen' do
      assert_contributor_names '8d83e33', 'Innokenty Mikhailov'
    end

    test 'grg' do
      assert_contributor_names 'fb7807e', 'Glen Gibb'
    end

    test 'grosser' do
      assert_contributor_names '149e3cd', 'Michael Grosser'
    end

    test 'gsphanikumar' do
      assert_contributor_names 'b1a501e', 'G S Phani Kumar'
    end

    test 'gspiers' do
      assert_contributor_names '9300ebd', 'Greg Spiers'
    end

    test 'guillaume' do
      assert_contributor_names 'cfe42ba', 'Guillaume Carbonneau'
    end

    test 'Guo Xiang' do
      assert_contributor_names '1f89330', 'Guo Xiang Tan'
    end

    test "guy.naor\100famundo.com" do
      assert_contributor_names 'd568fb6', 'Guy Naor'
    end

    test 'gwcoffey' do
      assert_contributor_names '9b6207c', 'Geoff Coffey'
    end

    test 'h-lame' do
      assert_contributor_names '295587f', 'Murray Steele'
    end

    test 'hakanensari' do
      assert_contributor_names '9be22bd', 'Hakan Ensari'
    end

    test "hakuja\100hakuja.net" do
      assert_contributor_names '50103b8', 'Koichi Tsutsumi'
    end

    test 'halfbyte' do
      assert_contributor_names 'c9397e6', 'Jan Krutisch'
    end

    test "hanson\100surgery.wisc.edu" do
      assert_contributor_names '431e21c', 'Todd Hanson'
    end

    test 'hardbap' do
      assert_contributor_names '4c21026', 'Mike Breen'
    end

    test 'haruki_zaemon' do
      assert_contributor_names 'fcfcc70', 'Simon Harris'
    end

    test 'hasmanyjosh' do
      assert_contributor_names '24abd43', 'Josh Susser'
    end

    test "hcatlin\100gmail.com" do
      assert_contributor_names 'c5ec16e', 'Hampton Catlin'
    end

    test "headius\100headius.com" do
      assert_contributor_names 'c53ae00', 'Charles Nutter'
    end

    test 'heavysixer' do
      assert_contributor_names '429ef9c', 'Mark Daggett'
    end

    test "hendrik\100mans.de" do
      assert_contributor_names 'ac4b470', 'Hendrik Mans'
    end

    test 'henrik' do
      assert_contributor_names '9929cb4', 'Henrik Nyh'
    end

    test 'Henrik N' do
      assert_contributor_names 'c84c043', 'Henrik Nyh'
    end

    test "henrik\100nyh.se" do
      assert_contributor_names '65a29b3', 'Henrik Nyh'
    end

    test "hensleyl\100papermountain.org" do
      assert_contributor_names '85c603f', 'Leslie A. Hensley'
    end

    test 'hiroshi' do
      assert_contributor_names '94d6716', 'Hiroshi Saito'
    end

    test 'hoffm' do
      assert_contributor_names '1b12d08', 'Michael Hoffman'
    end

    test 'homa' do
      assert_contributor_names 'b839657', 'Egor Homakov'
    end

    test "\100homakov" do
      assert_contributor_names '973490a', 'Egor Homakov'
    end

    test 'homakov' do
      assert_contributor_names 'f35c93f', 'Egor Homakov'
    end

    test 'Hongli Lai' do
      assert_contributor_names 'f1d6a0e', 'Hongli Lai (Phusion)'
    end

    test 'Hongli Lai (Phusion' do
      assert_contributor_names '011cbbc', 'Hongli Lai (Phusion)'
    end

    test 'HPNeo' do
      assert_contributor_names '96f7ec4', 'Gustavo Leon'
    end

    test 'iaddict' do
      assert_contributor_names 'e1b3a44', 'Tom Stone'
    end

    test "ian.w.white\100gmail.com" do
      assert_contributor_names '59c8c63', 'Ian White'
    end

    test 'iGEL' do
      assert_contributor_names 'c3ff04b', 'Johannes Barre'
    end

    test 'Igor' do
      assert_contributor_names 'dd0bbd2', 'Igor Fedoronchuk'
    end

    test 'igor04' do
      assert_contributor_names '0e50b7b', 'Igor Guzak'
    end

    test "ikeda\100dream.big.or.jp" do
      assert_contributor_names 'f0448f5', 'Akira Ikeda'
    end

    test 'imajes' do
      assert_contributor_names '553c23d', 'James Cox'
    end

    test "info\100rhalff.com" do
      assert_contributor_names '73ed47d', 'Rob Halff'
    end

    test 'innu' do
      assert_contributor_names 'af005df', 'Indrek Juhkam'
    end

    test 'intinig' do
      assert_contributor_names 'f2e6945', 'Giovanni Intini'
    end

    test 'Intrepidd' do
      assert_contributor_names '9c025ab', 'Adrien Siami'
    end

    test 'Irfy' do
      assert_contributor_names 'a02c607', 'Irfan Adilovic'
    end

    test "isaac\100reuben.com" do
      assert_contributor_names '2402131', 'Isaac Reuben'
    end

    test 'isaacfeliu' do
      assert_contributor_names '9e76b59', 'Isaac Feliu'
    end

    test 'isak' do
      assert_contributor_names '3b9bcf1', 'Andreas Isaksson'
    end

    test 'Ivan' do
      assert_contributor_names 'e838fa0', 'Ivan Korunkov'
    end

    test 'iwiznia' do
      assert_contributor_names '7b6f2a0', 'Ionatan Wiznia'
    end

    test "jackc\100hylesanderson.com" do
      assert_contributor_names '76e4c1a', 'Jack Christensen'
    end

    test 'jacobat' do
      assert_contributor_names '4f59aac', 'Jacob Atzen'
    end

    test 'jacobherrington' do
      assert_contributor_names 'dc27efc', 'Jacob Herrington'
    end

    test 'jacobstr' do
      assert_contributor_names 'cc99580', 'Jacob Straszynski'
    end

    test 'jacortinas' do
      assert_contributor_names '6602fb6', 'Jose Angel Cortinas'
    end

    test 'jacott' do
      assert_contributor_names 'db05478', 'Geoff Jacobsen'
    end

    test 'jafrog' do
      assert_contributor_names 'dd0cae3', 'Irina Bednova'
    end

    test "jakob\100mentalized.net" do
      assert_contributor_names '7aa9eed', 'Jakob Skjerning'
    end

    test 'Jakob S' do
      assert_contributor_names '57098ad', 'Jakob Skjerning'
    end

    test "james.adam\100gmail.com" do
      assert_contributor_names 'd63f6b9', 'James Adam'
    end

    test "james\100grayproductions.net" do
      assert_contributor_names '12ff554', 'James Edward Gray II'
    end

    test "james\100slashetc.com" do
      assert_contributor_names '85bb292', 'James Megquier'
    end

    test 'jamesgolick' do
      assert_contributor_names '083b0b7', 'James Golick'
    end

    test 'jamie' do
      assert_contributor_names '0a79eb7', 'Jamie Hill'
    end

    test "jamie\100bravenet.com" do
      assert_contributor_names 'db9be58', 'Jamie Macey'
    end

    test "jamie\100dang.com" do
      assert_contributor_names 'fddd33b', 'Jamie Orchard-Hays'
    end

    test 'Jamis' do
      assert_contributor_names '9d00b0c', 'Jamis Buck'
    end

    test 'janovetz' do
      assert_contributor_names '31b901a', 'Jake Janovetz'
    end

    test "JanPrill\100blauton.de" do
      assert_contributor_names '36fc181', 'Jan Prill'
    end

    test 'jardeon' do
      assert_contributor_names '43ef688', 'Jared Haworth'
    end

    test 'Jarkko' do
      assert_contributor_names '98306be', 'Jarkko Laine'
    end

    test 'jarkko' do
      assert_contributor_names 'eefe4d0', 'Jarkko Laine'
    end

    test "jarkko\100jlaine.net" do
      assert_contributor_names 'eede40b', 'Jarkko Laine'
    end

    test 'jasl' do
      assert_contributor_names 'ea881ca', 'Jun Jiang'
    end

    test 'Jason' do
      assert_contributor_names '3880ab0', 'Jason Roth'
    end

    test 'Jason Frey (Fryguy)' do
      assert_contributor_names '1d93464', 'Jason Frey'
    end

    test 'jastix' do
      assert_contributor_names 'a1c289d', 'Nikolay Petrachkov'
    end

    test 'jaw6' do
      assert_contributor_names '011e469', 'Joshua Wehner'
    end

    test "jay\100jay.fm" do
      assert_contributor_names 'f5f7beb', 'Jay Levitt'
    end

    test 'Jay Pignata' do
      assert_contributor_names 'b372b4c', 'John Pignata'
    end

    test 'JayK31' do
      assert_contributor_names '50555f3', 'Jason Kaye'
    end

    test 'jbarnette' do
      assert_contributor_names 'e47392b', 'John Barnette'
    end

    test 'jbasdf' do
      assert_contributor_names 'dd27c4e', 'Justin Ball'
    end

    test 'jbbarth' do
      assert_contributor_names '24674b3', 'Jean Baptiste Barth'
    end

    test 'jbsmith86' do
      assert_contributor_names '20f32bb', 'Joel Smith'
    end

    test 'jbwiv' do
      assert_contributor_names 'af2ebb2', 'John Wells'
    end

    test 'jcf' do
      assert_contributor_names '7cc27b7', 'James Conroy-Finn'
    end

    test "jcfischer\100gmail.com" do
      assert_contributor_names '7ad57c4', 'Jens-Christian Fischer'
    end

    test 'jchris' do
      assert_contributor_names '5e677b6', 'Chris Anderson'
    end

    test 'jcoglan' do
      assert_contributor_names 'a7764d8', 'James Coglan'
    end

    test 'Josh <jdeseno@gmail.com>' do
      assert_contributor_names '40e6f437e8', 'Josh Deseno'
    end

    test 'jean.helou' do
      assert_contributor_names 'f756bfb', 'Jean Helou'
    end

    test "jean.helou\100gmail.com" do
      assert_contributor_names 'a3659d5', 'Jean Helou'
    end

    test "Jean-Francois Labbé" do
      assert_contributor_names '90d5a5c2ab', 'Jean-François Labbé'
    end

    test "jean-francois labbe" do
      assert_contributor_names '34916855ca', 'Jean-François Labbé'
    end

    test 'jeanmartin' do
      assert_contributor_names 'c48f744', 'Jan Schwenzien'
    end

    test 'jeem' do
      assert_contributor_names 'cc3183d', 'Jim Hughes'
    end

    test "jeff\100ministrycentered.com" do
      assert_contributor_names 'a5991d8', 'Jeff Berg'
    end

    test "jeff\100opendbms.com" do
      assert_contributor_names '85baf07', 'Jeffrey Moss'
    end

    test 'JEG2' do
      assert_contributor_names 'b4337c2', 'James Edward Gray II'
    end

    test 'jejacks0n' do
      assert_contributor_names 'f55ef82', 'Jeremy Jackson'
    end

    test 'Jeremy Daer (Kemper)' do
      assert_contributor_names '1524c01', 'Jeremy Daer'
    end

    test 'Jeremy Kemper' do
      assert_contributor_names 'bd51bbc', 'Jeremy Daer'
    end

    test "jeremy\100jthopple.com" do
      assert_contributor_names '2e42167', 'Jeremy Hopple'
    end

    test "jeremy\100planetargon.com" do
      assert_contributor_names '58ebf30', 'Jeremy Voorhis'
    end

    test "jeremydurham\100gmail.com" do
      assert_contributor_names '0e146d5', 'Jeremy Durham'
    end

    test "jeremye\100bsa.ca.gov" do
      assert_contributor_names '47b74e6', 'Jeremy Evans'
    end

    test 'jeremyevans' do
      assert_contributor_names '5d1a305', 'Jeremy Evans'
    end

    test "jeremyevans0\100gmail.com" do
      assert_contributor_names '02d3444', 'Jeremy Evans'
    end

    test 'jeremymcanally' do
      assert_contributor_names 'b564d7e', 'Jeremy McAnally'
    end

    test 'jeremymcnally' do
      assert_contributor_names 'a79ac12', 'Jeremy McAnally'
    end

    test 'jeroeningen' do
      assert_contributor_names '2e379c1', 'Jeroen van Ingen'
    end

    test 'jerome' do
      assert_contributor_names 'aa4af60', 'Jérôme Lipowicz'
    end

    test "jerrett\100bravenet.com" do
      assert_contributor_names '942132b', 'Jerrett Taylor'
    end

    test 'JESii' do
      assert_contributor_names 'f7626ea', 'Jon Seidel'
    end

    test "jessemerriman\100warpmail.net" do
      assert_contributor_names '04d2d5f', 'Jesse Merriman'
    end

    test 'jferris' do
      assert_contributor_names 'd8b67f7', 'Joe Ferris'
    end

    test 'jgarber' do
      assert_contributor_names '3c6b7a2', 'Jason Garber'
    end

    test "jhosteny\100mac.com" do
      assert_contributor_names '9f1b577', 'Joseph Hosteny'
    end

    test "jimw\100mysql.com" do
      assert_contributor_names '68b9097', 'Jim Winstead'
    end

    test 'jkit' do
      assert_contributor_names '96557eb', 'J Kittiyachavalit'
    end

    test 'jlindley' do
      assert_contributor_names 'd0bc724', 'James Lindley'
    end

    test "jmartin\100desertflood.com" do
      assert_contributor_names '2876efb', 'Joseph A. Martin'
    end

    test "jmckible\100gmail.com" do
      assert_contributor_names '12ab93b', 'Jordan McKible'
    end

    test 'jmettraux' do
      assert_contributor_names 'bafd698', 'John Mettraux'
    end

    test "joe\100mjg2.com" do
      assert_contributor_names 'c4f1979', 'Joe Goldwasser'
    end

    test 'Joe Dupuis' do
      assert_contributor_names 'fc839e980b', 'Joé Dupuis'
    end

    test 'joeellis' do
      assert_contributor_names '8e0f49e', 'Joe Ellis'
    end

    test "joergd\100pobox.com" do
      assert_contributor_names 'efaf2af', 'Joerg Diekmann'
    end

    test 'joerichsen' do
      assert_contributor_names '083b0b7', 'Jørgen Orehøj Erichsen'
    end

    test "johan\100johansorensen.com" do
      assert_contributor_names 'c42cd3c', 'Johan Sørensen'
    end

    test 'Johan Sorensen' do
      assert_contributor_names '998ab50', 'Johan Sørensen'
    end

    test 'Johan Sörensen' do
      assert_contributor_names '14edaa1', 'Johan Sørensen'
    end

    test "johan\100textdrive.com" do
      assert_contributor_names '3fec943', 'Johan Sørensen'
    end

    test 'John J Wang' do
      assert_contributor_names '4033c50', 'John J. Wang'
    end

    test 'johnb' do
      assert_contributor_names '5e94f05', 'John Barton'
    end

    test 'johndouthat' do
      assert_contributor_names '4250cca', 'John F. Douthat'
    end

    test 'johnnyb' do
      assert_contributor_names '2be3a33', 'Jonathan Bartlett'
    end

    test 'joker1007' do
      assert_contributor_names 'edd93a5', 'Tomohiro Hashidate'
    end

    test "jon\100blankpad.net" do
      assert_contributor_names '35d3ede', 'Jon Wood'
    end

    test "jon\100burningbush.us" do
      assert_contributor_names 'e234115', 'Jon Moses'
    end

    test "jon.evans\100pobox.com" do
      assert_contributor_names '52c9ad4', 'Jon Evans'
    end

    test "jon\100instance-design.co.uk" do
      assert_contributor_names '97adfda', 'Jon Wood'
    end

    test "jon\100siliconcircus.com" do
      assert_contributor_names '4d9ca4d', 'Jon Bright'
    end

    test "jonathan\100bluewire.net.nz" do
      assert_contributor_names '1aff68d', 'Jonathan Viney'
    end

    test "jonathan\100daikini.com" do
      assert_contributor_names '7bfca7e', 'Jonathan Younger'
    end

    test 'jonnii' do
      assert_contributor_names '46ebbcd', 'Jonathan Goldman'
    end

    test 'joost' do
      assert_contributor_names '6b018e3', 'Joost Baaij'
    end

    test 'jordanstaub' do
      assert_contributor_names 'cfe731c', 'Jordan Staub'
    end

    test 'jordi' do
      assert_contributor_names '8a5a9dc', 'Jordi Bunster'
    end

    test "Jose' Valim" do
      assert_contributor_names 'c2e7851', 'José Valim'
    end

    test 'josevalim' do
      assert_contributor_names '8d0b4fa', 'José Valim'
    end

    test 'josh' do
      assert_contributor_names 'd81ac8d', 'Josh Peek'
    end

    test 'Josh' do
      assert_contributor_names '903dcef', 'Josh Peek', 'David Heinemeier Hansson'
    end

    test "Josh <josh\100josh.mn>" do
      assert_contributor_names 'ba3ef762fc', 'Josh Brody'
    end

    test "josh\100hasmanythrough.com" do
      assert_contributor_names '70577d0', 'Josh Susser'
    end

    test "josh\100joshpeek.com" do
      assert_contributor_names '8085cbf', 'Josh Peek'
    end

    test "josh.starcher\100gmail.com" do
      assert_contributor_names 'edb4208', 'Josh Starcher'
    end

    test "joshknowles\100gmail.com" do
      assert_contributor_names 'e9681eb', 'Josh Knowles'
    end

    test 'joshpeek' do
      assert_contributor_names 'c57c721', 'Josh Peek'
    end

    test 'Joshua Peek' do
      assert_contributor_names 'e0846c8', 'Josh Peek'
    end

    test "jp.bougie\100gmail.com" do
      assert_contributor_names '7581193', 'Jean-Philippe Bougie'
    end

    test "jpd800" do
      assert_contributor_names 'cb66f19', 'Jacob Duffy'
    end

    test 'jqr' do
      assert_contributor_names '3028ca5', 'Elijah Miller'
    end

    test 'jramirez' do
      assert_contributor_names 'bcb47a8', 'Javier Ramírez'
    end

    test 'jsgarvin' do
      assert_contributor_names '38deb0e', 'Jonathan Garvin'
    end

    test 'jsheets' do
      assert_contributor_names '83a21f7', 'John Sheets'
    end

    test 'jsierles' do
      assert_contributor_names '3f336ad', 'Joshua Sierles'
    end

    test "jsolson\100damogran.org" do
      assert_contributor_names 'ce0653b', 'Jon Olson'
    end

    test 'jstewart' do
      assert_contributor_names 'cf2ee14', 'Jason Stewart'
    end

    test "jstirk\100oobleyboo.com" do
      assert_contributor_names 'a150687', 'Jason Stirk'
    end

    test 'jstrachan' do
      assert_contributor_names '0c96060', 'James Strachan'
    end

    test 'juan david pastas' do
      assert_contributor_names 'dbf78b0', 'Juan David Pastas'
    end

    test 'juandebravo' do
      assert_contributor_names 'ed4bde5', 'Juan De Bravo'
    end

    test 'JuanitoFatas' do
      assert_contributor_names 'cd0d649', 'Juanito Fatas'
    end

    test 'juanjo.bazan' do
      assert_contributor_names '3280a6e', 'Juanjo Bazán'
    end

    test 'Juanjo Bazan' do
      assert_contributor_names '5e83612', 'Juanjo Bazán'
    end

    test 'Jude Arasu' do
      assert_contributor_names 'c22989d', 'Thillai Arasu'
    end

    test 'JudeArasu' do
      assert_contributor_names 'db20780', 'Thillai Arasu'
    end

    test 'jugend' do
      assert_contributor_names '50253ed', 'Herryanto Siatono'
    end

    test 'Julia Lopez' do
      assert_contributor_names '5e46f4ccb4', 'Julia López'
    end

    test 'julik' do
      assert_contributor_names 'f756bfb', 'Julian Tarkhanov'
    end

    test "justin\100aspect.net" do
      assert_contributor_names '21d50e4', 'Justin Mecham'
    end

    test 'justinfrench' do
      assert_contributor_names 'b2eca73', 'Justin French'
    end

    test 'jvoorhis' do
      assert_contributor_names '6a13376', 'Jeremy Voorhis'
    end

    test 'jwarwick' do
      assert_contributor_names 'a85caaa', 'John Warwick'
    end

    test 'jweiss' do
      assert_contributor_names '9e1d506', 'Jonathan Weiss'
    end

    test 'jwilger' do
      assert_contributor_names 'd0ff4ec', 'John Wilger'
    end

    test 'jzw' do
      assert_contributor_names '5ab94b2', 'Zac Williams'
    end

    test "k\100v2studio.com" do
      assert_contributor_names '426fa08', 'Caio Chassot'
    end

    test "kajism\100yahoo.com" do
      assert_contributor_names '40762a4', 'Karel Miarka'
    end

    test 'kamal' do
      assert_contributor_names '67442cb', 'Kamal Fariz Mahyuddin'
    end

    test 'kamk' do
      assert_contributor_names 'd0df7f2', 'Kamil Kukura'
    end

    test 'kampers' do
      assert_contributor_names 'f000028', 'Chris Kampmeier'
    end

    test 'Kane' do
      assert_contributor_names 'cf9f361', 'Andreas Wurm'
    end

    test 'kane' do
      assert_contributor_names '09a23d2', 'Andreas Wurm'
    end

    test "kanis\100comcard.de" do
      assert_contributor_names '6650da4', 'Lars Kanis'
    end

    test 'karanarora' do
      assert_contributor_names '5415230', 'Karan Arora'
    end

    test 'Karel Minarik' do
      assert_contributor_names 'ee7487e', 'Karel Minařík'
    end

    test 'kares' do
      assert_contributor_names '5dbd6b5', 'Karol Bucek'
    end

    test 'karmi' do
      assert_contributor_names '4185fb1', 'Karel Minařík'
    end

    test 'kasper' do
      assert_contributor_names '42728c7', 'Sergey Karpesh'
    end

    test 'kaygee' do
      assert_contributor_names '6509ceb', 'Keith Gautreaux'
    end

    test "kazuhiko\100fdiary.net" do
      assert_contributor_names '8e78e93', 'Kazuhiko Shiozaki'
    end

    test 'KD' do
      assert_contributor_names '1333994', 'Kuldeep Aggarwal'
    end

    test "keegan\100thebasement.org" do
      assert_contributor_names '491b4a3', 'Keegan Quinn'
    end

    test 'keepcosmos' do
      assert_contributor_names 'ca86c9e', 'Jaehyun Shin'
    end

    test 'kei' do
      assert_contributor_names 'e1f8ec5', 'Kei Shiratsuchi'
    end

    test "keithm\100infused.org" do
      assert_contributor_names '70f4a92', 'Keith Morrison'
    end

    test "ken.barker\100gmail.com" do
      assert_contributor_names '34cbf15', 'Ken Barker'
    end

    test "kenneth.miller\100bitfield.net" do
      assert_contributor_names '9c24899', 'Ken Miller'
    end

    test "kennethkunz\100gmail.com" do
      assert_contributor_names 'cb62f06', 'Ken Kunz'
    end

    test 'kennyj' do
      assert_contributor_names 'bb80a87', 'Toshinori Kajihara'
    end

    test 'kenta-s' do
      assert_contributor_names '85119f5', 'kenta-s'
    end

    test 'kevcha' do
      assert_contributor_names 'b523b5a', 'Kevin Chavanne'
    end

    test "kevin.clark\100gmail.com" do
      assert_contributor_names '767eaa9', 'Kevin Clark'
    end

    test "kevin.clark\100gmal.com" do
      assert_contributor_names 'b98684c', 'Kevin Clark'
    end

    test "Kevin Clark kevin.clark\100gmail.com" do
      assert_contributor_names '7252666', 'Kevin Clark'
    end

    test 'Kevin Deisz' do
      assert_contributor_names '812e904', 'Kevin Newton'
    end

    test "kevwil\100gmail.com" do
      assert_contributor_names '080e169', 'Kevin Williams'
    end

    test 'kgorin' do
      assert_contributor_names '10e708c', 'Kirill Gorin'
    end

    test "kim\100tinker.com" do
      assert_contributor_names '060b9b1', 'Kim Shrier'
    end

    test 'Kir' do
      assert_contributor_names '3fb0579', 'Kir Shatrov'
    end

    test 'kitallis' do
      assert_contributor_names 'ea6cc28', 'Akshay Gupta'
    end

    test 'knapo' do
      assert_contributor_names 'e2d90bf', 'Krzysztof Knapik'
    end

    test 'kohnkecomm' do
      assert_contributor_names 'cf6299d', 'kohnkecomm'
    end

    test 'kommen' do
      assert_contributor_names '3cfb894', 'Dieter Komendera'
    end

    test 'kou' do
      assert_contributor_names '24e6cbc', 'Kouhei Sutou'
    end

    test 'Koz' do
      assert_contributor_names '63e9687', 'Michael Koziarski'
    end

    test 'kp' do
      assert_contributor_names '8641de9', 'Keith Payne'
    end

    test 'kris_chambers' do
      assert_contributor_names '274ef21', 'Kristopher Chambers'
    end

    test 'krishna' do
      assert_contributor_names 'bf658a9', 'Krishna Kotecha'
    end

    test 'kuahyeow' do
      assert_contributor_names 'caec639', 'Thong Kuah'
    end

    test 'kubo' do
      assert_contributor_names '8437be3', 'Kubo Takehiro'
    end

    test 'kucaahbe' do
      assert_contributor_names 'b4ae94f', 'Dmitrij Mjakotnyi'
    end

    test 'kishore-mohan' do
      assert_contributor_names 'cf82b2e', 'Kishore Mohan'
    end

    test 'Kym' do
      assert_contributor_names '6a14b01', 'Kym McInerney'
    end

    test "l.francke\100gmx.de" do
      assert_contributor_names '620726f', 'Lars Francke'
    end

    test 'l.guidi' do
      assert_contributor_names '083b0b7', 'Luca Guidi'
    end

    test 'l4u' do
      assert_contributor_names 'e5c95b1', 'Leo Lou'
    end

    test 'Laknath' do
      assert_contributor_names '0149a6e', 'Buddhika Laknath'
    end

    test 'lakshan' do
      assert_contributor_names 'e2d0b0e', 'Lakshan Perera'
    end

    test 'larrylv' do
      assert_contributor_names '939b896', 'Larry Lv'
    end

    test "larrywilliams1\100gmail.com" do
      assert_contributor_names '35b4bdc', 'Larry Williams'
    end

    test 'lars pind' do
      assert_contributor_names '2fa5bf0', 'Lars Pind'
    end

    test 'Lars pind' do
      assert_contributor_names 'ff0b766', 'Lars Pind'
    end

    test "lars\100pind.com" do
      assert_contributor_names 'c350291', 'Lars Pind'
    end

    test "lars\100pinds.com" do
      assert_contributor_names '52d4166', 'Lars Pind'
    end

    test 'laserlemon' do
      assert_contributor_names '02039e9', 'Steve Richert'
    end

    test "laurel\100gorgorg.org" do
      assert_contributor_names '302c23d', 'Laurel Fan'
    end

    test 'laurelfan' do
      assert_contributor_names '71a4f71', 'Laurel Fan'
    end

    test 'laurocaetano' do
      assert_contributor_names 'e87c3da', 'Lauro Caetano'
    end

    test 'lawrence' do
      assert_contributor_names '902533e', 'Lawrence Pit'
    end

    test 'lazyatom' do
      assert_contributor_names 'f1b1af8', 'James Adam'
    end

    test "lee\100omara.ca" do
      assert_contributor_names 'b272100', "Lee O'Mara"
    end

    test 'leikind' do
      assert_contributor_names '8b63dd0', 'Yuri Leikind'
    end

    test 'Leon Bredt' do
      assert_contributor_names '7ebdecf', 'Leon Breedt'
    end

    test 'leprasmurf' do
      assert_contributor_names 'fce92fd', 'Tim Forbes'
    end

    test 'leriksen' do
      assert_contributor_names '951bb84', 'Leif Eriksen'
    end

    test "leroen\100gmail.com" do
      assert_contributor_names '6a6df5f', 'Kjetil Lerøen'
    end

    test 'lest' do
      assert_contributor_names 'ba2d850', 'Sergey Nartimov'
    end

    test 'lholden' do
      assert_contributor_names '19f8bb28', 'Lori Holden'
    end

    test 'libc' do
      assert_contributor_names '9d79e06', 'Eugene Pimenov'
    end

    test 'libin' do
      assert_contributor_names '5c9d430', 'Lebin Sebastian F'
    end

    test 'lifo' do
      assert_contributor_names '826f0bd', 'Pratik Naik'
    end

    test 'lifofifo' do
      assert_contributor_names '19dff14', 'Pratik Naik'
    end

    test 'lihan' do
      assert_contributor_names '36261c8', 'Lihan Li'
    end

    test 'lmarlow' do
      assert_contributor_names '63df6eb', 'Lee Marlow'
    end

    test "lmarlow\100yahoo.com" do
      assert_contributor_names '04d9e94', 'Lee Marlow'
    end

    test 'logylaps' do
      assert_contributor_names 'd38b477', 'Logy Laps'
    end

    test 'loincloth' do
      assert_contributor_names 'b4dd1e6', 'Seth Rasmussen'
    end

    test "lon\100speedymac.com" do
      assert_contributor_names '481d579', 'Lon Baker'
    end

    test 'lorenjohnson' do
      assert_contributor_names '69e4cc6', 'Loren Johnson'
    end

    test 'lotswholetime' do
      assert_contributor_names '8b3f831', 'Mark Van Holstyn'
    end

    test "LouisStAmour\100gmail.com" do
      assert_contributor_names 'b30ccef', 'Louis St-Amour'
    end

    test 'Lourens Naude' do
      assert_contributor_names 'b08c968', 'Lourens Naudé'
    end

    test 'lsylvester' do
      assert_contributor_names '6c57c78', 'Lachlan Sylvester'
    end

    test 'Lucas Caton' do
      assert_contributor_names '2b7a621', 'Lucas Catón'
    end

    test 'Lukasz Sarnacki' do
      assert_contributor_names '0c5ca07', 'Łukasz Sarnacki'
    end

    test 'Lukasz Strzalkowski' do
      assert_contributor_names 'f9b6b86', 'Łukasz Strzałkowski'
    end

    test 'lukeludwig' do
      assert_contributor_names '7c147e9', 'Luke Ludwig'
    end

    test 'lukfugl' do
      assert_contributor_names '2c3ca4c', 'Jacob Fugal'
    end

    test 'lylo' do
      assert_contributor_names '3c0fd44', 'Olly Headey'
    end

    test "m.stienstra\100fngtps.com" do
      assert_contributor_names 'b85c535', 'Manfred Stienstra'
    end

    test 'ma2gedev' do
      assert_contributor_names '6f9baae', 'Takayuki Matsubara'
    end

    test "maceywj\100telus.net" do
      assert_contributor_names 'cb4bd89', 'Jamie Macey'
    end

    test 'maclover7' do
      assert_contributor_names 'bbcbe6e', 'Jon Moss'
    end

    test 'macournoyer' do
      assert_contributor_names '002e73a', 'Marc-André Cournoyer'
    end

    test 'madlep' do
      assert_contributor_names '8e50f0f', 'Julian Doherty'
    end

    test 'madrobby' do
      assert_contributor_names 'cfa31c3', 'Thomas Fuchs'
    end

    test 'maik schmidt' do
      assert_contributor_names 'beff664', 'Maik Schmidt'
    end

    test "mail\100matthewpainter.co.uk" do
      assert_contributor_names 'de5b737', 'Matthew Painter'
    end

    test 'manfred' do
      assert_contributor_names 'd4c24b6', 'Manfred Stienstra'
    end

    test 'Manish shrivastava' do
      assert_contributor_names '6252d0a', 'Manish Shrivastava'
    end

    test 'manish-shrivastava' do
      assert_contributor_names '8145880', 'Manish Shrivastava'
    end

    test 'Manu' do
      assert_contributor_names 'e7e4dee', 'Manu J'
    end

    test 'Marc-Andre Lafortune' do
      assert_contributor_names '819c347', 'Marc-André Lafortune'
    end

    test 'Marcel' do
      assert_contributor_names '89e06ed', 'Marcel Molina Jr.'
    end

    test 'marcel' do
      assert_contributor_names 'a995f42', 'Marcel Molina Jr.'
    end

    test 'Marcel Molina' do
      assert_contributor_names 'ba5591f', 'Marcel Molina Jr.'
    end

    test 'Marcel Molina Jr' do
      assert_contributor_names '4874df1', 'Marcel Molina Jr.'
    end

    test 'Marcel Mollina Jr.' do
      assert_contributor_names '3f049b0', 'Marcel Molina Jr.'
    end

    test 'marcenuc' do
      assert_contributor_names '603ab7d', 'Marcello Nuccio'
    end

    test "marcin\100junkheap.net" do
      assert_contributor_names '4e9bc0f', 'Marcin Szczepański'
    end

    test 'marclove' do
      assert_contributor_names 'ce0653b', 'Marc Love'
    end

    test 'Marcos Tapajos' do
      assert_contributor_names 'be794d8', 'Marcos Tapajós'
    end

    test 'mariozig' do
      assert_contributor_names 'bf044a9', 'Mario Zigliotto'
    end

    test 'Mark Rushakof' do
      assert_contributor_names '8cc4159', 'Mark Rushakoff'
    end

    test 'MarkMT' do
      assert_contributor_names '27da612', 'MarkMT'
    end

    test "mark.imbriaco\100pobox.com" do
      assert_contributor_names '229c0f4', 'Mark Imbriaco'
    end

    test 'markevich' do
      assert_contributor_names '56445c9', 'Slava Markevich'
    end

    test "MarkusQ\100reality.com" do
      assert_contributor_names '3441dfd', 'Markus Roberts'
    end

    test 'Marten' do
      assert_contributor_names '91eaeb2', 'Marten Veldthuis'
    end

    test 'Martin' do
      assert_contributor_names 'e807476', 'Martin Linkhorst'
    end

    test "martin.emde\100gmail.com" do
      assert_contributor_names 'b1257d9', 'Martin Emde'
    end

    test 'Martin Schürrer' do
      assert_contributor_names '6bc24d4', 'Martin Schuerrer'
    end

    test 'masarakki' do
      assert_contributor_names '83b7bf4', 'Masaki Yamada'
    end

    test 'mathie' do
      assert_contributor_names '55b6697', 'Graeme Mathieson'
    end

    test 'mathieuravaux' do
      assert_contributor_names 'fadd1fa', 'Mathieu Ravaux'
    end

    test 'matrix9180' do
      assert_contributor_names '8352287', 'Chad Ingram'
    end

    test "mats\100imediatec.co.uk" do
      assert_contributor_names '900afae', 'Mats Persson'
    end

    test 'matt' do
      assert_contributor_names 'e2ce901a', 'Matt Aimonetti'
    end

    test 'Matt B.' do
      assert_contributor_names '97f418c', 'Matt Boehlig'
    end

    test "matt\100mattmargolis.net" do
      assert_contributor_names '883c54a', 'Matt Margolis'
    end

    test 'mattbauer' do
      assert_contributor_names '83c1934', 'Matt Bauer'
    end

    test "matthew\100walker.wattle.id.au" do
      assert_contributor_names '8cdf912', 'Matthew Walker'
    end

    test 'MatthewRudy' do
      assert_contributor_names '7e8aee7', 'Matthew Rudy Jacobs'
    end

    test 'mattly' do
      assert_contributor_names 'd5a93b6', 'Matt Lyon'
    end

    test "\100mattt" do
      assert_contributor_names 'ef91cdd', 'Mattt Thompson'
    end

    test 'Matt Stopa' do
      assert_contributor_names '3c90f7a', 'Matthew Stopa'
    end

    test 'Maxim Chernyak' do
      assert_contributor_names '20685d0', 'Max Chernyak'
    end

    test 'Maxime RETY' do
      assert_contributor_names 'c7e875a', 'Maxime Réty'
    end

    test 'Mehmet Emin İNAÇ' do
      assert_contributor_names 'ca77998', 'Mehmet Emin İNAÇ'
    end

    test 'maximerety' do
      assert_contributor_names 'd0f22a9', 'Maxime Réty'
    end

    test "maznawak\100nerim.net" do
      assert_contributor_names '92473b8', 'Simon Arnaud'
    end

    test 'mazuhl' do
      assert_contributor_names '106b78d', 'Max Mitchell'
    end

    test 'mcmire' do
      assert_contributor_names '0ff0319', 'Elliot Winkler'
    end

    test "mdabney\100cavoksolutions.com" do
      assert_contributor_names '43b6a74fb1', 'Blane Dabney'
    end

    test 'mdeiters' do
      assert_contributor_names 'e59978a', 'Matthew Deiters'
    end

    test "me\100jonnii.com" do
      assert_contributor_names '4793a2f', 'Jonathan Goldman'
    end

    test "me\100julik.nl" do
      assert_contributor_names '2ffc84d', 'Julian Tarkhanov'
    end

    test "me\100mdaines.com" do
      assert_contributor_names '191dfe8', 'Michael Daines'
    end

    test "meadow.nnick\100gmail.com" do
      assert_contributor_names '7c8f3ed', 'Lugovoi Nikolai'
    end

    test "medlar\100medlar.it" do
      assert_contributor_names '5525b79', 'Giovanni Intini'
    end

    test 'mfazekas' do
      assert_contributor_names '341afb6', 'Miklós Fazekas'
    end

    test 'mfoster' do
      assert_contributor_names '5850edf', 'Mark W. Foster'
    end

    test 'mhuffnagle' do
      assert_contributor_names '328ae5b', 'Marc Huffnagle'
    end

    test 'mhutchin' do
      assert_contributor_names '738e906', 'Michael Hutchinson'
    end

    test 'mhw' do
      assert_contributor_names 'c7df5bd6', 'Mark H. Wilkinson'
    end

    test 'mica eked' do
      assert_contributor_names 'd5e3c49', 'Mica Eked'
    end

    test 'Michael A. Schoen' do
      assert_contributor_names '94a1309', 'Michael Schoen'
    end

    test 'Michael Gunderloy' do
      assert_contributor_names '6222ac1', 'Mike Gunderloy'
    end

    test 'Michael S. Klishin' do
      assert_contributor_names 'e21ed3e', 'Michael Klishin'
    end

    test "michael\100schubert" do
      assert_contributor_names '7d6f783', 'Michael Schubert'
    end

    test "michael\100schubert.cx" do
      assert_contributor_names 'fd9c15e', 'Michael Schubert'
    end

    test "michael\100schuerig.de" do
      assert_contributor_names '2abe3d2', 'Michael Schuerig'
    end

    test 'Michael Shuerig' do
      assert_contributor_names '4836c40', 'Michael Schuerig'
    end

    test 'michaelminter' do
      assert_contributor_names '90f7f81', 'Michael Minter'
    end

    test 'Miguel' do
      assert_contributor_names '2e4df2a', 'Miguel Fernández'
    end

    test "mike\100clarkware.com" do
      assert_contributor_names '9f3625d', 'Mike Clark'
    end

    test "mike\100michaeldewey.org" do
      assert_contributor_names '750ca79', 'Michael Dewey'
    end

    test 'mikel' do
      assert_contributor_names '1d5d050', 'Mikel Lindsaar'
    end

    test 'mikeycgto' do
      assert_contributor_names '6df2db3', 'Michael Coyne'
    end

    test 'Miklos Fazekas' do
      assert_contributor_names 'be0875f4', 'Miklós Fazekas'
    end

    test 'Miklos Fazkeas' do
      assert_contributor_names 'fb71fa6', 'Miklós Fazekas'
    end

    test 'mikong' do
      assert_contributor_names '632ab24', 'Michael Galero'
    end

    test 'miloops' do
      assert_contributor_names 'f253e98', 'Emilio Tagua'
    end

    test "minimudboy\100gmail.com" do
      assert_contributor_names '3fb5828', 'Lewis Jubb'
    end

    test 'Mip Earson' do
      assert_contributor_names '4ae1cdd', 'Michael Pearson'
    end

    test 'misfo' do
      assert_contributor_names '7706b57', 'Trent Ogren'
    end

    test 'mislav' do
      assert_contributor_names 'a550d2a', 'Mislav Marohnić'
    end

    test 'Mislav Marohnic' do
      assert_contributor_names '9c0e4de', 'Mislav Marohnić'
    end

    test "mislav\100nippur.irb.hr" do
      assert_contributor_names 'c02d1f7', 'Mislav Marohnić'
    end

    test 'mislaw' do
      assert_contributor_names '73fba4f', 'Mislav Marohnić'
    end

    test "mlaster\100metavillage.com" do
      assert_contributor_names 'de5b737', 'Mike Laster'
    end

    test "mmangino\100elevatedrails.com" do
      assert_contributor_names '3ad1a98', 'Mike Mangino'
    end

    test 'mnaberez' do
      assert_contributor_names '31d3048', 'Mike Naberezny'
    end

    test 'mntj' do
      assert_contributor_names 'cb97312', 'Corey Leveen'
    end

    test 'mo khan' do
      assert_contributor_names '140557e', 'Mo Khan'
    end

    test 'mojombo' do
      assert_contributor_names '928c84b', 'Tom Preston-Werner'
    end

    test 'Molchanov Andrey' do
      assert_contributor_names '37f2674', 'Andrey Molchanov'
    end

    test 'moriq' do
      assert_contributor_names '2876efb', 'Kazuhiro Yoshida'
    end

    test "moriq\100moriq.com" do
      assert_contributor_names 'd4bb22b', 'Kazuhiro Yoshida'
    end

    test 'moro' do
      assert_contributor_names '9a8d583', 'Kyosuke Morohashi'
    end

    test "mortonda\100dgrmm.net" do
      assert_contributor_names '2876efb', 'David Morton'
    end

    test 'moses' do
      assert_contributor_names 'e5b3d4b', 'Moses Hohman'
    end

    test 'mpalmer' do
      assert_contributor_names '2503fd3', 'Matt Palmer'
    end

    test "mpalmer\100hezmatt.org" do
      assert_contributor_names '7767e33', 'Matt Palmer'
    end

    test "mparrish\100pearware.org" do
      assert_contributor_names '5fe0ecc', 'Matt Parrish'
    end

    test 'Mr A' do
      assert_contributor_names '3134605', 'Akshay Vishnoi'
    end

    test 'mrageh' do
      assert_contributor_names '9494855', 'Adam Magan'
    end

    test 'MrBrdo' do
      assert_contributor_names 'bc7c0b5', 'Jan Berdajs'
    end

    test 'mrichman' do
      assert_contributor_names '131acec', 'Mark A. Richman'
    end

    test 'mrj' do
      assert_contributor_names 'ef57b93', 'Mark R. James'
    end

    test "mrj\100bigpond.net.au" do
      assert_contributor_names '95e8740', 'Mark James'
    end

    test 'mrkjlchvz' do
      assert_contributor_names 'e19ce8b', 'mrkjlchvz'
    end

    test 'mroch' do
      assert_contributor_names '81286f8', 'Marshall Roch'
    end

    test 'mtitorenko' do
      assert_contributor_names '74191ed', 'Mark J. Titorenko'
    end

    test 'Muhammad' do
      assert_contributor_names '73fdd4c', 'Muhammad Muhammad Ibrahim'
    end

    test 'murphy' do
      assert_contributor_names 'dcc1549', 'Kornelius Kalnbach'
    end

    test "murphy\100cYcnus.de" do
      assert_contributor_names '71ff705', 'Kornelius Kalnbach'
    end

    test "murpyh\100rubychan.de" do
      assert_contributor_names '5326274', 'Kornelius Kalnbach'
    end

    test 'mutru' do
      assert_contributor_names '00326bb', 'Otto Hilska'
    end

    test 'nachocab' do
      assert_contributor_names '2e8f910', 'Nacho Caballero'
    end

    test 'naffis' do
      assert_contributor_names '1117d73', 'Dave Naffis'
    end

    test 'nate' do
      assert_contributor_names '056ddbd', 'Nathan Kontny'
    end

    test 'NeilW' do
      assert_contributor_names '9f26164', 'Neil Wilson'
    end

    test 'Neodelf' do
      assert_contributor_names 'e0e7047', 'Andrey Molchanov'
    end

    test 'nerdinand' do
      assert_contributor_names '38c833c', 'Ferdinand Niedermann'
    end

    test 'neumayr' do
      assert_contributor_names 'd7b6054', 'Matthias Neumayr'
    end

    test 'Nerian' do
      assert_contributor_names '2ebf47a', 'Gonzalo Rodríguez-Baltanás Díaz'
    end

    test 'neshmi' do
      assert_contributor_names 'e91d7ed', 'Matthew Vincent'
    end

    test 'Nex3' do
      assert_contributor_names '4036fcc', 'Nathan Weizenbaum'
    end

    test 'Nick' do
      assert_contributor_names '37b0b36', 'Nick Sieger'
    end

    test "nick+rails\100ag.arizona.edu" do
      assert_contributor_names '06afb8c', 'Nick Murphy'
    end

    test 'nicksieger' do
      assert_contributor_names '2029b8a', 'Nick Sieger'
    end

    test "nicksieger\100gmail.com" do
      assert_contributor_names '81a6a60', 'Nick Sieger'
    end

    test 'Nicolas Hock Isaza' do
      assert_contributor_names 'ee822f2', 'Nicolás Hock Isaza'
    end

    test "nicolas.pouillard\100gmail.com" do
      assert_contributor_names '8910de6', 'Nicolas Pouillard'
    end

    test 'Nicolas Sanguinetti' do
      assert_contributor_names 'd5d7171', 'Nicolás Sanguinetti'
    end

    test 'nik.kakelin' do
      assert_contributor_names '2bc5e6c', 'Nik Wakelin'
    end

    test 'nik.wakelin' do
      assert_contributor_names '5bf40f7', 'Nik Wakelin'
    end

    test 'Niklas Haeusele' do
      assert_contributor_names 'b086a96', 'Niklas Häusele'
    end

    test "nils\100alumni.rice.edu" do
      assert_contributor_names '64b7c5f', 'Nils Jonsson'
    end

    test 'nilsga' do
      assert_contributor_names 'cb79118', 'Nils-Helge Garli Hegvik'
    end

    test 'nishant-cyro' do
      assert_contributor_names '517caa8', 'Nishant Tuteja'
    end

    test 'nkallen' do
      assert_contributor_names 'c6f2af5', 'Nick Kallen'
    end

    test 'noam' do
      assert_contributor_names 'b64fb30', 'Noam Gagliardi Rabinovich'
    end

    test 'Nobuhiro IMAI' do
      assert_contributor_names 'e535b45', 'Nobuhiro Imai'
    end

    test 'Noemj' do
      assert_contributor_names 'a53935d', 'Olli Rissanen'
    end

    test 'noradio' do
      assert_contributor_names '87b55f5', 'Marcel Molina Jr.'
    end

    test 'norbauer' do
      assert_contributor_names '1caa763', 'Norbauer Inc'
    end

    test 'norbert' do
      assert_contributor_names 'f70b74a', 'Norbert Crombach'
    end

    test "normelton\100gmail.com" do
      assert_contributor_names 'd4c24b6', 'Norman Elton'
    end

    test 'nosolopau' do
      assert_contributor_names '1e1711c', 'Pau'
    end

    test 'notahat' do
      assert_contributor_names '566a369', 'Pete Yandell'
    end

    test 'nov' do
      assert_contributor_names '5476a6a', 'Nobukazu Matake'
    end

    test "nov\100yo.rim.or.jp" do
      assert_contributor_names 'ae0e1a0', 'Nobuhiro Imai'
    end

    test 'ntalbott' do
      assert_contributor_names '5430eb6', 'Nathaniel Talbott'
    end

    test 'nullstyle' do
      assert_contributor_names '79670fb', 'Scott Fleckenstein'
    end

    test "nunemaker\100gmail.com" do
      assert_contributor_names '4defe1a', 'John Nunemaker'
    end

    test 'nzkoz' do
      assert_contributor_names '96557eb', 'Michael Koziarski'
    end

    test 'ObieFernandez' do
      assert_contributor_names 'efaf2af', 'Obie Fernandez'
    end

    test 'obrie' do
      assert_contributor_names '2043513', 'Aaron Pfeifer'
    end

    test 'octopod' do
      assert_contributor_names '0fd9743', 'Chris McGrath'
    end

    test 'ogawaso' do
      assert_contributor_names 'd4d3d05', 'Soichiro Ogawa'
    end

    test 'ogeidix' do
      assert_contributor_names '1ac802f', 'Diego Giorgini'
    end

    test "okkez000\100gmail.com" do
      assert_contributor_names 'a9ed24c', 'okkez'
    end

    test "okuramasafumi" do
      assert_contributor_names "fd205ed", "OKURA Masafumi"
    end

    test "oleg.frolov\100gmail.com" do
      assert_contributor_names 'a288179', 'Oleg Frolov'
    end

    test 'oleganza' do
      assert_contributor_names 'f95ff8d', 'Oleg Andreev'
    end

    test "olivier_ansaldi\100yahoo.com" do
      assert_contributor_names 'f801cd7', 'Olivier Ansaldi'
    end

    test 'Olly Legg' do
      assert_contributor_names '0349278', 'Oliver Legg'
    end

    test "ordwaye\100evergreen.edu" do
      assert_contributor_names 'c29db9f', 'Erik Ordway'
    end

    test 'orta' do
      assert_contributor_names '4c323bc', 'Orta Therox'
    end

    test 'oss92' do
      assert_contributor_names 'b937c24', 'Mohamed Osama'
    end

    test 'outerim' do
      assert_contributor_names '3b6555a', 'Lee Jensen'
    end

    test 'Overbryd' do
      assert_contributor_names '9fb5ee8', 'Lukas Rieder'
    end

    test 'oz' do
      assert_contributor_names '4d4db4c', 'utilum'
    end

    test 'Pablo Ifrán' do
      assert_contributor_names 'c945da5', 'Pablo Ifrán'
    end

    test 'ozzyaaron' do
      assert_contributor_names '837f0ab', 'Aaron Todd'
    end

    test 'packagethief' do
      assert_contributor_names 'f005587', 'Jeffrey Hardy'
    end

    test 'padi' do
      assert_contributor_names 'f55ecc6', 'Marc Rendl Ignacio'
    end

    test 'pager' do
      assert_contributor_names '6a611e1', 'Dmitriy Timokhin'
    end

    test 'palkan' do
      assert_contributor_names '7785871', 'Vladimir Dementyev'
    end

    test 'paranoiase Kang' do
      assert_contributor_names '2773257', 'Sung-hee Kang'
    end

    test "patrick\100lenz.sh" do
      assert_contributor_names '2876efb', 'Patrick Lenz'
    end

    test 'patrick.t.joyce' do
      assert_contributor_names '5ac3a9b', 'Patrick Joyce'
    end

    test "paul\100cnt.org" do
      assert_contributor_names '33cf8f1', 'Paul Smith'
    end

    test "paul\100paulbutcher.com" do
      assert_contributor_names 'ccd32ad', 'Paul Butcher'
    end

    test 'paulccarey' do
      assert_contributor_names '2b2ee22', 'Paul Carey'
    end

    test 'pavlos' do
      assert_contributor_names '6861a1d', 'Paul Hieromnimon'
    end

    test 'pawel2015' do
      assert_contributor_names 'b2bfb07', 'Pawel Janiak'
    end

    test 'pbflinn' do
      assert_contributor_names '690eae7', 'Perry Flinn'
    end

    test 'pburleson' do
      assert_contributor_names '58bf8f4', 'Patrick Burleson'
    end

    test "pburleson\100gmail.com" do
      assert_contributor_names '1ee780b', 'Patrick Burleson'
    end

    test "pdcawley\100bofh.org.uk" do
      assert_contributor_names '9c5591d', 'Piers Cawley'
    end

    test 'pedz' do
      assert_contributor_names 'e4e3df8', 'Perry Smith'
    end

    test 'pelargir' do
      assert_contributor_names '8c2177c', 'Matthew Bass'
    end

    test 'Pelle' do
      assert_contributor_names '53088c4', 'Pelle Braendgaard'
    end

    test 'pelle' do
      assert_contributor_names 'da7f9f5', 'Pelle Braendgaard'
    end

    test "pelletierm\100eastmedia.net" do
      assert_contributor_names '5a9a93d', 'Matt Pelletier'
    end

    test "pergesu\100gmail.com" do
      assert_contributor_names 'befd62c', 'Pat Maddox'
    end

    test "perlguy\100gmail.com" do
      assert_contributor_names 'd0bd3b5', 'Jim Helm'
    end

    test "petermichaux\100gmail.com" do
      assert_contributor_names '8734da9', 'Peter Michaux'
    end

    test 'Peter Jaros' do
      assert_contributor_names 'b947b6eca5', 'Petra Jaros'
    end

    test 'Petrik' do
      assert_contributor_names '9a57cd3', 'Petrik de Heus'
    end

    test 'pezra' do
      assert_contributor_names '860cf2d', 'Peter Williams'
    end

    test 'phallstrom' do
      assert_contributor_names 'a49e7d5', 'Philip Hallstrom'
    end

    test "phil.ross\100gmail.com" do
      assert_contributor_names 'f4f7e75', 'Philip Ross'
    end

    test "philbogle\100gmail.com" do
      assert_contributor_names 'b8a5d398', 'Phil Bogle'
    end

    test 'Philipp Weissensteiner' do
      assert_contributor_names '8102c0d', 'Philipp Weißensteiner'
    end

    test "phillip\100pjbsoftware.com" do
      assert_contributor_names '6cae2b7', 'Phillip J. Birmingham'
    end

    test 'phinze' do
      assert_contributor_names 'd2d7492', 'Paul Hinze'
    end

    test 'phoet' do
      assert_contributor_names 'b6aa70c', 'Peter Schröder'
    end

    test "phurley\100gmail.com" do
      assert_contributor_names '09751e5', 'Patrick Hurley'
    end

    test "piecehealth" do
      assert_contributor_names '1f2d012', 'Zhang Kang'
    end

    test "Kang Zhang" do
      assert_contributor_names '3b814f9', 'Zhang Kang'
    end

    test 'PikachuEXE' do
      assert_contributor_names '7fc3390', 'Leung Ho Kuen'
    end

    test 'piotr' do
      assert_contributor_names '1708a86', 'Piotr Banasik'
    end

    test "piotr\100t-p-l.com" do
      assert_contributor_names '620d3a3', 'Piotr Banasik'
    end

    test 'pivotal' do
      assert_contributor_names 'e710902', 'Pivotal Labs'
    end

    test 'Pivotal  Labs' do
      assert_contributor_names '487758b', 'Pivotal Labs'
    end

    test 'pixeltrix' do
      assert_contributor_names '779db44', 'Andrew White'
    end

    test "pjhyett\100gmail.com" do
      assert_contributor_names '8eaf479', 'PJ Hyett'
    end

    test 'pleax' do
      assert_contributor_names '2dc1402', 'Dmitry Lipovoi'
    end

    test 'pope' do
      assert_contributor_names '4d5b913', 'Tim Pope'
    end

    test 'postmodern' do
      assert_contributor_names 'f9e84a9', 'Hal Brodigan'
    end

    test 'PotatoSalad' do
      assert_contributor_names '083b0b7', 'Andrew Bennett'
    end

    test 'PoTe' do
      assert_contributor_names 'dadfa1e', 'Pablo Astigarraga'
    end

    test 'pragdave' do
      assert_contributor_names '76e4c1a', 'Dave Thomas'
    end

    test 'prakash' do
      assert_contributor_names '8207267', 'Prakash Laxkar'
    end

    test 'prakashmurthy' do
      assert_contributor_names '6b31fd8', 'Prakash Murthy'
    end

    test 'pratik' do
      assert_contributor_names 'dc1166d', 'Pratik Naik'
    end

    test 'Pratik' do
      assert_contributor_names '281edce', 'Pratik Naik'
    end

    test 'printercu' do
      assert_contributor_names '0b7a37a', 'Max Melentiev'
    end

    test "progrium\100gmail.com" do
      assert_contributor_names 'aa7859c', 'Jeff Lindsay'
    end

    test 'protocool' do
      assert_contributor_names '3054971', 'Trevor Squire'
    end

    test 'psq' do
      assert_contributor_names 'c443a61', 'Pascal Belloncle'
    end

    test "pterjan\100mandriva.com" do
      assert_contributor_names '1e216b1', 'Pascal Terjan'
    end

    test "pudeyo\100rpi.com" do
      assert_contributor_names '98898ed', 'Oleg Pudeyev'
    end

    test "purestorm\100ggnore.net" do
      assert_contributor_names 'da675e5', 'Manuel Holtgrewe'
    end

    test 'purp' do
      assert_contributor_names '31e2a2d', 'Jim Meyer'
    end

    test 'pyromaniac' do
      assert_contributor_names '5a4cdf9', 'Arkadiy Zabazhanov'
    end

    test 'queso' do
      assert_contributor_names '5285270', 'Josh Owens'
    end

    test 'raasdnil' do
      assert_contributor_names '3a90e72', 'Mikel Lindsaar'
    end

    test 'rabiedenharn' do
      assert_contributor_names 'ce0653b', 'Rob Biedenharn'
    end

    test 'Radar' do
      assert_contributor_names 'ca94136', 'Ryan Bigg'
    end

    test 'Rafael França' do
      assert_contributor_names 'ee82ce7', 'Rafael Mendonça França'
    end

    test 'raggi' do
      assert_contributor_names '08e9d0d', 'James Tucker'
    end

    test 'RAHUL CHAUDHARI' do
      assert_contributor_names '077dffa', 'Rahul P. Chaudhari'
    end

    test 'Rahul Chaudhari' do
      assert_contributor_names 'dc3f33e', 'Rahul P. Chaudhari'
    end

    test "raidel\100onemail.at" do
      assert_contributor_names '20d27f6', 'Michael Raidel'
    end

    test "rails\10033lc0.net" do
      assert_contributor_names 'b2681cc', 'Eelco Lempsink'
    end

    test "rails\100bencurtis.com" do
      assert_contributor_names '4c966a0', 'Benjamin Curtis'
    end

    test "rails\100electricvisions.com" do
      assert_contributor_names 'ffbaf1c', 'John Oxton'
    end

    test "rails\100jeffcole.net" do
      assert_contributor_names '4793a2f', 'Jeff Cole'
    end

    test "rails\100roetzel.de" do
      assert_contributor_names 'ce0653b', 'David Roetzel'
    end

    test "rails\100tpope.info" do
      assert_contributor_names '74d1512', 'Tim Pope'
    end

    test 'railsbob' do
      assert_contributor_names '80d8608', 'Anup Narkhede'
    end

    test 'RainerBlessing' do
      assert_contributor_names '8b7219b', 'Rainer Blessing'
    end

    test "raphinou\100yahoo.com" do
      assert_contributor_names '7661c2b', 'Raphael Bauduin'
    end

    test 'Raphomet' do
      assert_contributor_names 'b4e5da6', 'Raphael Lee'
    end

    test 'rasputnik' do
      assert_contributor_names 'f22b000', 'Dick Davies'
    end

    test 'ravindra kumar kumawat' do
      assert_contributor_names '8bd064e', 'Ravindra Kumar Kumawat'
    end

    test 'rayners' do
      assert_contributor_names '37a4615', 'David Raynes'
    end

    test 'rcoder' do
      assert_contributor_names '0adcd81', 'Lennon Day-Reynolds'
    end

    test "rdifrango\100captechventures.com" do
      assert_contributor_names '42576ff', 'Ron DiFrango'
    end

    test 'redbeard' do
      assert_contributor_names '0230fc9', 'Tal Rotbart'
    end

    test 'redinger' do
      assert_contributor_names '1d32cec', 'Christopher Redinger'
    end

    test 'regonn' do
      assert_contributor_names '902fef3', 'Kenta Tanoue'
    end

    test 'ReinH' do
      assert_contributor_names 'b30de60', 'Rein Henrichs'
    end

    test 'remvee' do
      assert_contributor_names '66e97c3', "Remco van 't Veer"
    end

    test 'remy' do
      assert_contributor_names 'b2dd357', 'Rémy Coutable'
    end

    test "rephorm\100rephorm.com" do
      assert_contributor_names 'b84a7be', 'Brian Mattern'
    end

    test 'retr0h' do
      assert_contributor_names 'cbdb4aa', 'John Dewey'
    end

    test 'reu' do
      assert_contributor_names '77c099c', 'Rodrigo Navarro'
    end

    test 'revans' do
      assert_contributor_names 'be0c453', 'Robert Evans'
    end

    test 'Rich Olson' do
      assert_contributor_names '9025e5d', 'Rick Olson'
    end

    test 'richcollins' do
      assert_contributor_names '6f559f8', 'Rich Collins'
    end

    test "richcollins\100gmail.com" do
      assert_contributor_names '1d4d037', 'Rich Collins'
    end

    test 'Rick' do
      assert_contributor_names 'e41f489', 'Rick Olson'
    end

    test 'rick' do
      assert_contributor_names '083b0b7', 'Rick Olson'
    end

    test 'Rick Olsen' do
      assert_contributor_names '5b9b904', 'Rick Olson'
    end

    test "rick\100rickbradley.com" do
      assert_contributor_names 'c4233a0', 'Rick Bradley'
    end

    test 'Riley' do
      assert_contributor_names '380800e', 'Riley Lynch'
    end

    test 'rizwanreza' do
      assert_contributor_names 'd1202cf', 'Rizwan Reza'
    end

    test 'rmacklin' do
      assert_contributor_names 'aa1ba9c', 'Richard Macklin'
    end

    test 'rmm5t' do
      assert_contributor_names 'd761ac4', 'Ryan McGeary'
    end

    test 'Rob' do
      assert_contributor_names 'a25296a', 'Rob Anderton'
    end

    test "rob.rasmussen\100gmail.com" do
      assert_contributor_names 'c5d5c4f', 'Rob Rasmussen'
    end

    test "robbat2\100gentoo.org" do
      assert_contributor_names '2a12b56', 'Robin H. Johnson'
    end

    test 'robbyrussell' do
      assert_contributor_names 'e38ad5d', 'Robby Russell'
    end

    test 'Robert Pankowecki (Gavdi)' do
      assert_contributor_names 'e95b5b3', 'Robert Pankowecki'
    end

    test 'RobertZK' do
      assert_contributor_names 'a723519', 'Robert Krzyzanowski'
    end

    test 'robertomiranda' do
      assert_contributor_names 'a316c09', 'Roberto Miranda'
    end

    test 'robinjfisher' do
      assert_contributor_names '8091ed5', 'Robin Fisher'
    end

    test 'rockrep' do
      assert_contributor_names 'f7dbf38', 'Michael Kintzer'
    end

    test 'roderickvd' do
      assert_contributor_names 'b14378c', 'Roderick van Domburg'
    end

    test 'rohit' do
      assert_contributor_names '39cb27b', 'Rohit Arondekar'
    end

    test 'Roman Le Negrate' do
      assert_contributor_names 'a0c677c', 'Roman Le Négrate'
    end

    test 'Roman2K' do
      assert_contributor_names '6ee09b6', 'Roman Le Négrate'
    end

    test 'RomD' do
      assert_contributor_names 'd6ae930', 'Roman Dittert'
    end

    test "ror\100philippeapril.com" do
      assert_contributor_names '62d749a', 'Philippe April'
    end

    test 'Ross Kaffenburger' do
      assert_contributor_names '523f3ba', 'Ross Kaffenberger'
    end

    test 'rpheath' do
      assert_contributor_names '1ab2ff5', 'Ryan Heath'
    end

    test 'rpq' do
      assert_contributor_names '510502e', 'Ramon Quezada'
    end

    test "rramdas\100gmail.com" do
      assert_contributor_names '40c86a7', 'Rodney Ramdas'
    end

    test 'rsanheim' do
      assert_contributor_names 'af43e87', 'Rob Sanheim'
    end

    test "rscottmace\100gmail.com" do
      assert_contributor_names '8e8bf37', 'Scott Mace'
    end

    test 'rsl' do
      assert_contributor_names 'ba342c2', 'Russell Norris'
    end

    test 'RSL' do
      assert_contributor_names '6ccbef5', 'Russell Norris'
    end

    test 'rspeicher' do
      assert_contributor_names '0da754d', 'Robert Speicher'
    end

    test "rtomayko\100gmail.com" do
      assert_contributor_names '9db8f3e', 'Ryan Tomayko'
    end

    test "ruben.nine\100gmail.com" do
      assert_contributor_names '9935a35', 'Ruben Nine'
    end

    test "ruby\100bobsilva.com" do
      assert_contributor_names '231a464', 'Bob Silva'
    end

    test "rubyonrails\100beautifulpixel.com" do
      assert_contributor_names '3fb29b1', 'Alex Wayne'
    end

    test 'RubyRedRick' do
      assert_contributor_names 'bef071d', 'Rick DeNatale'
    end

    test 'rubyruy' do
      assert_contributor_names 'da5d8fa', 'Ruy Asan'
    end

    test 'rusikf' do
      assert_contributor_names '47896b3', 'Ruslan Korolev'
    end

    test 'rwdaigle' do
      assert_contributor_names '9b8399f', 'Ryan Daigle'
    end

    test 'Ryan Davis' do
      assert_contributor_names '2890b96', 'Ryan Davis (zenspider)'
    end

    test 'Ryunosuke Sato' do
      assert_contributor_names 'd022fce', 'Ryunosuke Sato'
    end

    test "ryan.raaum\100gmail.com" do
      assert_contributor_names '0f0d926', 'Ryan Raaum'
    end

    test 'ryanb' do
      assert_contributor_names '9450262', 'Ryan Bates'
    end

    test "ryand-ruby\100zenspider.com" do
      assert_contributor_names 'a2f0ae7', 'Ryan Davis (zenspider)'
    end

    test 'ryepup' do
      assert_contributor_names '2fac5d1', 'Ryan Davis (ryepup)'
    end

    test 'Sachin87' do
      assert_contributor_names 'c176397', 'Sachin Singh'
    end

    test 'saimonmoore' do
      assert_contributor_names 'c1bc61c', 'Simon Moore'
    end

    test 'saksmlz' do
      assert_contributor_names '68307a1', 'Aliaxandr Rahalevich'
    end

    test "sam.kirchmeier\100gmail.com" do
      assert_contributor_names '35b4bdc', 'Sam Kirchmeier'
    end

    test 'Sam Phippen' do
      assert_contributor_names 'eba3618', 'Penelope Phippen'
    end

    test 'Samuel Elliott' do
      assert_contributor_names '31ea83e', 'Sam Elliott'
    end

    test 'Samus_' do
      assert_contributor_names 'b4b6ffe', 'Michael Cetrulo'
    end

    test 'sandofsky' do
      assert_contributor_names '2ba8864', 'Ben Sandofsky'
    end

    test "sandra.metz\100duke.edu" do
      assert_contributor_names '242cd06', 'Sandi Metz'
    end

    test 'sanemat' do
      assert_contributor_names '3b98fb7', 'Murahashi Sanemat Kenichi'
    end

    test 'sblackstone' do
      assert_contributor_names '49f2e6f', 'Stephen Blackstone'
    end

    test 'Schneems' do
      assert_contributor_names 'a8870d1', 'Richard Schneeman'
    end

    test "\100schneems" do
      assert_contributor_names 'ef91cdd', 'Richard Schneeman'
    end

    test 'schneems' do
      assert_contributor_names '921dcc2', 'Richard Schneeman'
    end

    test "schoenm\100earthlink.net" do
      assert_contributor_names '0293c34', 'Michael Schoen'
    end

    test "sco\100scottraymond.net" do
      assert_contributor_names '0925c6b', 'Scott Raymond'
    end

    test "scott\100sigkill.org" do
      assert_contributor_names 'ad24c6d', 'Scott Laird'
    end

    test 'scott_willson' do
      assert_contributor_names 'd64832c', 'Scott Willson'
    end

    test 'ScottSchram' do
      assert_contributor_names 'a0c925c', 'Scott Schram'
    end

    test 'Sen Zhang' do
      assert_contributor_names 'd57356b', 'Sen Zhang'
    end

    test 'scottwillson' do
      assert_contributor_names 'c75cfa0', 'Scott Willson'
    end

    test "sd\100notso.net" do
      assert_contributor_names '35240ba', 'Sebastian Delmont'
    end

    test 'sdsykes' do
      assert_contributor_names '0da2357', 'Stephen Sykes'
    end

    test 'sealocal' do
      assert_contributor_names '27a4e93', 'Mike Taylor'
    end

    test 'Sean Griffin' do
      assert_contributor_names '332c336', 'Siân Griffin'
    end

    test "sean\100ardismg.com" do
      assert_contributor_names '2876efb', 'Sean T Allen'
    end

    test 'seangeo' do
      assert_contributor_names 'c81fff2', 'Sean Geoghegan'
    end

    test 'seanhussey' do
      assert_contributor_names '18a3333', 'Sean Hussey'
    end

    test 'seapy' do
      assert_contributor_names '6c252b5', 'Jeong Changhoon'
    end

    test 'sebastian.kanthak' do
      assert_contributor_names '78a732b', 'Sebastian Kanthak'
    end

    test "sebastian.kanthak\100muehlheim.de" do
      assert_contributor_names 'b1a4f91', 'Sebastian Kanthak'
    end

    test "self\100mattmower.com" do
      assert_contributor_names '9bafd35', 'Matt Mower'
    end

    test 'Semyon Perepelitsa' do
      assert_contributor_names '540ebe3', 'Simon Perepelitsa'
    end

    test "sergeykojin\100gmail.com" do
      assert_contributor_names 'ba5591f', 'Sergey Kojin'
    end

    test 'Sergio Gil Pérez de la Manga' do
      assert_contributor_names 'de178df', 'Sergio Gil'
    end

    test 'sethladd' do
      assert_contributor_names '32b31a2', 'Seth Ladd'
    end

    test 'sgerrand' do
      assert_contributor_names 'f40a3ea', 'Sasha Gerrand'
    end

    test "\100sgrif" do
      assert_contributor_names '2bbcca0', 'Siân Griffin'
    end

    test 'sgrif' do
      assert_contributor_names '92a6033', 'Siân Griffin'
    end

    test 'sh6khan' do
      assert_contributor_names '319baed', 'Sadman Khan'
    end

    test "shimbo\100is.naist.jp" do
      assert_contributor_names '6aaa08d', 'Masashi Shimbo'
    end

    test 'shingo-nakanishi' do
      assert_contributor_names 'd089fe2', 'shingo-nakanishi'
    end

    test 'shioimm' do
      assert_contributor_names 'f5e2d98', 'Misaki Shioi'
    end

    test 'shock_one' do
      assert_contributor_names 'ec1b715', 'Volodymyr Shatsky'
    end

    test 'shtirlic' do
      assert_contributor_names 'c2b79c0', 'Serg Podtynnyi'
    end

    test 'shugo' do
      assert_contributor_names '4699c33', 'Shugo Maeda'
    end

    test "shugo\100ruby-lang.org" do
      assert_contributor_names '21cf3c6', 'Shugo Maeda'
    end

    test 'ShunsukeAida' do
      assert_contributor_names '9982138', 'Shunsuke Aida'
    end

    test 'shunsukeaida' do
      assert_contributor_names '884d123', 'Shunsuke Aida'
    end

    test "shup_d\100cube.(none)" do
      assert_contributor_names '7260852', 'Josh Peek'
    end

    test 'Si' do
      assert_contributor_names '9b24e11', 'Si Jobling'
    end

    test "simon\100redhillconsulting.com.au" do
      assert_contributor_names '2043513', 'Simon Harris'
    end

    test "simon.stapleton\100gmail.com" do
      assert_contributor_names '16e41c6', 'Simon Stapleton'
    end

    test 'simonjefford' do
      assert_contributor_names 'd44ce1c', 'Simon Jefford'
    end

    test 'simply-phi' do
      assert_contributor_names 'ac07da8', 'Ibrahim Abdullah'
    end

    test 'siong1987' do
      assert_contributor_names '5df9d00', 'Teng Siong Ong'
    end

    test 'sjain1107' do
      assert_contributor_names 'c351a82', 'Sakshi Jain'
    end

    test 'sjgman9' do
      assert_contributor_names 'fade31a', 'Sam Granieri'
    end

    test 'skae' do
      assert_contributor_names '5640773', 'Stefan Kaes'
    end

    test 'skaen' do
      assert_contributor_names 'c8b4cf6', 'Stefan Kaes'
    end

    test 'Skaes' do
      assert_contributor_names '689cca1', 'Stefan Kaes'
    end

    test 'skaes' do
      assert_contributor_names 'e3670a0', 'Stefan Kaes'
    end

    test "skaes\100web.de" do
      assert_contributor_names '5d61d23', 'Stefan Kaes'
    end

    test 'skaes.web.de' do
      assert_contributor_names '31ae812', 'Stefan Kaes'
    end

    test 'skanthak' do
      assert_contributor_names '693e0df', 'Sebastian Kanthak'
    end

    test 'slainer68' do
      assert_contributor_names '6241d4e', 'Nicolas Blanco'
    end

    test 'smeade' do
      assert_contributor_names '68849e3', 'Scott Meade'
    end

    test 'snusnu' do
      assert_contributor_names 'ce50c96', 'Martin Gamsjaeger'
    end

    test 'soartec-lab' do
      assert_contributor_names '0fecd26', 'Shodai Suzuki'
    end

    test "solo\100gatelys.com" do
      assert_contributor_names '796a43d', 'Solomon White'
    end

    test "somekool\100gmail.com" do
      assert_contributor_names '4fc6c87', 'Mathieu Jobin'
    end

    test 'sonnym' do
      assert_contributor_names '0950d40', 'Sonny Michaud'
    end

    test 'Spakman' do
      assert_contributor_names 'eede82c', 'Mark Somerville'
    end

    test 'spicycode' do
      assert_contributor_names '8670631', 'Chad Humphries'
    end

    test 'spyhole' do
      assert_contributor_names 'cd31eb1', 'Johnson Wang'
    end

    test 'Squeegy' do
      assert_contributor_names '2b6954a', 'Alex Wayne'
    end

    test 'sshaw' do
      assert_contributor_names 'f9369c0', 'Skye Shaw'
    end

    test "ssinghi\100kreeti.com" do
      assert_contributor_names 'f3aa7c1', 'Surendra Singhi'
    end

    test 'ssoroka' do
      assert_contributor_names '519c5c7', 'Steven Soroka'
    end

    test 'st0012' do
      assert_contributor_names 'e8688dd', 'Stan Lo'
    end

    test 'Stanislav' do
      assert_contributor_names '40f1642', 'Stanislav Sobolev'
    end

    test "starr\100starrnhorne.com" do
      assert_contributor_names 'ebc0a38', 'Starr Horne'
    end

    test 'Stefan' do
      assert_contributor_names 'db7fadd', 'Stefan Kaes'
    end

    test 'stellsmi' do
      assert_contributor_names 'af98d88', 'Jeremy Lightsmith'
    end

    test 'Stephan Kaes' do
      assert_contributor_names '7fe3fd2', 'Stefan Kaes'
    end

    test "stephen\100touset.org" do
      assert_contributor_names '2876efb', 'Stephen Touset'
    end

    test "stephen_purcell\100yahoo.com" do
      assert_contributor_names 'b0a86f8', 'Steve Purcell'
    end

    test "stephenh\100chase3000.com" do
      assert_contributor_names '1a6954a', 'Stephen Haberman'
    end

    test 'steve' do
      assert_contributor_names '60a6284', 'Steven Bristol'
    end

    test 'Steve St. Martin' do
      assert_contributor_names '679a0bf', 'Stephen St. Martin'
    end

    test 'stevenbristol' do
      assert_contributor_names '5af4463', 'Steven Bristol'
    end

    test 'sthollmann' do
      assert_contributor_names '164af1f', 'Stefan Hollmann'
    end

    test "stian\100grytoyr.net" do
      assert_contributor_names '7a6a923', 'Stian Grytøyr'
    end

    test "stlruby\100googlegroups.com" do
      assert_contributor_names 'ee04aea', 'St. Louis Ruby Users Group'
    end

    test 'stopdropandrew' do
      assert_contributor_names '083b0b7', 'Andrew Grim'
    end

    test 'subelsky' do
      assert_contributor_names 'f596dda', 'Mike Subelsky'
    end

    test 'suchasurge' do
      assert_contributor_names 'b99fb66', 'Frank Müller'
    end

    test 'Sudara' do
      assert_contributor_names 'e848ab5', 'Sudara Williams'
    end

    test 'sue445' do
      assert_contributor_names 'a913af9', 'Go Sueyoshi'
    end

    test 'SUGINO Yasuhiro' do
      assert_contributor_names '4a36eb6', 'Sugino Yasuhiro'
    end

    test 'suginoy' do
      assert_contributor_names '4f6f433', 'Sugino Yasuhiro'
    end

    test 'Sunny' do
      assert_contributor_names 'ce40df2', 'Sunny Ripert'
    end

    test 'stve' do
      assert_contributor_names 'e80d9f4', 'Steve Agalloco'
    end

    test 'sur' do
      assert_contributor_names '8b2a601', 'Sur Max'
    end

    test 'sveiss' do
      assert_contributor_names 'b3b0a0c', 'Stephen Veiss'
    end

    test "sveit\100tradeharbor.com" do
      assert_contributor_names '3398f74', 'Stephen Veit'
    end

    test "sabrams86" do
      assert_contributor_names '95f4d75', 'Steven Abrams'
    end

    test "sven\100c3d2.de" do
      assert_contributor_names '4b3e964', 'Sven Klemm'
    end

    test 'Sven Kraeuter | 5v3n' do
      assert_contributor_names 'a1c7b0e', 'Sven Kräuter'
    end

    test 'swapdisc' do
      assert_contributor_names '5105b89', 'Joe Lewis'
    end

    test "t.lucas\100toolmantim.com" do
      assert_contributor_names '6a83ebf', 'Tim Lucas'
    end

    test 'Tadas Tamosauskas' do
      assert_contributor_names 'f292f09', 'Tadas Tamošauskas'
    end

    test 'tagoh' do
      assert_contributor_names 'c554a9c', 'Akira Tagoh'
    end

    test "takiuchi\100drecom.co.jp" do
      assert_contributor_names '06411f4', 'Genki Takiuchi'
    end

    test 'takkanm' do
      assert_contributor_names 'fa1ea34' ,'Mitsutaka Mimura'
    end

    test 'takmar' do
      assert_contributor_names 'ea49d27' ,'Takuma Yoshida'
    end

    test 'Takuma' do
      assert_contributor_names 'de39164' ,'Takuma Yoshida'
    end

    test 'tank-bohr' do
      assert_contributor_names 'f3101fd', 'Alexey Nikitin'
    end

    test 'tanmay3011' do
      assert_contributor_names '2e51d6f', 'Tanmay Sinha'
    end

    test 'tarmo' do
      assert_contributor_names 'fd3f048', 'Tarmo Tänav'
    end

    test 'tarmo_t' do
      assert_contributor_names '6b1901d', 'Tarmo Tänav'
    end

    test 'taryn' do
      assert_contributor_names 'ce61a6b', 'Taryn East'
    end

    test 'tashian' do
      assert_contributor_names 'e95b965', 'Carl Tashian'
    end

    test 'technomancy' do
      assert_contributor_names '673daea', 'Phil Hagelberg'
    end

    test "technomancy\100gmail.com" do
      assert_contributor_names 'f1a350a', 'Phil Hagelberg'
    end

    test "technoweenie\100gmail.com" do
      assert_contributor_names 'df7a4d4', 'Rick Olson'
    end

    test 'Tekin' do
      assert_contributor_names 'd7c2e52', 'Tekin Suleyman'
    end

    test 'Teo Hui Ming' do
      assert_contributor_names 'b307210', 'Huiming Teo'
    end

    test 'thechrisoshow' do
      assert_contributor_names '5a5b0b8', "Chris O'Sullivan"
    end

    test 'theflow' do
      assert_contributor_names '63e9687', 'Florian Munz'
    end

    test 'thenickcox' do
      assert_contributor_names '431b236', 'Nick Cox'
    end

    test 'Theory' do
      assert_contributor_names '38deb0e', 'David E. Wheeler'
    end

    test 'thewoolleyman' do
      assert_contributor_names '2bfd677', 'Chad Woolley'
    end

    test 'thiagoaugusto' do
      assert_contributor_names '361f1bc', 'Thiago Augusto'
    end

    test "thijs\100fngtps.com" do
      assert_contributor_names '7864d0e', 'Thijs van der Vossen'
    end

    test "thijs\100vandervossen.net" do
      assert_contributor_names '74896c0', 'Thijs van der Vossen'
    end

    test 'thijsv' do
      assert_contributor_names '15b1b88', 'Thijs van der Vossen'
    end

    test 'thoefer' do
      assert_contributor_names '1863f12', 'Tom Hoefer'
    end

    test "thomas\100columbus.rr.com" do
      assert_contributor_names '3553b59', 'Tom Lieber'
    end

    test "thomas\100fesch.at" do
      assert_contributor_names '7d01005', 'Thomas Fuchs'
    end

    test "tietew\100tietew.net" do
      assert_contributor_names '3080b27', 'Tietew'
    end

    test 'timc' do
      assert_contributor_names 'd4b6671', 'Tim Carpenter'
    end

    test "timct\100mac.com" do
      assert_contributor_names '0d52abf', 'Tim Trautmann'
    end

    test 'Time Pope' do
      assert_contributor_names 'e2ad603', 'Tim Pope'
    end

    test 'Timm' do
      assert_contributor_names 'ff1b7e7', 'Kasper Timm Hansen'
    end

    test 'Tima Maslyuchenko' do
      assert_contributor_names '633ea6a', 'Tim Masliuchenko'
    end

    test 'tinogomes' do
      assert_contributor_names '5121593', 'Celestino Gomes'
    end

    test 'tleneveu' do
      assert_contributor_names '3d22686', 'Thibaut Leneveu'
    end

    test 'tmacedo' do
      assert_contributor_names '1370d15', 'Tiago Macedo'
    end

    test "tmornini\100infomania.com" do
      assert_contributor_names '311342d', 'Tom Mornini'
    end

    test 'tnp' do
      assert_contributor_names 'bdba748', 'Troels Petersen'
    end

    test 'Tobias Luekte' do
      assert_contributor_names 'f1880ca', 'Tobias Lütke'
    end

    test 'Tobias Luetke' do
      assert_contributor_names '553c23d', 'Tobias Lütke'
    end

    test 'TobiasLuetke' do
      assert_contributor_names 'd4e02f7', 'Tobias Lütke'
    end

    test 'toby cabot' do
      assert_contributor_names 'bdfddb0', 'Toby Cabot'
    end

    test 'todd' do
      assert_contributor_names 'a7a1c4e', 'Todd Gehman'
    end

    test "todd\100robotcoop.com" do
      assert_contributor_names '45ee71a', 'Todd Gehman'
    end

    test "tom\100craz8.com" do
      assert_contributor_names '838ec41', 'Tom Fakes'
    end

    test "tom.enebo\100gmail.com" do
      assert_contributor_names 'fc04243', 'Thomas Enebo'
    end

    test "tom\100moertel.com" do
      assert_contributor_names '43c470f', 'Tom Moertel'
    end

    test "tom\100popdog.net" do
      assert_contributor_names '5779deb', 'Tom Ward'
    end

    test 'Tom ward' do
      assert_contributor_names '0555fc9', 'Tom Ward'
    end

    test 'tomafro' do
      assert_contributor_names 'ccb87e2', 'Tom Ward'
    end

    test 'tomhuda' do
      assert_contributor_names '00be5bd', 'Yehuda Katz', 'Tom Dale'
    end

    test 'TomK32' do
      assert_contributor_names '235cd21', 'Thomas R. Koll'
    end

    test 'Toshimaru' do
      assert_contributor_names 'd9ff835', 'Toshimaru'
    end

    test 'tomtoday' do
      assert_contributor_names 'b1aa674', 'Tom Brice'
    end

    test "tomtoday\100gmail.com" do
      assert_contributor_names '5f4f4b0', 'Tom Brice'
    end

    test 'toolmantim' do
      assert_contributor_names '4a8d3d5', 'Tim Lucas'
    end

    test 'topfunky' do
      assert_contributor_names '2a08c45', 'Geoffrey Grosenbach'
    end

    test 'tpope' do
      assert_contributor_names 'e522f75', 'Tim Pope'
    end

    test 'trans' do
      assert_contributor_names 'c9d4335', 'Thomas Sawyer'
    end

    test 'trek' do
      assert_contributor_names '083b0b7', 'Trek Glowacki'
    end

    test 'tsukasaoishi' do
      assert_contributor_names '4e83815', 'Tsukasa OISHI'
    end

    test "turnip\100turnipspatch.com" do
      assert_contributor_names '8e3bf70', 'Jonathan Leighton'
    end

    test 'Tuxie' do
      assert_contributor_names '3c877ec', 'Per Wigren'
    end

    test "tuxie\100dekadance.se" do
      assert_contributor_names '813a8b9', 'Per Wigren'
    end

    test 'twinturbo' do
      assert_contributor_names 'dee375a', 'Adam Hawkins'
    end

    test "twoggle\100gmail.com" do
      assert_contributor_names '8b8a30d', 'Tim Fletcher'
    end

    test "tyler\100kianta.com" do
      assert_contributor_names 'c0f84b1', 'Tyler Kiley'
    end

    test "tyler.kovacs\100gmail.com" do
      assert_contributor_names '5b3bc31', 'Tyler Kovacs'
    end

    test 'tzaharia' do
      assert_contributor_names '8ff92e2', 'Tieg Zaharia'
    end

    test 'Ugis Ozols' do
      assert_contributor_names '3ca1bc3', 'Uģis Ozols'
    end

    test 'Ulysses' do
      assert_contributor_names 'c6ea1d3', 'Nicholas Seckar'
    end

    test 'vanderhoop' do
      assert_contributor_names 'b345fc2', 'Travis Vander Hoop'
    end

    test 'vertigoclinic' do
      assert_contributor_names '9aa8174', 'Greg Miller'
    end

    test "victor-ronr-trac\100carotena.net" do
      assert_contributor_names '473e5bd', 'Victor Jalencas'
    end

    test 'vijay' do
      assert_contributor_names '8000719', 'Vijay Dev'
    end

    test "vinbarnes\100gmail.com" do
      assert_contributor_names '18e2188', 'Kevin Barnes'
    end

    test 'virusman' do
      assert_contributor_names '921305b', 'Victor Babenko'
    end

    test 'vitaly' do
      assert_contributor_names '762fc54', 'Vitaly Kushner'
    end

    test 'vladr' do
      assert_contributor_names '8091ed5', 'Vlad Romascanu'
    end

    test 'WAKASUGI 5T111111' do
      assert_contributor_names '0176aef', 'Hirofumi Wakasugi'
    end

    test 'wallerjake' do
      assert_contributor_names '9bc4eb7e', 'Jake Waller'
    end

    test 'wangchun' do
      assert_contributor_names 'c6a3a39', 'Wang Chun'
    end

    test 'wangjohn' do
      assert_contributor_names '3182295', 'John J. Wang'
    end

    test 'watson' do
      assert_contributor_names 'defb4d0', 'Thomas Watson Steen'
    end

    test 'watsonian' do
      assert_contributor_names 'edd59b7', 'Joel Watson'
    end

    test "wbruce\100gmail.com" do
      assert_contributor_names 'df70e28', 'Bruce Williams'
    end

    test "wejn\100box.cz" do
      assert_contributor_names '88bb279', 'Michal Šafránek'
    end

    test 'wesley.moxam' do
      assert_contributor_names 'e781fad', 'Wesley Moxam'
    end

    test 'weyus' do
      assert_contributor_names '3122d32', 'Wes Gamble'
    end

    test 'wharris' do
      assert_contributor_names 'b18585f', 'Will Harris'
    end

    test 'wildchild' do
      assert_contributor_names '65539c9', 'Alexander Uvarov'
    end

    test 'Will' do
      assert_contributor_names 'b1bbf90', 'Will Bryant'
    end

    test 'will.bryant' do
      assert_contributor_names 'c1abe44', 'Will Bryant'
    end

    test 'willnet' do
      assert_contributor_names '11d41c6', 'Shinichi Maeshima'
    end

    test 'wilson' do
      assert_contributor_names '11d2a30', 'Wilson Bilkovich'
    end

    test "wilsonb\100gmail.com" do
      assert_contributor_names '584bec9', 'Wilson Bilkovich'
    end

    test 'windock' do
      assert_contributor_names '6feffe5', 'Andrew Shcheglov'
    end

    test 'wingfire' do
      assert_contributor_names 'a9f2c12', 'Christof Spies'
    end

    test 'Winston' do
      assert_contributor_names 'b52c66f', 'Winston Teo Yong Wei'
    end

    test 'Wintermute' do
      assert_contributor_names '7ec91d4', 'Dave Murphy'
    end

    test 'Wizard' do
      assert_contributor_names '07f92e8', 'Melih Arda Yalçiner'
    end

    test 'wmoxam' do
      assert_contributor_names '91c14e9', 'Wesley Moxam'
    end

    test "wolfgang\100stufenlos.net" do
      assert_contributor_names 'affe7c0', 'Wolfgang Klinger'
    end

    test "work\100ashleymoran.me.uk" do
      assert_contributor_names '2a12b56', 'Ashley Moran'
    end

    test 'wycats' do
      assert_contributor_names 'fd15359', 'Yehuda Katz'
    end

    test 'wynksaiddestroy' do
      assert_contributor_names 'c4861cc', 'Fabian Winkler'
    end

    test 'xal' do
      assert_contributor_names '0ceab81', 'Tobias Lütke'
    end

    test 'xavier' do
      assert_contributor_names '083b0b7', 'Xavier Defrang'
    end

    test 'xaviershay' do
      assert_contributor_names '569a78c', 'Xavier Shay'
    end

    test 'Xenda' do
      assert_contributor_names 'fabd2ce', 'Alessandra Pereyra'
    end

    test "xyctka\100gmail.com" do
      assert_contributor_names '5890ced', 'Vitalii Khustochka'
    end

    test 'Yamada Masaki' do
      assert_contributor_names 'f498000', 'Masaki Yamada'
    end

    test 'YanhaoYang' do
      assert_contributor_names '2f35f61', 'Yanhao Yang'
    end

    test 'Yasuhiko Katoh (y@su)' do
      assert_contributor_names '539d929', 'Yasuhiko Katoh'
    end

    test 'yhirano55' do
      assert_contributor_names '5af7d47', 'Yoshiyuki Hirano'
    end

    test 'ymendel' do
      assert_contributor_names '173e2d2', 'Yossef Mendelssohn'
    end

    test 'yob' do
      assert_contributor_names '656a20a', 'James Healy'
    end

    test 'yon' do
      assert_contributor_names '2f25413', 'Yonatan Feldman'
    end

    test "yon\100milliped.com" do
      assert_contributor_names '908e9a1', 'Yonatan Feldman'
    end

    test "yrashk\100fp.org.ua" do
      assert_contributor_names '2ad8dc6', 'Yurii Rashkovskii'
    end

    test "yrashk\100gmail.com" do
      assert_contributor_names 'f3e5e07', 'Yurii Rashkovskii'
    end

    test 'ysbaddaden' do
      assert_contributor_names 'b0f2b94', 'Julien Portalier'
    end

    test 'yuki3738' do
      assert_contributor_names '17bb531', 'Yuki Minamiya'
    end

    test 'yuuji.yaginuma' do
      assert_contributor_names '4fded7c', 'Yuuji Yaginuma'
    end

    test 'Yuji Yaginuma' do
      assert_contributor_names 'fbd33b9', 'Yuuji Yaginuma'
    end

    test 'yury' do
      assert_contributor_names '3df90de', 'Yury Korolev'
    end

    test 'yyyc514' do
      assert_contributor_names 'dad3e83', 'Josh Goebel'
    end

    test "z\100wzph.com" do
      assert_contributor_names 'd9839c1', 'Zachary Holt'
    end

    test 'zackchandler' do
      assert_contributor_names 'd6f6a41', 'Zack Chandler'
    end

    test "zaitzow\100gmail.com" do
      assert_contributor_names '08fd13d', 'August Zaitzow Flatby'
    end

    test 'Zamith' do
      assert_contributor_names '6f418a0', 'Luís Ferreira'
    end

    test 'zapnap' do
      assert_contributor_names '096f3f6', 'Nick Plante'
    end

    test 'zdennis' do
      assert_contributor_names '57cde63', 'Zach Dennis'
    end

    test 'zenspider' do
      assert_contributor_names 'a86e594', 'Ryan Davis (zenspider)'
    end

    test 'zhengjia' do
      assert_contributor_names '55759a6', 'Zheng Jia'
    end

    test 'zires' do
      assert_contributor_names '35f38b7', 'Thierry Zires'
    end

    test "zraii\100comcast.net" do
      assert_contributor_names '9d8e348', 'Martin Emde'
    end

    test 'Zachary Scott' do
      assert_contributor_names '3cfbee6', 'zzak'
    end

    test 'zsombor' do
      assert_contributor_names '2227a17', 'Dee Zsombor'
    end

    test 'प्रथमेश' do
      assert_contributor_names '41739a2', 'Prathamesh Sonpatki'
    end

    test 'प्रथमेश Sonpatki' do
      assert_contributor_names 'a7a2bc0f66', 'Prathamesh Sonpatki'
    end
  end
end

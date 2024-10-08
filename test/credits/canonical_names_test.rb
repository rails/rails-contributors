require 'test_helper'

module Credits
  class CanonicalNamesTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'タコ焼き仮面' do
      assert_contributor_names '84403ae0', 'Takoyaki Kamen'
    end

    test '松田 明' do
      assert_contributor_names 'bb33432b', 'Akira Matsuda'
    end

    test '簡煒航' do
      assert_contributor_names 'c32978d4', 'Tony Jian'
    end

    test '簡煒航 (Jian Weihang)' do
      assert_contributor_names '44595769', '簡煒航 (Jian Weihang)'
    end

    test '1334' do
      assert_contributor_names '47d95c8c', 'Iñigo Solano Pàez'
    end

    test '90yukke' do
      assert_contributor_names 'b289519f', 'Alexander Karmes'
    end

    test '_tiii' do
      assert_contributor_names 'a4b02be0', 'Titus Ramczykowski'
    end

    test 'Aaron' do
      assert_contributor_names '1477a610', 'Aaron Eisenberger'
    end

    test 'aarongray' do
      assert_contributor_names 'b30805bd', 'Aaron Gray'
    end

    test 'abhay' do
      assert_contributor_names '3353b85b', 'Abhay Kumar'
    end

    test 'abonec' do
      assert_contributor_names '20519efa', 'Alexander Baronec'
    end

    test 'acapilleri' do
      assert_contributor_names 'c08c4681', 'Angelo Capilleri'
    end

    test 'Accessd' do
      assert_contributor_names 'db25ca7e', 'Andrey Morskov'
    end

    test 'acechase' do
      assert_contributor_names '331d9c04', 'Andrew Chase'
    end

    test 'Adam' do
      assert_contributor_names '5dc1f09b', 'Adam Magan'
    end

    test "adam\100the-kramers.net" do
      assert_contributor_names '01cfd2b0', 'Adam Kramer'
    end

    test 'Adam89' do
      assert_contributor_names '52720b46', 'Adam Magan'
    end

    test 'adamj' do
      assert_contributor_names '4d96ece6', 'Adam Johnson'
    end

    test "adamm\100galacticasoftware.com" do
      assert_contributor_names '10a86b21', 'Adam Majer'
    end

    test 'adamwiggins' do
      assert_contributor_names 'ee6b6073', 'Adam Wiggins'
    end

    test "adelle\100bullet.net.au" do
      assert_contributor_names '101968f3', 'Adelle Hartley'
    end

    test 'Aditya' do
      assert_contributor_names 'd67adf1e', 'Aditya Chadha'
    end

    test 'aditya-kapoor' do
      assert_contributor_names '426f42c0', 'Aditya Kapoor'
    end

    test 'adman65' do
      assert_contributor_names '7dfa8c08', 'Adam Hawkins'
    end

    test 'Adrian' do
      assert_contributor_names '475bb4b1', 'Adrian Marin'
    end

    test 'adymo' do
      assert_contributor_names '9d03813e', 'Alexander Dymo'
    end

    test 'aeden' do
      assert_contributor_names 'c9770d8a', 'Anthony Eden'
    end

    test 'Agis-' do
      assert_contributor_names '666a248b', 'Agis Anastasopoulos'
    end

    test 'agius' do
      assert_contributor_names '1ff67d82', 'Andrew Evans'
    end

    test 'aguynamedryan' do
      assert_contributor_names '4eaa8ba5', 'Ryan Duryea'
    end

    test 'aiwilliams' do
      assert_contributor_names 'dd605e93', 'Adam Williams'
    end

    test 'akaspick' do
      assert_contributor_names '0d82b146', 'Andrew Kaspick'
    end

    test "akaspick\100gmail.com" do
      assert_contributor_names 'e30699f6', 'Andrew Kaspick'
    end

    test 'akhilgkrishnan' do
      assert_contributor_names 'bf79a4c8', 'Akhil G Krishnan'
    end

    test 'Akshay' do
      assert_contributor_names '4d627049', 'Akshay Mohite'
    end

    test 'Akshat Sharma' do
      assert_contributor_names '2438a1cf', 'Pramod Sharma'
    end

    test 'alancfrancis' do
      assert_contributor_names '0b45b89c', 'Alan Francis'
    end

    test "alancfrancis\100gmail.com" do
      assert_contributor_names 'dfd0bdf1', 'Alan Francis'
    end

    test 'Alan Tan' do
      assert_contributor_names 'c9430dba', 'Guo Xiang Tan'
    end

    test 'Alan Guo Xiang Tan' do
      assert_contributor_names 'e6da3ebd', 'Guo Xiang Tan'
    end

    test 'Alberto Almagro Sotelo' do
      assert_contributor_names '5c62bd53', 'Gannon McGibbon', 'Alberto Almagro'
    end

    test 'Aleksandr Koss' do
      assert_contributor_names 'b7bdacf1', 'Sasha Koss'
    end

    test 'Aleksey Kondratenko' do
      assert_contributor_names 'a9113b88', 'Aliaksey Kandratsenka'
    end

    test "alex.borovsky\100gmail.com" do
      assert_contributor_names 'f1a01c80', 'Alexander Borovsky'
    end

    test "alex\100byzantine.no" do
      assert_contributor_names 'ad63c96f', 'Alexander Staubo'
    end

    test "alex\100msgpad.com" do
      assert_contributor_names '42775686', 'Alex Pooley'
    end

    test "alex\100purefiction.net" do
      assert_contributor_names 'd016d9a6', 'Alexander Staubo'
    end

    test 'Alexander' do
      assert_contributor_names 'bdcc2715', 'Alexander Baronec'
      assert_contributor_names '9e39dc48', 'Alexander Baronec'
      assert_contributor_names '7c643d9f', 'Alexander Quine'
      assert_contributor_names 'ca6a12d6', 'Dembskiy Alexander'
    end

    test 'alexbel' do
      assert_contributor_names '6aaf4bff', 'Alexander Belaev'
    end

    test 'alexch' do
      assert_contributor_names '2559feb5', 'Alex Chaffee'
    end

    test 'Alexey' do
      assert_contributor_names 'd336ca52', 'Alexey Zatsepin'
    end

    test 'alexey' do
      assert_contributor_names '52fe604d', 'Alexey Zatsepin'
    end

    test 'Alexey Markov' do
      assert_contributor_names '0c85705f', 'Markov Alexey'
    end

    test "alexkwolfe\100gmail.com" do
      assert_contributor_names 'b5c23665', 'Alex Wolfe'
    end

    test 'alfa-jpn' do
      assert_contributor_names '9bd43868', 'Atsushi Nakamura'
    end

    test 'alimi' do
      assert_contributor_names '6b5df90f', 'Ali Ibrahim'
    end

    test 'alkesh26' do
      assert_contributor_names '393566c2', 'Alkesh Ghorpade'
    end

    test 'alkeshghorpade' do
      assert_contributor_names 'aed448cc', 'Alkesh Ghorpade'
    end

    test "alles\100atomicobject.com" do
      assert_contributor_names '68dfe3e0', 'Micah Alles'
    end

    test 'alloy' do
      assert_contributor_names '4d1c87a0', 'Eloy Duran'
    end

    test 'ambethia' do
      assert_contributor_names '18c663eb', 'Jason L Perry'
    end

    test 'amishyn' do
      assert_contributor_names 'e32149ad', 'Alex Mishyn'
    end

    test 'amitkumarsuroliya' do
      assert_contributor_names '44e94a38', 'Amit Kumar Suroliya'
    end

    test 'anamba' do
      assert_contributor_names '6ccbef58', 'Aaron Namba'
    end

    test 'Anand' do
      assert_contributor_names '25f60ccf', 'Anand Muthukrishnan'
    end

    test 'Anatoly Makarevich' do
      assert_contributor_names 'fce0d088', 'Anatoli Makarevich'
    end

    test 'andrea longhi' do
      assert_contributor_names 'd7f0e434', 'Andrea Longhi'
    end

    test 'Andrew' do
      assert_contributor_names '3d6ed501', 'Andrew Chase'
    end

    test "andrew.john.peters\100gmail.com" do
      assert_contributor_names '03097d3a', 'Andrew Peters'
    end

    test "andrew\100redlinesoftware.com" do
      assert_contributor_names 'd3cf2a66', 'Andrew Kaspick'
    end

    test "andrey.nering\100gmail.com" do
      assert_contributor_names '6d59473b', 'Andrey Nering'
    end

    test "andy\100tinnedfruit.org" do
      assert_contributor_names 'ab7c7a8e', 'Andrew A. Smith'
    end

    test "andylien\100gmail.com" do
      assert_contributor_names '35240ba6', 'Andy Lien'
    end

    test 'Angelo capilleri' do
      assert_contributor_names 'b97e0a11', 'Angelo Capilleri'
    end

    test 'angelo giovanni capilleri' do
      assert_contributor_names '64af96bb', 'Angelo Capilleri'
    end

    test 'anilmaurya' do
      assert_contributor_names '41722dd4', 'Anil Kumar Maurya'
    end

    test 'Ankit Gupta-FIR' do
      assert_contributor_names '6a71d09a', 'Ankit Gupta'
    end

    test 'ankit1910' do
      assert_contributor_names '39006716', 'Ankit Bansal'
    end

    test 'ankit8898' do
      assert_contributor_names '46a0eace', 'Ankit Gupta'
    end

    test 'Ankit gupta' do
      assert_contributor_names '72c5b517', 'Ankit Gupta'
    end

    test 'anna' do
      assert_contributor_names '93262229', 'maiha'
    end

    test "anna\100wota.jp" do
      assert_contributor_names 'e72ff355', 'maiha'
    end

    test 'AnnaErshova' do
      assert_contributor_names '0166adce', 'Anna Ershova'
    end

    test 'anshkakashi' do
      assert_contributor_names 'ab09984d', 'Jason Ketterman'
    end

    test 'Anthony' do
      assert_contributor_names '78f5874c', 'Anthony Alberto'
    end

    test 'anthonynavarre' do
      assert_contributor_names 'bdc51416', 'Anthony Navarre'
    end

    test 'Anton' do
      assert_contributor_names 'f0ae503d', 'Tõnis Simo'
    end

    test 'Antonio Tapiador' do
      assert_contributor_names '5dd80db4', 'Antonio Tapiador del Dujo'
    end

    test 'antramm' do
      assert_contributor_names '083b0b7f', 'Ant Ramm'
    end

    test 'anuj  dutta' do
      assert_contributor_names 'd572bf99', 'Anuj Dutta'
    end

    test 'aquajach' do
      assert_contributor_names 'c0eb542e', 'aquajach'
    end

    test 'ara.t.howard' do
      assert_contributor_names '99c08c70', 'Ara T Howard'
    end

    test "arc\100uchicago.edu" do
      assert_contributor_names '5177333e', 'Shu-yu Guo'
    end

    test 'ariabov' do
      assert_contributor_names '34a3d425', 'Alex Riabov'
    end

    test 'ariejan' do
      assert_contributor_names '388e5d3f', 'Ariejan de Vroom'
    end

    test 'arktisklada' do
      assert_contributor_names 'd8bd9cf6', 'Clayton Liggitt'
    end

    test 'Arsen7' do
      assert_contributor_names 'f756bfbe', 'Mariusz Pękala'
    end

    test 'artemave' do
      assert_contributor_names '6c5a3bb3', 'Artem Avetisyan'
    end

    test 'artemk' do
      assert_contributor_names 'b386951e', 'Artem Kramarenko'
    end

    test 'Arthur Nogueira Neves' do
      assert_contributor_names '5772ffe5', 'Arthur Neves'
    end

    test 'arthurgeek' do
      assert_contributor_names '6ddde027', 'Arthur Zapparoli'
    end

    test 'arton' do
      assert_contributor_names 'c11e78c1', 'Akio Tajima'
    end

    test 'arvida' do
      assert_contributor_names '2a7230aa', 'Arvid Andersson'
    end

    test 'arvind' do
      assert_contributor_names 'dad0c267', 'Arvind Mehra'
    end

    test 'Ashe Connor' do
      assert_contributor_names '8f5f2bf9', 'Asherah Connor'
    end

    test "ask\100develooper.com" do
      assert_contributor_names '17ef7067', 'Ask Bjørn Hansen'
    end

    test 'asmega' do
      assert_contributor_names '61fa6006', 'Phil Lee'
    end

    test 'Assaf' do
      assert_contributor_names '87ef365a', 'Assaf Arkin'
    end

    test "assaf.arkin\100gmail.com" do
      assert_contributor_names '31425029', 'Assaf Arkin'
    end

    test 'athonlab' do
      assert_contributor_names 'ce2eadba', 'AthonLab'
    end

    test "augustz\100augustz.com" do
      assert_contributor_names '3d99d33a', 'August Zajonc'
    end

    test 'AvnerCohen' do
      assert_contributor_names 'd20a5293', 'Avner Cohen'
    end

    test 'awilliams' do
      assert_contributor_names 'b045b5c1', 'Adam Williams'
    end

    test 'Ayose' do
      assert_contributor_names '6ad8f6ef', 'Ayose Cazorla'
    end

    test 'Azzurrio' do
      assert_contributor_names '80e82591', 'Karim El-Husseiny'
    end

    test "babie7a0\100ybb.ne.jp" do
      assert_contributor_names '9ded584e', 'Michiaki Baba'
    end

    test 'backspace' do
      assert_contributor_names '3b795c12', 'Ken Gerrard'
    end

    test 'bagwanpankaj' do
      assert_contributor_names 'c424fb29', 'Bagwan Pankaj'
    end

    test 'Bart' do
      assert_contributor_names 'c2f59f37', 'Bart de Water'
    end

    test 'Bas Van Klinkenberg' do
      assert_contributor_names 'b99914cc', 'Bas van Klinkenberg'
    end

    test 'Ben A. Morgan' do
      assert_contributor_names 'bee4c8f0', 'Ben A. Morgan'
    end

    test 'bastilian' do
      assert_contributor_names '071f48b7', 'Sebastian Graessl'
    end

    test 'beerlington' do
      assert_contributor_names '3da275c4', 'Pete Brown'
    end

    test "bellis\100deepthought.org" do
      assert_contributor_names 'dc87eba0', 'Brad Ellis'
    end

    test "ben\100bensinclair.com" do
      assert_contributor_names '1d9905a6', 'Ben Sinclair'
    end

    test "ben\100groovie.org" do
      assert_contributor_names 'b9c79f19', 'Ben Bangert'
    end

    test 'benedikt' do
      assert_contributor_names 'b17fd25a', 'Benedikt Deicke'
    end

    test 'Benjamin Klotz' do
      assert_contributor_names 'd5847f4c', 'Benny Klotz'
    end

    test "benji\100silverinsanity.com" do
      assert_contributor_names 'd08f838c', 'Brian Gernhardt'
    end

    test 'benmmurphy' do
      assert_contributor_names 'c8168a7c', 'Ben Murphy'
    end

    test 'benolee' do
      assert_contributor_names '008023c2', 'Ben Holley'
    end

    test 'bermi' do
      assert_contributor_names '6ca789bf', 'Bermi Ferrer'
    end

    test 'BertG' do
      assert_contributor_names '06afb8c7', 'Bert Goethals'
    end

    test 'bgipsy' do
      assert_contributor_names '88f2284b', 'Serge Balyuk'
    end

    test 'bgreenlee' do
      assert_contributor_names '083b0b7f', 'Brad Greenlee'
    end

    test 'bitsweat' do
      assert_contributor_names '253a2bbe', 'Jeremy Daer'
    end

    test 'Blaine' do
      assert_contributor_names 'f5977b20', 'Blaine Cook'
    end

    test 'blaine' do
      assert_contributor_names '7d517a14', 'Blaine Cook'
    end

    test "blaine\100odeo.com" do
      assert_contributor_names 'bf3f9209', 'Blaine Cook'
    end

    test "blair\100orcaware.com" do
      assert_contributor_names '46796e74', 'Blair Zajac'
    end

    test "blake\100near-time.com" do
      assert_contributor_names '604eb8ab', 'Blake Watters'
    end

    test 'BlueHotDog' do
      assert_contributor_names '8642c2aa', 'Danni Friedland'
    end

    test 'BMorearty' do
      assert_contributor_names '436da684', 'Brian Morearty'
    end

    test "bob\100sporkmonger.com" do
      assert_contributor_names 'ce458a74', 'Bob Aman'
    end

    test 'bobbus' do
      assert_contributor_names '7ded3b8c', 'Adrien Coquio'
    end

    test 'BobSilva' do
      assert_contributor_names '0c94868f', 'Bob Silva'
    end

    test 'Bodacious' do
      assert_contributor_names '39b9c943', 'Gavin Morrice'
    end

    test 'bogdan' do
      assert_contributor_names 'b644964b', 'Bogdan Gusiev'
    end

    test 'Bogdan' do
      assert_contributor_names '26861302', 'bogdanvlviv'
    end

    test 'boone' do
      assert_contributor_names '3486d540', 'Mike Boone'
    end

    test 'Bounga' do
      assert_contributor_names '39de84d9', 'Nicolas Cavigneaux'
    end

    test "brad\100madriska.com" do
      assert_contributor_names '785e1fa5', 'Brad Ediger'
    end

    test 'bradediger' do
      assert_contributor_names '6c773706', 'Brad Ediger'
    end

    test 'bradrobertson' do
      assert_contributor_names '0252376c', 'Brad Robertson'
    end

    test 'brainopia' do
      assert_contributor_names 'da82b0a7', 'Ravil Bayramgalin'
    end

    test 'brandon' do
      assert_contributor_names '35ffc1af', 'Brandon Keepers'
    end

    test "brandon\100opensoul.org" do
      assert_contributor_names 'fe4d5ea7', 'Brandon Keepers'
    end

    test "brandt\100kurowski.net" do
      assert_contributor_names '6d7175d6', 'Brandt Kurowski'
    end

    test 'brendan' do
      assert_contributor_names '88f2284b', 'Brendan Baldwin'
    end

    test "brianegge\100yahoo.com" do
      assert_contributor_names 'a0927495', 'Brian Egge'
    end

    test 'brianp' do
      assert_contributor_names '50a73916', 'Brian Pearce'
    end

    test 'bronson' do
      assert_contributor_names 'cb1f5692', 'Scott Bronson'
    end

    test 'brupm' do
      assert_contributor_names '4e7d332b', 'Bruno Miranda'
    end

    test 'brynary' do
      assert_contributor_names '5dc831fd', 'Bryan Helmkamp'
    end

    test 'bscofield' do
      assert_contributor_names '81991d69', 'Ben Scofield'
    end

    test 'buddhamagnet' do
      assert_contributor_names 'a85729c5', 'Dave Goodchild'
    end

    test 'c.r.mcgrath' do
      assert_contributor_names '838ae35d', 'Chris McGrath'
    end

    test 'chaadow' do
      assert_contributor_names 'a5e1fc97', 'Chedli Bourguiba'
    end

    test "c.r.mcgrath\100gmail.com" do
      assert_contributor_names '6a519401', 'Chris McGrath'
    end

    test 'caio' do
      assert_contributor_names 'c0899740', 'Caio Chassot'
    end

    test 'calavera' do
      assert_contributor_names '41966167', 'David Calavera'
    end

    test "caleb\100aei-tech.com" do
      assert_contributor_names 'd5b67ed8', 'Caleb Tennis'
    end

    test 'canadaduane' do
      assert_contributor_names 'cab24945', 'Duane Johnson'
    end

    test 'careo' do
      assert_contributor_names '50ee332c', 'Dane Jensen'
    end

    test 'Carlhuda' do
      assert_contributor_names 'c102db93', 'Yehuda Katz', 'Carl Lerche'
    end

    test 'CassioMarques' do
      assert_contributor_names '053afbe3', 'Cássio Marques'
    end

    test 'Catfish' do
      assert_contributor_names '9679cb4d', 'Jonathan del Strother'
    end

    test 'catfish' do
      assert_contributor_names 'eff27ab1', 'Jonathan del Strother'
    end

    test 'cavalle' do
      assert_contributor_names 'b96db528', 'Luismi Cavallé'
    end

    test 'cavelle' do
      assert_contributor_names '9e455867', 'Luismi Cavallé'
    end

    test 'cch1' do
      assert_contributor_names '569a78cb', 'Chris Hapgood'
    end

    test 'cczona' do
      assert_contributor_names '6ee8e929', 'Carina C. Zona'
    end

    test "cdcarter\100gmail.com" do
      assert_contributor_names '21399219', 'Chris Carter'
    end

    test 'Cédric FABIANSKI' do
      assert_contributor_names '9f549212', 'Cédric Fabianski'
    end

    test 'ceefour' do
      assert_contributor_names '7e33de46', 'Hendy Irawan'
    end

    test 'ch33hau' do
      assert_contributor_names 'ac851251', 'Lim Chee Hau'
    end

    test 'chaitanyav' do
      assert_contributor_names '449cf50d', 'Chaitanya Vellanki'
    end

    test "charles.gerungan\100gmail.com" do
      assert_contributor_names '3c0e7b1b', 'Charles M. Gerungan'
    end

    test 'chas' do
      assert_contributor_names '6f632878', 'Chas Grundy'
    end

    test 'chocoby' do
      assert_contributor_names '04907b64', 'Kenta Okamoto'
    end

    test 'choonkeat' do
      assert_contributor_names '099c2065', 'Choon Keat'
    end

    test "choonkeat\100gmail.com" do
      assert_contributor_names '89840c40', 'Choon Keat'
    end

    test "chris\100chrisbrinker.com" do
      assert_contributor_names 'a6855795', 'Chris Brinker'
    end

    test 'chris finne' do
      assert_contributor_names 'b80fa817', 'Chris Finne'
    end

    test "chris\100octopod.info" do
      assert_contributor_names '3c0e7b1b', 'Chris McGrath'
    end

    test "chris\100ozmm.org" do
      assert_contributor_names '11c715a5', 'Chris Wanstrath'
    end

    test "chris\100seagul.co.uk" do
      assert_contributor_names '760bcc6e', 'Chris Roos'
    end

    test 'chrisfinne' do
      assert_contributor_names '76d2c455', 'Chris Finne'
    end

    test 'chrisk' do
      assert_contributor_names '19a15865', 'Chris Kampmeier'
    end

    test 'chriskohlbrenner' do
      assert_contributor_names '2ec51d03', 'Chris Kohlbrenner'
    end

    test 'chrismear' do
      assert_contributor_names 'afd288cf', 'Chris Mear'
    end

    test 'chrisroos' do
      assert_contributor_names '50253ede', 'Chris Roos'
    end

    test "chriztian.steinmeier\100gmail.com" do
      assert_contributor_names 'd40af24e', 'Chriztian Steinmeier'
    end

    test 'Chu Yeow' do
      assert_contributor_names 'dc3e55d1', 'Cheah Chu Yeow'
    end

    test 'chuyeow' do
      assert_contributor_names '56e64629', 'Cheah Chu Yeow'
    end

    test 'ciastek' do
      assert_contributor_names '2bcfdec2', 'Sebastian Spieszko'
    end

    test 'cjheath' do
      assert_contributor_names '12d8d48b', 'Clifford Heath'
    end

    test 'Claudio B' do
      assert_contributor_names '0b0042cf', 'Claudio Baccigalupo'
    end

    test 'Claudio B.' do
      assert_contributor_names '2651810c', 'Claudio Baccigalupo'
    end

    test 'claudiob' do
      assert_contributor_names '0e56c1de', 'Claudio Baccigalupo'
    end

    test 'claudiofullscreen' do
      assert_contributor_names '0b725aa7', 'Claudio Baccigalupo'
    end

    test 'cluon' do
      assert_contributor_names 'deda0ee4', 'Phil Orwig'
    end

    test 'cnaize' do
      assert_contributor_names 'bf15169c', 'Nikita Loskutov'
    end

    test 'codafoo' do
      assert_contributor_names 'be827f93', 'Cesar Ho'
    end

    test 'codahale' do
      assert_contributor_names '4aabe463', 'Coda Hale'
    end

    test 'codeape' do
      assert_contributor_names '9a42096e', 'Dan Cheail'
    end

    test 'codebrulee' do
      assert_contributor_names 'ebe8dd61', 'Kevin Smith'
    end

    test 'codesnik' do
      assert_contributor_names '96d4da17', 'Alexey Trofimenko'
    end

    test "codyfauser\100gmail.com" do
      assert_contributor_names 'f49ba114', 'Cody Fauser'
    end

    test 'coffee2code' do
      assert_contributor_names 'ab9f3244', 'Scott Reilly'
    end

    test "cohen.jeff\100gmail.com" do
      assert_contributor_names 'e57bd727', 'Jeff Cohen'
    end

    test "colman\100rominato.com" do
      assert_contributor_names 'b762e014', 'Colman Nady'
    end

    test "contact\100lukeredpath.co.uk" do
      assert_contributor_names 'e9d4b367', 'Luke Redpath'
    end

    test "contact\100maik-schmidt.de" do
      assert_contributor_names '2d24bed3', 'Maik Schmidt'
    end

    test 'coreyhaines' do
      assert_contributor_names 'df755d4e', 'Corey Haines'
    end

    test 'Cory Gwin' do
      assert_contributor_names '31021c78', 'Cory Gwin'
    end

    test 'court3nay' do
      assert_contributor_names '891a962a', 'Courtenay Gasking'
    end

    test 'Court3nay' do
      assert_contributor_names 'ee87dbe0', 'Courtenay Gasking'
    end

    test "court3nay\100gmail.com" do
      assert_contributor_names 'df97ed5e', 'Courtenay Gasking'
    end

    test 'courtenay' do
      assert_contributor_names '14e7c7c2', 'Courtenay Gasking'
    end

    test 'cpytel' do
      assert_contributor_names 'f2546164', 'Chad Pytel'
    end

    test 'Cristi BALAN' do
      assert_contributor_names '6d566e82', 'Cristi Balan'
    end

    test 'ctm' do
      assert_contributor_names 'c26cca3f', 'Clifford T. Matthews'
    end

    test 'cyu' do
      assert_contributor_names '2b68762f', 'Calvin Yu'
    end

    test 'dacat' do
      assert_contributor_names 'f854ecd1', 'Felix Dominguez'
    end

    test 'dancroak' do
      assert_contributor_names '569a78cb', 'Dan Croak'
    end

    test 'danger' do
      assert_contributor_names '1dd00341', 'Jack Danger Canty'
    end

    test 'Danger' do
      assert_contributor_names '2c6e616b', 'Jack Danger Canty'
    end

    test 'Daniel Burnette' do
      assert_contributor_names 'b93ae0cd', 'Daniel Burnette'
    end

    test "daniel\100nightrunner.com" do
      assert_contributor_names 'ba309a3e', 'Daniel Hobe'
    end

    test "daniel\100nouvelles-solutions.com" do
      assert_contributor_names '16716090', 'Daniel Wanja'
    end

    test 'danielc192' do
      assert_contributor_names '0fc481d7', 'Daniel Cohen'
    end

    test 'danielmorrison' do
      assert_contributor_names 'cb5b8a7f', 'Daniel Morrison'
    end

    test "daniels\100pronto.com.au" do
      assert_contributor_names '6a1a1e55', 'Daniel Sheppard'
    end

    test "daniluk\100yahoo.com" do
      assert_contributor_names 'c99df461', 'Grzegorz Daniluk'
    end

    test "dansketcher\100gmail.com" do
      assert_contributor_names 'fb619127', 'Dan Sketcher'
    end

    test "darashi\100gmail.com" do
      assert_contributor_names '17d2732b', 'Yoji Shidara'
    end

    test 'dasil003' do
      assert_contributor_names '2a07886b', 'Gabe da Silveira'
    end

    test "dave\100cherryville.org" do
      assert_contributor_names 'b66b1fff', 'Dave Lee'
    end

    test "dave-ml\100dribin.org" do
      assert_contributor_names '2fe86106', 'Dave Dribin'
    end

    test "dave\100pragprog.com" do
      assert_contributor_names 'c80c6364', 'Dave Thomas'
    end

    test 'davetoxa' do
      assert_contributor_names 'cc585c8b', 'Anton Cherepanov'
    end

    test 'david.calavera' do
      assert_contributor_names '7e1c04d8', 'David Calavera'
    end

    test "david.felstead\100gmail.com" do
      assert_contributor_names '8dda7c54', 'David Felstead'
    end

    test 'David FRANCOIS' do
      assert_contributor_names '18aa1ae2', 'David François'
    end

    test 'DAVID MOORE' do
      assert_contributor_names '4c945ccc', 'Dave Moore'
    end

    test "david\100ruppconsulting.com" do
      assert_contributor_names 'c4a36349', 'David Rupp'
    end

    test 'davidauza-engineer' do
      assert_contributor_names 'e3d496ac', 'David Auza'
    end

    test 'davidjrice' do
      assert_contributor_names '82a85e85', 'David Rice'
    end

    test 'davidw' do
      assert_contributor_names '1f802968', 'David N. Welton'
    end

    test 'DawidJanczak' do
      assert_contributor_names '89a8143d', 'Dawid Janczak'
    end

    test 'Dawnthorn' do
      assert_contributor_names 'f999ab08', 'Peter Haight'
    end

    test 'dblack' do
      assert_contributor_names '11a54927', 'David A. Black'
    end

    test "dblack\100wobblini.net" do
      assert_contributor_names '91247b61', 'David A. Black'
    end

    test 'dbussink' do
      assert_contributor_names '78727dd8', 'Dirkjan Bussink'
    end

    test 'dchelimsky' do
      assert_contributor_names '42ebf559', 'David Chelimsky'
    end

    test 'dcmanges' do
      assert_contributor_names '16fde4c8', 'Dan Manges'
    end

    test 'dcurtis' do
      assert_contributor_names '248fa70c', 'Dustin Curtis'
    end

    test 'ddemaree' do
      assert_contributor_names 'f90160c6', 'David Demaree'
    end

    test 'ddollar' do
      assert_contributor_names '8ff9e936', 'David Dollar'
    end

    test 'Dee.Zsombor' do
      assert_contributor_names '2bf22305', 'Dee Zsombor'
    end

    test "Dee.Zsombor\100gmail.com" do
      assert_contributor_names '26022d8d', 'Dee Zsombor'
    end

    test 'deepblue' do
      assert_contributor_names '2a34e082', 'Bryan Kang'
    end

    test 'defeated' do
      assert_contributor_names 'dcaa074a', 'Eddie Cianci'
    end

    test 'defunkt' do
      assert_contributor_names '49cb4127', 'Chris Wanstrath'
    end

    test 'DefV' do
      assert_contributor_names 'c71de033', 'Jan De Poorter'
    end

    test "deirdre\100deirdre.net" do
      assert_contributor_names '9105cd10', 'Deirdre Saoirse'
    end

    test 'DeLynn' do
      assert_contributor_names 'aa09c770', 'DeLynn Berry'
    end

    test 'DeLynn B' do
      assert_contributor_names '6cd3bda3', 'DeLynn Berry'
    end

    test 'DeLynn Barry' do
      assert_contributor_names 'f2e6945b', 'DeLynn Berry'
    end

    test 'delynnb' do
      assert_contributor_names '665ab937', 'DeLynn Berry'
    end

    test 'DelynnB' do
      assert_contributor_names 'ba96827b', 'DeLynn Berry'
    end

    test 'DeLynnB' do
      assert_contributor_names 'ed46cc30', 'DeLynn Berry'
    end

    test 'demetrius' do
      assert_contributor_names 'ec6f0a1f', 'Demetrius Nunes'
    end

    test 'Demetrius' do
      assert_contributor_names '93ec1303', 'Demetrius Nunes'
    end

    test "derrickspell\100cdmplus.com" do
      assert_contributor_names '416385a0', 'Derrick Spell'
    end

    test "dev\100metacasa.net" do
      assert_contributor_names '9a5b91a3', 'John Sheets'
    end

    test 'Developer' do
      assert_contributor_names '179b4512', 'John Pignata'
    end

    test 'Dmitriy Budnik' do
      assert_contributor_names 'a2096528', 'Dmitriy Budnik'
    end

    test 'devrieda' do
      assert_contributor_names '45d679bc', 'Derek DeVries'
    end

    test "devslashnull\100gmail.com" do
      assert_contributor_names '4bd80f11', 'Brian Donovan'
    end

    test "dfelstead\100site5.com" do
      assert_contributor_names '5e5b87b4', 'David Felstead'
    end

    test 'dfens' do
      assert_contributor_names 'ab9140ff', 'Paweł Mikołajewski'
    end

    test 'dharmatech' do
      assert_contributor_names 'f74a4d80', 'Eduardo Cavazos'
    end

    test 'Dima Fatko' do
      assert_contributor_names '238432d1', 'Jorge Manrubia', 'fatkodima'
    end

    test 'dixpac' do
      assert_contributor_names 'c520417a', 'Dino Maric'
    end

    test 'DHH' do
      assert_contributor_names 'bd261ffd', 'David Heinemeier Hansson'
    end

    test 'diatmpravin' do
      assert_contributor_names 'a3025975', 'Pravin Mishra'
    end

    test 'dickeyxxx' do
      assert_contributor_names '21586d36', 'Jeff Dickey'
    end

    test "dj\100omelia.org" do
      assert_contributor_names 'f6ec9e3d', 'Duff OMelia'
    end

    test 'djanowski' do
      assert_contributor_names '0e6c8e5f', 'Damian Janowski'
    end

    test 'dkaplan88' do
      assert_contributor_names 'a0bdf2ff', 'Dan Kaplan'
    end

    test 'dkubb' do
      assert_contributor_names '11a92b35', 'Dan Kubb'
    end

    test 'dm1try' do
      assert_contributor_names 'c12024bc', 'Dmitry Dedov'
    end

    test 'dmathieu' do
      assert_contributor_names '18bce295', 'Damien Mathieu'
    end

    test 'Dmitriy Vorotilin' do
      assert_contributor_names '705a1d5b', 'Dmitry Vorotilin'
    end

    test 'Vasin Dmitriy' do
      assert_contributor_names 'dc8ddea5', 'Dmytro Vasin'
    end

    test 'doabit' do
      assert_contributor_names '80941567', 'Sean Dent'
    end

    test 'docunext' do
      assert_contributor_names 'c070cc4a', 'Albert Lash'
    end

    test "dom\100sisna.com" do
      assert_contributor_names 'c81af992', 'Dominic Sisneros'
    end

    test "don.park\100gmail.com" do
      assert_contributor_names '2ed6d365', 'Don Park'
    end

    test "donald.piret\100synergetek.be" do
      assert_contributor_names 'd94af9a6', 'Donald Piret'
    end

    test "doppler\100gmail.com" do
      assert_contributor_names 'f4f7e750', 'David Rose'
    end

    test "dpiddy\100gmail.com" do
      assert_contributor_names '58f2bd0c', 'Dan Peterson'
    end

    test 'dpmehta02' do
      assert_contributor_names 'b9ead0fe', 'Dev Mehta'
    end

    test 'Dr Nic' do
      assert_contributor_names '868e6b08', 'Dr Nic Williams'
    end

    test "drbrain\100segment7.net" do
      assert_contributor_names 'ce0653b1', 'Eric Hodel'
    end

    test 'Dreamer3' do
      assert_contributor_names 'c6a18308', 'Josh Goebel'
    end

    test "dreamer3\100gmail.com" do
      assert_contributor_names 'dfa8aa0e', 'Josh Goebel'
    end

    test 'dreamfall' do
      assert_contributor_names '7c3a5ec4', 'Vasili Kachalko'
    end

    test 'Drew' do
      assert_contributor_names '28a9b65f', 'Drew Bragg'
    end

    test 'DrMark' do
      assert_contributor_names '56fec2f2', 'Mark Lane'
    end

    test 'drnic' do
      assert_contributor_names '346d36bf', 'Dr Nic Williams'
    end

    test 'drodriguez' do
      assert_contributor_names '046a87a8', 'Daniel Rodríguez Troitiño'
    end

    test 'dtaniwaki' do
      assert_contributor_names 'c91e1cca', 'Daisuke Taniwaki'
    end

    test "duane.johnson\100gmail.com" do
      assert_contributor_names '0b92d38c', 'Duane Johnson'
    end

    test "duncan\100whomwah.com" do
      assert_contributor_names 'fd8ee0a2', 'Duncan Robertson'
    end

    test 'duncanbeevers' do
      assert_contributor_names '9f1fdcc2', 'Duncan Beevers'
    end

    test "dweitzman\100gmail.com" do
      assert_contributor_names '9ca9f95a', 'David Weitzman'
    end

    test 'Dylan Smith' do
      assert_contributor_names 'b4be6196', 'Dylan Thacker-Smith'
    end

    test "dymo\100mk.ukrtelecom.ua" do
      assert_contributor_names '6ce3bf70', 'Alexander Dymo'
    end

    test 'Eadz' do
      assert_contributor_names '6a171511', 'Eaden McKee'
    end

    test 'eadz' do
      assert_contributor_names '9b6207c3', 'Eaden McKee'
    end

    test "easleydp\100gmail.com" do
      assert_contributor_names 'eede40bc', 'David Easley'
    end

    test "eddiewould\100paradise.net.nz" do
      assert_contributor_names '1e7ce13b', 'Eddie Stanley'
    end

    test 'edibiase' do
      assert_contributor_names 'cb978baa', 'Evan DiBiase'
    end

    test 'edogawaconan' do
      assert_contributor_names '650a05c2', 'Edho Arief'
    end

    test "edward\100debian.org" do
      assert_contributor_names '7d09b8d7', 'Edward Betts'
    end

    test 'egilburg' do
      assert_contributor_names '7c34548f', 'Eugene Gilburg'
    end

    test "ehalvorsen+rails\100runbox.com" do
      assert_contributor_names '49efa02b', 'Erlend Halvorsen'
    end

    test 'eigentone' do
      assert_contributor_names 'b62243a5', 'Craig Davey'
    end

    test "eigentone\100gmail.com" do
      assert_contributor_names '5130fc84', 'Craig Davey'
    end

    test 'eileencodes' do
      assert_contributor_names '7caceee4', 'Eileen M. Uchitelle'
    end

    test 'Eileen Uchitelle' do
      assert_contributor_names 'aec635dc', 'Eileen M. Uchitelle'
    end

    test 'ejy' do
      assert_contributor_names '740e5316', 'Elliot Yates'
    end

    test 'Elektron1c97' do
      assert_contributor_names '6bd417df', 'Yves Siegrist'
    end

    test "elan\100bluemandrill.com" do
      assert_contributor_names 'a46214c4', 'Elan Feingold'
    end

    test "elliot\100townx.org" do
      assert_contributor_names '68e35f13', 'Elliot Smith'
    end

    test 'Emili Parreno' do
      assert_contributor_names '3616141f', 'Emili Parreño'
    end

    test "emptysands\100gmail.com" do
      assert_contributor_names 'da874a4a', 'Nicholas Lee'
    end

    test 'eparreno' do
      assert_contributor_names '344a6953', 'Emili Parreño'
    end

    test "eric.daspet\100survol.net" do
      assert_contributor_names '91531372', 'Eric Daspet'
    end

    test "erik\100codefaktor.de" do
      assert_contributor_names 'eefc22fa', 'Erik Abele'
    end

    test "erik\100ruby-lang.nl" do
      assert_contributor_names 'e54b4d3b', 'Erik Terpstra'
    end

    test 'ernesto.jimenez' do
      assert_contributor_names '5932357f', 'Ernesto Jimenez'
    end

    test 'Ershad K' do
      assert_contributor_names '63895715', 'Ershad Kunnakkadan'
    end

    test 'esad' do
      assert_contributor_names '49178134', 'Esad Hajdarevic'
    end

    test "esad\100esse.at" do
      assert_contributor_names '6ef5b747', 'Esad Hajdarevic'
    end

    test "eule\100space.ch" do
      assert_contributor_names 'bf8b101d', 'Kaspar Schiess'
    end

    test 'evan' do
      assert_contributor_names '00cecf83', 'Evan Weaver'
    end

    test "evan\100protest.net" do
      assert_contributor_names '68608e33', 'Evan Henshaw-Plath'
    end

    test 'evansj' do
      assert_contributor_names '211ffd3f', 'Jon Evans'
    end

    test 'eventualbuddha' do
      assert_contributor_names 'debaf208', 'Brian Donovan'
    end

    test "evgeny.zislis\100gmail.com" do
      assert_contributor_names '842ce34b', 'Evgeny Zislis'
    end

    test 'f.svehla' do
      assert_contributor_names '3cf2c63e', 'Ferdinand Svehla'
    end

    test "f.svehla\100gmail.com" do
      assert_contributor_names 'a53372c2', 'Ferdinand Svehla'
    end

    test 'Fabian Rodriguez' do
      assert_contributor_names 'f3747204', 'Fabián Rodríguez'
    end

    test "fabien\100odilat.com" do
      assert_contributor_names 'f9103e1f', 'Fabien Mannessier'
    end

    test 'farleyknight' do
      assert_contributor_names 'f3b38269', 'Farley Knight'
    end

    test 'farzy' do
      assert_contributor_names 'f18c24c3', 'Farzad Farid'
    end

    test 'fastred' do
      assert_contributor_names '4ea9a8d9', 'Arkadiusz Holko'
    end

    test "fbeausoleil\100ftml.net" do
      assert_contributor_names '6d336753', 'François Beausoleil'
    end

    test 'fcheung' do
      assert_contributor_names '083b0b7f', 'Frederick Cheung'
    end

    test 'fearoffish' do
      assert_contributor_names 'df27fb87', 'Jamie van Dyke'
    end

    test 'fedot' do
      assert_contributor_names '70d7b375', 'Fedot Praslov'
    end

    test "flash\100vanklinkenbergsoftware.nl" do
      assert_contributor_names 'de1f231c', 'Bas van Klinkenberg'
    end

    test 'floehopper' do
      assert_contributor_names '4f39382a', 'James Mead'
    end

    test 'flowdelic' do
      assert_contributor_names 'c59bce85', 'Mason Hale'
    end

    test "foamdino\100gmail.com" do
      assert_contributor_names '7635facd', 'Kevin Jackson'
    end

    test 'foca' do
      assert_contributor_names '458ef3b5', 'Nicolás Sanguinetti'
    end

    test 'Foliosus' do
      assert_contributor_names '0c4ba90a', 'Brent Miller'
    end

    test 'FooBarWidget' do
      assert_contributor_names '9e13b966', 'Hongli Lai (Phusion)'
    end

    test 'FranÃ§ois Beausolei' do
      assert_contributor_names 'd496db13', 'François Beausoleil'
    end

    test 'Francesco Rodriguez' do
      assert_contributor_names '3326b8b1', 'Francesco Rodríguez'
    end

    test 'Francois Beausoleil' do
      assert_contributor_names '07f92e83', 'François Beausoleil'
    end

    test "francois.beausoleil\100gmail.com" do
      assert_contributor_names '127ee8c8', 'François Beausoleil'
    end

    test 'Franky W' do
      assert_contributor_names 'b1d26350', 'Franky Wahl'
    end

    test 'Fred Cheung' do
      assert_contributor_names '220a64e9', 'Frederick Cheung'
    end

    test "frederick.cheung\100gmail.com" do
      assert_contributor_names '078bd051', 'Frederick Cheung'
    end

    test 'frederico' do
      assert_contributor_names '11a75f9a', 'Frederico Macedo'
    end

    test 'freels' do
      assert_contributor_names '36b8073f', 'Matt Freels'
    end

    test 'fxn' do
      assert_contributor_names '75aef09e', 'Xavier Noria'
    end

    test "g.bucher\100teti.ch" do
      assert_contributor_names '3574ab30', 'Gaspard Bucher'
    end

    test "gabriel.gironda\100gmail.com" do
      assert_contributor_names '258bacbf', 'Gabriel Gironda'
    end

    test "gabriel\100gironda.org" do
      assert_contributor_names 'ba2619f5', 'Gabriel Gironda'
    end

    test 'ganesh' do
      assert_contributor_names 'b3ade0cc', 'Ganesh Kumar'
    end

    test 'Gaurav Sharam' do
      assert_contributor_names '434c768a', 'Gaurav Sharma'
    end

    test 'gbuesing' do
      assert_contributor_names '41adf871', 'Geoff Buesing'
    end

    test 'Girish S' do
      assert_contributor_names 'bbf6df78', 'Girish Sonawane'
    end

    test 'geemus' do
      assert_contributor_names 'ed2eb6fa', 'Wesley Beary'
    end

    test 'genlinux' do
      assert_contributor_names '23a5be74', 'Thillai Arasu'
    end

    test "gensym\100mac.com" do
      assert_contributor_names '5241b977', 'David Altenburg'
    end

    test 'Geoffrey Buesing' do
      assert_contributor_names 'cfd56882', 'Geoff Buesing'
    end

    test 'Geoffrey ROGUELON' do
      assert_contributor_names '96e483aa', 'Geoffrey Roguelon'
    end

    test 'german' do
      assert_contributor_names 'adbae9aa', 'Dmitrii Samoilov'
    end

    test 'gfriedrich' do
      assert_contributor_names 'd5e12200', 'Georg Friedrich'
    end

    test 'ggarside' do
      assert_contributor_names '5a3b4cf0', 'Geoff Garside'
    end

    test 'glorieux' do
      assert_contributor_names 'c8b7ad1c', 'Geoffroy Lorieux'
    end

    test 'glv' do
      assert_contributor_names 'dd665ff9', 'Glenn Vanderburg'
    end

    test 'gmarik' do
      assert_contributor_names 'b0be721d', 'Marjan Hratson'
    end

    test 'GMFlash' do
      assert_contributor_names '21c75e54', 'Michael Sheakoski'
    end

    test 'gmile' do
      assert_contributor_names '56c162e7', 'Pirogov Evgenij'
    end

    test 'gnagno' do
      assert_contributor_names 'fdc04687', 'Ignazio Mostallino'
    end

    test "grant\100antiflux.org" do
      assert_contributor_names '63a95167', 'Grant Hollingworth'
    end

    test 'greenbigfrog' do
      assert_contributor_names '9233f52b', 'greenbigfrog'
    end

    test 'Greenie0506' do
      assert_contributor_names 'a1ae17e3', 'Nicholas Greenfield'
    end

    test "greg\100lapcominc.com" do
      assert_contributor_names '7f00f512', 'Greg Lappen'
    end

    test 'gregolsen' do
      assert_contributor_names '8d83e339', 'Innokenty Mikhailov'
    end

    test 'grg' do
      assert_contributor_names 'fb7807e2', 'Glen Gibb'
    end

    test 'grosser' do
      assert_contributor_names '149e3cd3', 'Michael Grosser'
    end

    test 'gsphanikumar' do
      assert_contributor_names 'b1a501e6', 'G S Phani Kumar'
    end

    test 'gspiers' do
      assert_contributor_names '9300ebd8', 'Greg Spiers'
    end

    test 'guillaume' do
      assert_contributor_names 'cfe42ba1', 'Guillaume Carbonneau'
    end

    test 'Guo Xiang' do
      assert_contributor_names '1f893307', 'Guo Xiang Tan'
    end

    test "guy.naor\100famundo.com" do
      assert_contributor_names 'd568fb61', 'Guy Naor'
    end

    test 'gwcoffey' do
      assert_contributor_names '9b6207c3', 'Geoff Coffey'
    end

    test 'h-lame' do
      assert_contributor_names '295587f0', 'Murray Steele'
    end

    test 'hakanensari' do
      assert_contributor_names '9be22bd8', 'Hakan Ensari'
    end

    test "hakuja\100hakuja.net" do
      assert_contributor_names '50103b86', 'Koichi Tsutsumi'
    end

    test 'halfbyte' do
      assert_contributor_names 'c9397e68', 'Jan Krutisch'
    end

    test "hanson\100surgery.wisc.edu" do
      assert_contributor_names '431e21cb', 'Todd Hanson'
    end

    test 'hardbap' do
      assert_contributor_names '4c21026d', 'Mike Breen'
    end

    test 'haruki_zaemon' do
      assert_contributor_names 'fcfcc707', 'Simon Harris'
    end

    test 'hasmanyjosh' do
      assert_contributor_names '24abd43d', 'Josh Susser'
    end

    test "hcatlin\100gmail.com" do
      assert_contributor_names 'c5ec16e5', 'Hampton Catlin'
    end

    test "headius\100headius.com" do
      assert_contributor_names 'c53ae000', 'Charles Nutter'
    end

    test 'heavysixer' do
      assert_contributor_names '429ef9ce', 'Mark Daggett'
    end

    test "hendrik\100mans.de" do
      assert_contributor_names 'ac4b4701', 'Hendrik Mans'
    end

    test 'henrik' do
      assert_contributor_names '9929cb4e', 'Henrik Nyh'
    end

    test 'Henrik N' do
      assert_contributor_names 'c84c0437', 'Henrik Nyh'
    end

    test "henrik\100nyh.se" do
      assert_contributor_names '65a29b34', 'Henrik Nyh'
    end

    test "hensleyl\100papermountain.org" do
      assert_contributor_names '85c603fc', 'Leslie A. Hensley'
    end

    test 'hiroshi' do
      assert_contributor_names '94d67163', 'Hiroshi Saito'
    end

    test 'hoffm' do
      assert_contributor_names '1b12d08a', 'Michael Hoffman'
    end

    test 'homa' do
      assert_contributor_names 'b8396578', 'Egor Homakov'
    end

    test "\100homakov" do
      assert_contributor_names '973490a2', 'Egor Homakov'
    end

    test 'homakov' do
      assert_contributor_names 'f35c93f4', 'Egor Homakov'
    end

    test 'Hongli Lai' do
      assert_contributor_names 'f1d6a0e4', 'Hongli Lai (Phusion)'
    end

    test 'Hongli Lai (Phusion' do
      assert_contributor_names '011cbbc1', 'Hongli Lai (Phusion)'
    end

    test 'HPNeo' do
      assert_contributor_names '96f7ec45', 'Gustavo Leon'
    end

    test 'iaddict' do
      assert_contributor_names 'e1b3a441', 'Tom Stone'
    end

    test "ian.w.white\100gmail.com" do
      assert_contributor_names '59c8c63e', 'Ian White'
    end

    test 'iGEL' do
      assert_contributor_names 'c3ff04b0', 'Johannes Barre'
    end

    test 'Igor' do
      assert_contributor_names 'dd0bbd2c', 'Igor Fedoronchuk'
    end

    test 'igor04' do
      assert_contributor_names '0e50b7bd', 'Igor Guzak'
    end

    test "ikeda\100dream.big.or.jp" do
      assert_contributor_names 'f0448f56', 'Akira Ikeda'
    end

    test 'imajes' do
      assert_contributor_names '553c23df', 'James Cox'
    end

    test "info\100rhalff.com" do
      assert_contributor_names '73ed47dd', 'Rob Halff'
    end

    test 'innu' do
      assert_contributor_names 'af005df8', 'Indrek Juhkam'
    end

    test 'intinig' do
      assert_contributor_names 'f2e6945b', 'Giovanni Intini'
    end

    test 'Intrepidd' do
      assert_contributor_names '9c025ab6', 'Adrien Siami'
    end

    test 'Irfy' do
      assert_contributor_names 'a02c6070', 'Irfan Adilovic'
    end

    test "isaac\100reuben.com" do
      assert_contributor_names '24021317', 'Isaac Reuben'
    end

    test 'isaacfeliu' do
      assert_contributor_names '9e76b59c', 'Isaac Feliu'
    end

    test 'isak' do
      assert_contributor_names '3b9bcf13', 'Andreas Isaksson'
    end

    test 'Ivan' do
      assert_contributor_names 'e838fa06', 'Ivan Korunkov'
    end

    test 'iwiznia' do
      assert_contributor_names '7b6f2a0f', 'Ionatan Wiznia'
    end

    test "jackc\100hylesanderson.com" do
      assert_contributor_names '76e4c1a5', 'Jack Christensen'
    end

    test 'jacobat' do
      assert_contributor_names '4f59aacb', 'Jacob Atzen'
    end

    test 'jacobherrington' do
      assert_contributor_names 'dc27efcc', 'Jacob Herrington'
    end

    test 'jacobstr' do
      assert_contributor_names 'cc995802', 'Jacob Straszynski'
    end

    test 'jacortinas' do
      assert_contributor_names '6602fb62', 'Jose Angel Cortinas'
    end

    test 'jacott' do
      assert_contributor_names 'db05478d', 'Geoff Jacobsen'
    end

    test 'jafrog' do
      assert_contributor_names 'dd0cae31', 'Irina Bednova'
    end

    test "jakob\100mentalized.net" do
      assert_contributor_names '7aa9eed8', 'Jakob Skjerning'
    end

    test 'Jakob S' do
      assert_contributor_names '57098ad8', 'Jakob Skjerning'
    end

    test "james.adam\100gmail.com" do
      assert_contributor_names 'd63f6b9b', 'James Adam'
    end

    test "james\100grayproductions.net" do
      assert_contributor_names '12ff554c', 'James Edward Gray II'
    end

    test "james\100slashetc.com" do
      assert_contributor_names '85bb292a', 'James Megquier'
    end

    test 'jamesgolick' do
      assert_contributor_names '083b0b7f', 'James Golick'
    end

    test 'jamie' do
      assert_contributor_names '0a79eb78', 'Jamie Hill'
    end

    test "jamie\100bravenet.com" do
      assert_contributor_names 'db9be587', 'Jamie Macey'
    end

    test "jamie\100dang.com" do
      assert_contributor_names 'fddd33b8', 'Jamie Orchard-Hays'
    end

    test 'Jamis' do
      assert_contributor_names '9d00b0ce', 'Jamis Buck'
    end

    test 'janovetz' do
      assert_contributor_names '31b901aa', 'Jake Janovetz'
    end

    test "JanPrill\100blauton.de" do
      assert_contributor_names '36fc181a', 'Jan Prill'
    end

    test 'jardeon' do
      assert_contributor_names '43ef688d', 'Jared Haworth'
    end

    test 'Jarkko' do
      assert_contributor_names '98306bed', 'Jarkko Laine'
    end

    test 'jarkko' do
      assert_contributor_names 'eefe4d0d', 'Jarkko Laine'
    end

    test "jarkko\100jlaine.net" do
      assert_contributor_names 'eede40bc', 'Jarkko Laine'
    end

    test 'jasl' do
      assert_contributor_names 'ea881ca8', 'Jun Jiang'
    end

    test 'Jason' do
      assert_contributor_names '3880ab0d', 'Jason Roth'
    end

    test 'Jason Frey (Fryguy)' do
      assert_contributor_names '1d934642', 'Jason Frey'
    end

    test 'jastix' do
      assert_contributor_names 'a1c289db', 'Nikolay Petrachkov'
    end

    test 'jaw6' do
      assert_contributor_names '011e4694', 'Joshua Wehner'
    end

    test "jay\100jay.fm" do
      assert_contributor_names 'f5f7beb3', 'Jay Levitt'
    end

    test 'Jay Pignata' do
      assert_contributor_names 'b372b4c8', 'John Pignata'
    end

    test 'JayK31' do
      assert_contributor_names '50555f3c', 'Jason Kaye'
    end

    test 'jbarnette' do
      assert_contributor_names 'e47392b8', 'John Barnette'
    end

    test 'jbasdf' do
      assert_contributor_names 'dd27c4e5', 'Justin Ball'
    end

    test 'jbbarth' do
      assert_contributor_names '24674b34', 'Jean Baptiste Barth'
    end

    test 'jbsmith86' do
      assert_contributor_names '20f32bbc', 'Joel Smith'
    end

    test 'jbwiv' do
      assert_contributor_names 'af2ebb29', 'John Wells'
    end

    test 'jcf' do
      assert_contributor_names '7cc27b7b', 'James Conroy-Finn'
    end

    test "jcfischer\100gmail.com" do
      assert_contributor_names '7ad57c4f', 'Jens-Christian Fischer'
    end

    test 'jchris' do
      assert_contributor_names '5e677b67', 'Chris Anderson'
    end

    test 'jcoglan' do
      assert_contributor_names 'a7764d8f', 'James Coglan'
    end

    test 'Josh <jdeseno@gmail.com>' do
      assert_contributor_names '40e6f437', 'Josh Deseno'
    end

    test 'jean.helou' do
      assert_contributor_names 'f756bfbe', 'Jean Helou'
    end

    test "jean.helou\100gmail.com" do
      assert_contributor_names 'a3659d58', 'Jean Helou'
    end

    test "Jean-Francois Labbé" do
      assert_contributor_names '90d5a5c2', 'Jean-François Labbé'
    end

    test "jean-francois labbe" do
      assert_contributor_names '34916855', 'Jean-François Labbé'
    end

    test 'jeanmartin' do
      assert_contributor_names 'c48f7444', 'Jan Schwenzien'
    end

    test 'jeem' do
      assert_contributor_names 'cc3183d4', 'Jim Hughes'
    end

    test "jeff\100ministrycentered.com" do
      assert_contributor_names 'a5991d84', 'Jeff Berg'
    end

    test "jeff\100opendbms.com" do
      assert_contributor_names '85baf07b', 'Jeffrey Moss'
    end

    test 'JEG2' do
      assert_contributor_names 'b4337c23', 'James Edward Gray II'
    end

    test 'jejacks0n' do
      assert_contributor_names 'f55ef823', 'Jeremy Jackson'
    end

    test 'Jeremy Daer (Kemper)' do
      assert_contributor_names '1524c011', 'Jeremy Daer'
    end

    test 'Jeremy Kemper' do
      assert_contributor_names 'bd51bbc0', 'Jeremy Daer'
    end

    test "jeremy\100jthopple.com" do
      assert_contributor_names '2e421670', 'Jeremy Hopple'
    end

    test "jeremy\100planetargon.com" do
      assert_contributor_names '58ebf302', 'Jeremy Voorhis'
    end

    test "jeremydurham\100gmail.com" do
      assert_contributor_names '0e146d54', 'Jeremy Durham'
    end

    test "jeremye\100bsa.ca.gov" do
      assert_contributor_names '47b74e6e', 'Jeremy Evans'
    end

    test 'jeremyevans' do
      assert_contributor_names '5d1a305f', 'Jeremy Evans'
    end

    test "jeremyevans0\100gmail.com" do
      assert_contributor_names '02d34440', 'Jeremy Evans'
    end

    test 'jeremymcanally' do
      assert_contributor_names 'b564d7e1', 'Jeremy McAnally'
    end

    test 'jeremymcnally' do
      assert_contributor_names 'a79ac12c', 'Jeremy McAnally'
    end

    test 'jeroeningen' do
      assert_contributor_names '2e379c1e', 'Jeroen van Ingen'
    end

    test 'jerome' do
      assert_contributor_names 'aa4af60a', 'Jérôme Lipowicz'
    end

    test "jerrett\100bravenet.com" do
      assert_contributor_names '942132bd', 'Jerrett Taylor'
    end

    test 'JESii' do
      assert_contributor_names 'f7626ea3', 'Jon Seidel'
    end

    test "jessemerriman\100warpmail.net" do
      assert_contributor_names '04d2d5f2', 'Jesse Merriman'
    end

    test 'jferris' do
      assert_contributor_names 'd8b67f7f', 'Joe Ferris'
    end

    test 'jgarber' do
      assert_contributor_names '3c6b7a21', 'Jason Garber'
    end

    test "jhosteny\100mac.com" do
      assert_contributor_names '9f1b5777', 'Joseph Hosteny'
    end

    test "jimw\100mysql.com" do
      assert_contributor_names '68b90972', 'Jim Winstead'
    end

    test 'jkit' do
      assert_contributor_names '96557eb3', 'J Kittiyachavalit'
    end

    test 'jlindley' do
      assert_contributor_names 'd0bc7247', 'James Lindley'
    end

    test "jmartin\100desertflood.com" do
      assert_contributor_names '2876efb7', 'Joseph A. Martin'
    end

    test "jmckible\100gmail.com" do
      assert_contributor_names '12ab93b7', 'Jordan McKible'
    end

    test 'jmettraux' do
      assert_contributor_names 'bafd698a', 'John Mettraux'
    end

    test "joe\100mjg2.com" do
      assert_contributor_names 'c4f1979d', 'Joe Goldwasser'
    end

    test 'Joe Dupuis' do
      assert_contributor_names 'fc839e98', 'Joé Dupuis'
    end

    test 'joeellis' do
      assert_contributor_names '8e0f49e3', 'Joe Ellis'
    end

    test "joergd\100pobox.com" do
      assert_contributor_names 'efaf2af0', 'Joerg Diekmann'
    end

    test 'joerichsen' do
      assert_contributor_names '083b0b7f', 'Jørgen Orehøj Erichsen'
    end

    test "johan\100johansorensen.com" do
      assert_contributor_names 'c42cd3c3', 'Johan Sørensen'
    end

    test 'Johan Sorensen' do
      assert_contributor_names '998ab509', 'Johan Sørensen'
    end

    test 'Johan Sörensen' do
      assert_contributor_names '14edaa10', 'Johan Sørensen'
    end

    test "johan\100textdrive.com" do
      assert_contributor_names '3fec943a', 'Johan Sørensen'
    end

    test 'John J Wang' do
      assert_contributor_names '4033c500', 'John J. Wang'
    end

    test 'johnb' do
      assert_contributor_names '5e94f053', 'John Barton'
    end

    test 'johndouthat' do
      assert_contributor_names '4250cca0', 'John F. Douthat'
    end

    test 'johnnyb' do
      assert_contributor_names '2be3a33f', 'Jonathan Bartlett'
    end

    test 'joker1007' do
      assert_contributor_names 'edd93a53', 'Tomohiro Hashidate'
    end

    test "jon\100blankpad.net" do
      assert_contributor_names '35d3ede9', 'Jon Wood'
    end

    test "jon\100burningbush.us" do
      assert_contributor_names 'e234115b', 'Jon Moses'
    end

    test "jon.evans\100pobox.com" do
      assert_contributor_names '52c9ad4c', 'Jon Evans'
    end

    test "jon\100instance-design.co.uk" do
      assert_contributor_names '97adfdaa', 'Jon Wood'
    end

    test "jon\100siliconcircus.com" do
      assert_contributor_names '4d9ca4d9', 'Jon Bright'
    end

    test "jonathan\100bluewire.net.nz" do
      assert_contributor_names '1aff68d6', 'Jonathan Viney'
    end

    test "jonathan\100daikini.com" do
      assert_contributor_names '7bfca7e7', 'Jonathan Younger'
    end

    test 'jonnii' do
      assert_contributor_names '46ebbcd5', 'Jonathan Goldman'
    end

    test 'joost' do
      assert_contributor_names '6b018e3d', 'Joost Baaij'
    end

    test 'jordanstaub' do
      assert_contributor_names 'cfe731c2', 'Jordan Staub'
    end

    test 'jordi' do
      assert_contributor_names '8a5a9dcb', 'Jordi Bunster'
    end

    test "Jose' Valim" do
      assert_contributor_names 'c2e7851f', 'José Valim'
    end

    test 'josevalim' do
      assert_contributor_names '8d0b4fa3', 'José Valim'
    end

    test 'josh' do
      assert_contributor_names 'd81ac8d6', 'Josh Peek'
    end

    test 'Josh' do
      assert_contributor_names '903dcefb', 'Josh Peek', 'David Heinemeier Hansson'
    end

    test "Josh <josh\100josh.mn>" do
      assert_contributor_names 'ba3ef762', 'Josh Brody'
    end

    test "josh\100hasmanythrough.com" do
      assert_contributor_names '70577d0d', 'Josh Susser'
    end

    test "josh\100joshpeek.com" do
      assert_contributor_names '8085cbfd', 'Josh Peek'
    end

    test "josh.starcher\100gmail.com" do
      assert_contributor_names 'edb42088', 'Josh Starcher'
    end

    test "joshknowles\100gmail.com" do
      assert_contributor_names 'e9681eb9', 'Josh Knowles'
    end

    test 'joshpeek' do
      assert_contributor_names 'c57c7210', 'Josh Peek'
    end

    test 'Joshua Peek' do
      assert_contributor_names 'e0846c84', 'Josh Peek'
    end

    test "jp.bougie\100gmail.com" do
      assert_contributor_names '75811936', 'Jean-Philippe Bougie'
    end

    test "jpd800" do
      assert_contributor_names 'cb66f19a', 'Jacob Duffy'
    end

    test 'jqr' do
      assert_contributor_names '3028ca59', 'Elijah Miller'
    end

    test 'jramirez' do
      assert_contributor_names 'bcb47a84', 'Javier Ramírez'
    end

    test 'jsgarvin' do
      assert_contributor_names '38deb0ed', 'Jonathan Garvin'
    end

    test 'jsheets' do
      assert_contributor_names '83a21f75', 'John Sheets'
    end

    test 'jsierles' do
      assert_contributor_names '3f336ad5', 'Joshua Sierles'
    end

    test "jsolson\100damogran.org" do
      assert_contributor_names 'ce0653b1', 'Jon Olson'
    end

    test 'jstewart' do
      assert_contributor_names 'cf2ee145', 'Jason Stewart'
    end

    test "jstirk\100oobleyboo.com" do
      assert_contributor_names 'a1506872', 'Jason Stirk'
    end

    test 'jstrachan' do
      assert_contributor_names '0c960602', 'James Strachan'
    end

    test 'juan david pastas' do
      assert_contributor_names 'dbf78b0c', 'Juan David Pastas'
    end

    test 'juandebravo' do
      assert_contributor_names 'ed4bde5a', 'Juan De Bravo'
    end

    test 'JuanitoFatas' do
      assert_contributor_names 'cd0d649d', 'Juanito Fatas'
    end

    test 'juanjo.bazan' do
      assert_contributor_names '3280a6e5', 'Juanjo Bazán'
    end

    test 'Juanjo Bazan' do
      assert_contributor_names '5e836127', 'Juanjo Bazán'
    end

    test 'Jude Arasu' do
      assert_contributor_names 'c22989d3', 'Thillai Arasu'
    end

    test 'JudeArasu' do
      assert_contributor_names 'db20780b', 'Thillai Arasu'
    end

    test 'jugend' do
      assert_contributor_names '50253ede', 'Herryanto Siatono'
    end

    test 'Julia Lopez' do
      assert_contributor_names '5e46f4cc', 'Julia López'
    end

    test 'julik' do
      assert_contributor_names 'f756bfbe', 'Julian Tarkhanov'
    end

    test "justin\100aspect.net" do
      assert_contributor_names '21d50e4d', 'Justin Mecham'
    end

    test 'justinfrench' do
      assert_contributor_names 'b2eca732', 'Justin French'
    end

    test 'jvoorhis' do
      assert_contributor_names '6a133765', 'Jeremy Voorhis'
    end

    test 'jwarwick' do
      assert_contributor_names 'a85caaa1', 'John Warwick'
    end

    test 'jweiss' do
      assert_contributor_names '9e1d506a', 'Jonathan Weiss'
    end

    test 'jwilger' do
      assert_contributor_names 'd0ff4ec1', 'John Wilger'
    end

    test 'jzw' do
      assert_contributor_names '5ab94b25', 'Zac Williams'
    end

    test "k\100v2studio.com" do
      assert_contributor_names '426fa08c', 'Caio Chassot'
    end

    test "kajism\100yahoo.com" do
      assert_contributor_names '40762a48', 'Karel Miarka'
    end

    test 'kamal' do
      assert_contributor_names '67442cb4', 'Kamal Fariz Mahyuddin'
    end

    test 'kamk' do
      assert_contributor_names 'd0df7f2b', 'Kamil Kukura'
    end

    test 'kampers' do
      assert_contributor_names 'f0000281', 'Chris Kampmeier'
    end

    test 'Kane' do
      assert_contributor_names 'cf9f3616', 'Andreas Wurm'
    end

    test 'kane' do
      assert_contributor_names '09a23d22', 'Andreas Wurm'
    end

    test "kanis\100comcard.de" do
      assert_contributor_names '6650da43', 'Lars Kanis'
    end

    test 'karanarora' do
      assert_contributor_names '54152303', 'Karan Arora'
    end

    test 'Karel Minarik' do
      assert_contributor_names 'ee7487e4', 'Karel Minařík'
    end

    test 'kares' do
      assert_contributor_names '5dbd6b51', 'Karol Bucek'
    end

    test 'karmi' do
      assert_contributor_names '4185fb1e', 'Karel Minařík'
    end

    test 'kasper' do
      assert_contributor_names '42728c70', 'Sergey Karpesh'
    end

    test 'kaygee' do
      assert_contributor_names '6509cebb', 'Keith Gautreaux'
    end

    test "kazuhiko\100fdiary.net" do
      assert_contributor_names '8e78e933', 'Kazuhiko Shiozaki'
    end

    test 'KD' do
      assert_contributor_names '13339948', 'Kuldeep Aggarwal'
    end

    test "keegan\100thebasement.org" do
      assert_contributor_names '491b4a3c', 'Keegan Quinn'
    end

    test 'keepcosmos' do
      assert_contributor_names 'ca86c9e8', 'Jaehyun Shin'
    end

    test 'kei' do
      assert_contributor_names 'e1f8ec59', 'Kei Shiratsuchi'
    end

    test "keithm\100infused.org" do
      assert_contributor_names '70f4a92c', 'Keith Morrison'
    end

    test "ken.barker\100gmail.com" do
      assert_contributor_names '34cbf15e', 'Ken Barker'
    end

    test "kenneth.miller\100bitfield.net" do
      assert_contributor_names '9c24899a', 'Ken Miller'
    end

    test "kennethkunz\100gmail.com" do
      assert_contributor_names 'cb62f06d', 'Ken Kunz'
    end

    test 'kennyj' do
      assert_contributor_names 'bb80a875', 'Toshinori Kajihara'
    end

    test 'kenta-s' do
      assert_contributor_names '85119f59', 'kenta-s'
    end

    test 'kevcha' do
      assert_contributor_names 'b523b5a3', 'Kevin Chavanne'
    end

    test "kevin.clark\100gmail.com" do
      assert_contributor_names '767eaa9d', 'Kevin Clark'
    end

    test "kevin.clark\100gmal.com" do
      assert_contributor_names 'b98684c3', 'Kevin Clark'
    end

    test "Kevin Clark kevin.clark\100gmail.com" do
      assert_contributor_names '7252666b', 'Kevin Clark'
    end

    test 'Kevin Deisz' do
      assert_contributor_names '812e9048', 'Kevin Newton'
    end

    test "kevwil\100gmail.com" do
      assert_contributor_names '080e1697', 'Kevin Williams'
    end

    test 'kgorin' do
      assert_contributor_names '10e708c8', 'Kirill Gorin'
    end

    test "kim\100tinker.com" do
      assert_contributor_names '060b9b16', 'Kim Shrier'
    end

    test 'Kir' do
      assert_contributor_names '3fb0579d', 'Kir Shatrov'
    end

    test 'kitallis' do
      assert_contributor_names 'ea6cc280', 'Akshay Gupta'
    end

    test 'knapo' do
      assert_contributor_names 'e2d90bf8', 'Krzysztof Knapik'
    end

    test 'kohnkecomm' do
      assert_contributor_names 'cf6299db', 'kohnkecomm'
    end

    test 'kommen' do
      assert_contributor_names '3cfb894b', 'Dieter Komendera'
    end

    test 'kou' do
      assert_contributor_names '24e6cbc7', 'Kouhei Sutou'
    end

    test 'Koz' do
      assert_contributor_names '63e96879', 'Michael Koziarski'
    end

    test 'kp' do
      assert_contributor_names '8641de93', 'Keith Payne'
    end

    test 'kris_chambers' do
      assert_contributor_names '274ef211', 'Kristopher Chambers'
    end

    test 'krishna' do
      assert_contributor_names 'bf658a90', 'Krishna Kotecha'
    end

    test 'kuahyeow' do
      assert_contributor_names 'caec6392', 'Thong Kuah'
    end

    test 'kubo' do
      assert_contributor_names '8437be33', 'Kubo Takehiro'
    end

    test 'kucaahbe' do
      assert_contributor_names 'b4ae94fb', 'Dmitrij Mjakotnyi'
    end

    test 'kishore-mohan' do
      assert_contributor_names 'cf82b2e0', 'Kishore Mohan'
    end

    test 'Kym' do
      assert_contributor_names '6a14b018', 'Kym McInerney'
    end

    test "l.francke\100gmx.de" do
      assert_contributor_names '620726f8', 'Lars Francke'
    end

    test 'l.guidi' do
      assert_contributor_names '083b0b7f', 'Luca Guidi'
    end

    test 'l4u' do
      assert_contributor_names 'e5c95b18', 'Leo Lou'
    end

    test 'Laknath' do
      assert_contributor_names '0149a6ee', 'Buddhika Laknath'
    end

    test 'lakshan' do
      assert_contributor_names 'e2d0b0ee', 'Lakshan Perera'
    end

    test 'larrylv' do
      assert_contributor_names '939b896a', 'Larry Lv'
    end

    test "larrywilliams1\100gmail.com" do
      assert_contributor_names '35b4bdcf', 'Larry Williams'
    end

    test 'lars pind' do
      assert_contributor_names '2fa5bf03', 'Lars Pind'
    end

    test 'Lars pind' do
      assert_contributor_names 'ff0b7661', 'Lars Pind'
    end

    test "lars\100pind.com" do
      assert_contributor_names 'c350291a', 'Lars Pind'
    end

    test "lars\100pinds.com" do
      assert_contributor_names '52d41669', 'Lars Pind'
    end

    test 'laserlemon' do
      assert_contributor_names '02039e97', 'Steve Richert'
    end

    test "laurel\100gorgorg.org" do
      assert_contributor_names '302c23d5', 'Laurel Fan'
    end

    test 'laurelfan' do
      assert_contributor_names '71a4f716', 'Laurel Fan'
    end

    test 'laurocaetano' do
      assert_contributor_names 'e87c3da2', 'Lauro Caetano'
    end

    test 'lawrence' do
      assert_contributor_names '902533e6', 'Lawrence Pit'
    end

    test 'lazyatom' do
      assert_contributor_names 'f1b1af88', 'James Adam'
    end

    test "lee\100omara.ca" do
      assert_contributor_names 'b272100f', "Lee O'Mara"
    end

    test 'leikind' do
      assert_contributor_names '8b63dd09', 'Yuri Leikind'
    end

    test 'Leon Bredt' do
      assert_contributor_names '7ebdecfb', 'Leon Breedt'
    end

    test 'leprasmurf' do
      assert_contributor_names 'fce92fd8', 'Tim Forbes'
    end

    test 'leriksen' do
      assert_contributor_names '951bb848', 'Leif Eriksen'
    end

    test "leroen\100gmail.com" do
      assert_contributor_names '6a6df5f1', 'Kjetil Lerøen'
    end

    test 'lest' do
      assert_contributor_names 'ba2d8501', 'Sergey Nartimov'
    end

    test 'lholden' do
      assert_contributor_names '19f8bb28', 'Lori Holden'
    end

    test 'libc' do
      assert_contributor_names '9d79e066', 'Eugene Pimenov'
    end

    test 'libin' do
      assert_contributor_names '5c9d430b', 'Lebin Sebastian F'
    end

    test 'lifo' do
      assert_contributor_names '826f0bd4', 'Pratik Naik'
    end

    test 'lifofifo' do
      assert_contributor_names '19dff148', 'Pratik Naik'
    end

    test 'lihan' do
      assert_contributor_names '36261c81', 'Lihan Li'
    end

    test 'lmarlow' do
      assert_contributor_names '63df6eb3', 'Lee Marlow'
    end

    test "lmarlow\100yahoo.com" do
      assert_contributor_names '04d9e94e', 'Lee Marlow'
    end

    test 'logylaps' do
      assert_contributor_names 'd38b4771', 'Logy Laps'
    end

    test 'loincloth' do
      assert_contributor_names 'b4dd1e68', 'Seth Rasmussen'
    end

    test "lon\100speedymac.com" do
      assert_contributor_names '481d5797', 'Lon Baker'
    end

    test 'lorenjohnson' do
      assert_contributor_names '69e4cc6e', 'Loren Johnson'
    end

    test 'lotswholetime' do
      assert_contributor_names '8b3f8310', 'Mark Van Holstyn'
    end

    test "LouisStAmour\100gmail.com" do
      assert_contributor_names 'b30ccefe', 'Louis St-Amour'
    end

    test 'Lourens Naude' do
      assert_contributor_names 'b08c9688', 'Lourens Naudé'
    end

    test 'lsylvester' do
      assert_contributor_names '6c57c786', 'Lachlan Sylvester'
    end

    test 'Lucas Caton' do
      assert_contributor_names '2b7a621e', 'Lucas Catón'
    end

    test 'Lukasz Sarnacki' do
      assert_contributor_names '0c5ca074', 'Łukasz Sarnacki'
    end

    test 'Lukasz Strzalkowski' do
      assert_contributor_names 'f9b6b865', 'Łukasz Strzałkowski'
    end

    test 'lukeludwig' do
      assert_contributor_names '7c147e94', 'Luke Ludwig'
    end

    test 'lukfugl' do
      assert_contributor_names '2c3ca4c4', 'Jacob Fugal'
    end

    test 'lylo' do
      assert_contributor_names '3c0fd445', 'Olly Headey'
    end

    test "m.stienstra\100fngtps.com" do
      assert_contributor_names 'b85c5356', 'Manfred Stienstra'
    end

    test 'ma2gedev' do
      assert_contributor_names '6f9baaec', 'Takayuki Matsubara'
    end

    test "maceywj\100telus.net" do
      assert_contributor_names 'cb4bd897', 'Jamie Macey'
    end

    test 'maclover7' do
      assert_contributor_names 'bbcbe6e9', 'Jon Moss'
    end

    test 'macournoyer' do
      assert_contributor_names '002e73a1', 'Marc-André Cournoyer'
    end

    test 'madlep' do
      assert_contributor_names '8e50f0f9', 'Julian Doherty'
    end

    test 'madrobby' do
      assert_contributor_names 'cfa31c30', 'Thomas Fuchs'
    end

    test 'maik schmidt' do
      assert_contributor_names 'beff664f', 'Maik Schmidt'
    end

    test "mail\100matthewpainter.co.uk" do
      assert_contributor_names 'de5b7370', 'Matthew Painter'
    end

    test 'manfred' do
      assert_contributor_names 'd4c24b6b', 'Manfred Stienstra'
    end

    test 'Manish shrivastava' do
      assert_contributor_names '6252d0ae', 'Manish Shrivastava'
    end

    test 'manish-shrivastava' do
      assert_contributor_names '81458805', 'Manish Shrivastava'
    end

    test 'Manu' do
      assert_contributor_names 'e7e4deec', 'Manu J'
    end

    test 'Marc-Andre Lafortune' do
      assert_contributor_names '819c347f', 'Marc-André Lafortune'
    end

    test 'Marcel' do
      assert_contributor_names '89e06ed4', 'Marcel Molina Jr.'
    end

    test 'marcel' do
      assert_contributor_names 'a995f42b', 'Marcel Molina Jr.'
    end

    test 'Marcel Molina' do
      assert_contributor_names 'ba5591f2', 'Marcel Molina Jr.'
    end

    test 'Marcel Molina Jr' do
      assert_contributor_names '4874df1d', 'Marcel Molina Jr.'
    end

    test 'Marcel Mollina Jr.' do
      assert_contributor_names '3f049b0b', 'Marcel Molina Jr.'
    end

    test 'marcenuc' do
      assert_contributor_names '603ab7d8', 'Marcello Nuccio'
    end

    test "marcin\100junkheap.net" do
      assert_contributor_names '4e9bc0f0', 'Marcin Szczepański'
    end

    test 'marclove' do
      assert_contributor_names 'ce0653b1', 'Marc Love'
    end

    test 'Marcos Tapajos' do
      assert_contributor_names 'be794d80', 'Marcos Tapajós'
    end

    test 'mariozig' do
      assert_contributor_names 'bf044a9b', 'Mario Zigliotto'
    end

    test 'Mark Rushakof' do
      assert_contributor_names '8cc41590', 'Mark Rushakoff'
    end

    test 'MarkMT' do
      assert_contributor_names '27da612e', 'MarkMT'
    end

    test "mark.imbriaco\100pobox.com" do
      assert_contributor_names '229c0f43', 'Mark Imbriaco'
    end

    test 'markevich' do
      assert_contributor_names '56445c90', 'Slava Markevich'
    end

    test "MarkusQ\100reality.com" do
      assert_contributor_names '3441dfdb', 'Markus Roberts'
    end

    test 'Marten' do
      assert_contributor_names '91eaeb28', 'Marten Veldthuis'
    end

    test 'Martin' do
      assert_contributor_names 'e807476d', 'Martin Linkhorst'
    end

    test "martin.emde\100gmail.com" do
      assert_contributor_names 'b1257d96', 'Martin Emde'
    end

    test 'Martin Schürrer' do
      assert_contributor_names '6bc24d40', 'Martin Schuerrer'
    end

    test 'masarakki' do
      assert_contributor_names '83b7bf4d', 'Masaki Yamada'
    end

    test 'mathie' do
      assert_contributor_names '55b66974', 'Graeme Mathieson'
    end

    test 'mathieuravaux' do
      assert_contributor_names 'fadd1fa3', 'Mathieu Ravaux'
    end

    test 'matrix9180' do
      assert_contributor_names '8352287c', 'Chad Ingram'
    end

    test "mats\100imediatec.co.uk" do
      assert_contributor_names '900afae4', 'Mats Persson'
    end

    test 'matt' do
      assert_contributor_names 'e2ce901a', 'Matt Aimonetti'
    end

    test 'Matt B.' do
      assert_contributor_names '97f418ce', 'Matt Boehlig'
    end

    test "matt\100mattmargolis.net" do
      assert_contributor_names '883c54a3', 'Matt Margolis'
    end

    test 'mattbauer' do
      assert_contributor_names '83c19340', 'Matt Bauer'
    end

    test "matthew\100walker.wattle.id.au" do
      assert_contributor_names '8cdf9126', 'Matthew Walker'
    end

    test 'MatthewRudy' do
      assert_contributor_names '7e8aee7e', 'Matthew Rudy Jacobs'
    end

    test 'mattly' do
      assert_contributor_names 'd5a93b62', 'Matt Lyon'
    end

    test "\100mattt" do
      assert_contributor_names 'ef91cddb', 'Mattt Thompson'
    end

    test 'Matt Stopa' do
      assert_contributor_names '3c90f7a2', 'Matthew Stopa'
    end

    test 'Maxim Chernyak' do
      assert_contributor_names '20685d07', 'Max Chernyak'
    end

    test 'Maxime RETY' do
      assert_contributor_names 'c7e875ab', 'Maxime Réty'
    end

    test 'Mehmet Emin İNAÇ' do
      assert_contributor_names 'ca779986', 'Mehmet Emin İNAÇ'
    end

    test 'maximerety' do
      assert_contributor_names 'd0f22a99', 'Maxime Réty'
    end

    test "maznawak\100nerim.net" do
      assert_contributor_names '92473b8f', 'Simon Arnaud'
    end

    test 'mazuhl' do
      assert_contributor_names '106b78d2', 'Max Mitchell'
    end

    test 'mcmire' do
      assert_contributor_names '0ff03199', 'Elliot Winkler'
    end

    test "mdabney\100cavoksolutions.com" do
      assert_contributor_names '43b6a74f', 'Blane Dabney'
    end

    test 'mdeiters' do
      assert_contributor_names 'e59978aa', 'Matthew Deiters'
    end

    test "me\100jonnii.com" do
      assert_contributor_names '4793a2f5', 'Jonathan Goldman'
    end

    test "me\100julik.nl" do
      assert_contributor_names '2ffc84d2', 'Julian Tarkhanov'
    end

    test "me\100mdaines.com" do
      assert_contributor_names '191dfe8c', 'Michael Daines'
    end

    test "meadow.nnick\100gmail.com" do
      assert_contributor_names '7c8f3edc', 'Lugovoi Nikolai'
    end

    test "medlar\100medlar.it" do
      assert_contributor_names '5525b79b', 'Giovanni Intini'
    end

    test 'mfazekas' do
      assert_contributor_names '341afb6a', 'Miklós Fazekas'
    end

    test 'mfoster' do
      assert_contributor_names '5850edf1', 'Mark W. Foster'
    end

    test 'mhuffnagle' do
      assert_contributor_names '328ae5bb', 'Marc Huffnagle'
    end

    test 'mhutchin' do
      assert_contributor_names '738e906a', 'Michael Hutchinson'
    end

    test 'mhw' do
      assert_contributor_names 'c7df5bd6', 'Mark H. Wilkinson'
    end

    test 'mica eked' do
      assert_contributor_names 'd5e3c494', 'Mica Eked'
    end

    test 'Michael A. Schoen' do
      assert_contributor_names '94a13091', 'Michael Schoen'
    end

    test 'Michael Gunderloy' do
      assert_contributor_names '6222ac1a', 'Mike Gunderloy'
    end

    test 'Michael S. Klishin' do
      assert_contributor_names 'e21ed3e4', 'Michael Klishin'
    end

    test "michael\100schubert" do
      assert_contributor_names '7d6f7837', 'Michael Schubert'
    end

    test "michael\100schubert.cx" do
      assert_contributor_names 'fd9c15e4', 'Michael Schubert'
    end

    test "michael\100schuerig.de" do
      assert_contributor_names '2abe3d2c', 'Michael Schuerig'
    end

    test 'Michael Shuerig' do
      assert_contributor_names '4836c408', 'Michael Schuerig'
    end

    test 'michaelminter' do
      assert_contributor_names '90f7f81f', 'Michael Minter'
    end

    test 'Miguel' do
      assert_contributor_names '2e4df2a2', 'Miguel Fernández'
    end

    test "mike\100clarkware.com" do
      assert_contributor_names '9f3625dd', 'Mike Clark'
    end

    test "mike\100michaeldewey.org" do
      assert_contributor_names '750ca799', 'Michael Dewey'
    end

    test 'mikel' do
      assert_contributor_names '1d5d050c', 'Mikel Lindsaar'
    end

    test 'mikeycgto' do
      assert_contributor_names '6df2db32', 'Michael Coyne'
    end

    test 'Miklos Fazekas' do
      assert_contributor_names 'be0875f4', 'Miklós Fazekas'
    end

    test 'Miklos Fazkeas' do
      assert_contributor_names 'fb71fa69', 'Miklós Fazekas'
    end

    test 'mikong' do
      assert_contributor_names '632ab246', 'Michael Galero'
    end

    test 'miloops' do
      assert_contributor_names 'f253e98d', 'Emilio Tagua'
    end

    test "minimudboy\100gmail.com" do
      assert_contributor_names '3fb58286', 'Lewis Jubb'
    end

    test 'Mip Earson' do
      assert_contributor_names '4ae1cdd3', 'Michael Pearson'
    end

    test 'misfo' do
      assert_contributor_names '7706b570', 'Trent Ogren'
    end

    test 'mislav' do
      assert_contributor_names 'a550d2aa', 'Mislav Marohnić'
    end

    test 'Mislav Marohnic' do
      assert_contributor_names '9c0e4de8', 'Mislav Marohnić'
    end

    test "mislav\100nippur.irb.hr" do
      assert_contributor_names 'c02d1f7d', 'Mislav Marohnić'
    end

    test 'mislaw' do
      assert_contributor_names '73fba4fa', 'Mislav Marohnić'
    end

    test "mlaster\100metavillage.com" do
      assert_contributor_names 'de5b7370', 'Mike Laster'
    end

    test "mmangino\100elevatedrails.com" do
      assert_contributor_names '3ad1a985', 'Mike Mangino'
    end

    test 'mnaberez' do
      assert_contributor_names '31d30487', 'Mike Naberezny'
    end

    test 'mntj' do
      assert_contributor_names 'cb973128', 'Corey Leveen'
    end

    test 'mo khan' do
      assert_contributor_names '140557e8', 'Mo Khan'
    end

    test 'mojombo' do
      assert_contributor_names '928c84b6', 'Tom Preston-Werner'
    end

    test 'Molchanov Andrey' do
      assert_contributor_names '37f2674d', 'Andrey Molchanov'
    end

    test 'moriq' do
      assert_contributor_names '2876efb7', 'Kazuhiro Yoshida'
    end

    test "moriq\100moriq.com" do
      assert_contributor_names 'd4bb22b2', 'Kazuhiro Yoshida'
    end

    test 'moro' do
      assert_contributor_names '9a8d583a', 'Kyosuke Morohashi'
    end

    test "mortonda\100dgrmm.net" do
      assert_contributor_names '2876efb7', 'David Morton'
    end

    test 'moses' do
      assert_contributor_names 'e5b3d4b3', 'Moses Hohman'
    end

    test 'mpalmer' do
      assert_contributor_names '2503fd3c', 'Matt Palmer'
    end

    test "mpalmer\100hezmatt.org" do
      assert_contributor_names '7767e33b', 'Matt Palmer'
    end

    test "mparrish\100pearware.org" do
      assert_contributor_names '5fe0ecce', 'Matt Parrish'
    end

    test 'Mr A' do
      assert_contributor_names '31346053', 'Akshay Vishnoi'
    end

    test 'mrageh' do
      assert_contributor_names '94948555', 'Adam Magan'
    end

    test 'MrBrdo' do
      assert_contributor_names 'bc7c0b5c', 'Jan Berdajs'
    end

    test 'mrichman' do
      assert_contributor_names '131acec6', 'Mark A. Richman'
    end

    test 'mrj' do
      assert_contributor_names 'ef57b93a', 'Mark R. James'
    end

    test "mrj\100bigpond.net.au" do
      assert_contributor_names '95e8740f', 'Mark James'
    end

    test 'mrkjlchvz' do
      assert_contributor_names 'e19ce8ba', 'mrkjlchvz'
    end

    test 'mroch' do
      assert_contributor_names '81286f85', 'Marshall Roch'
    end

    test 'mtitorenko' do
      assert_contributor_names '74191edb', 'Mark J. Titorenko'
    end

    test 'Muhammad' do
      assert_contributor_names '73fdd4c1', 'Muhammad Muhammad Ibrahim'
    end

    test 'murphy' do
      assert_contributor_names 'dcc15495', 'Kornelius Kalnbach'
    end

    test "murphy\100cYcnus.de" do
      assert_contributor_names '71ff7054', 'Kornelius Kalnbach'
    end

    test "murpyh\100rubychan.de" do
      assert_contributor_names '53262745', 'Kornelius Kalnbach'
    end

    test 'mutru' do
      assert_contributor_names '00326bb0', 'Otto Hilska'
    end

    test 'nachocab' do
      assert_contributor_names '2e8f9106', 'Nacho Caballero'
    end

    test 'naffis' do
      assert_contributor_names '1117d737', 'Dave Naffis'
    end

    test 'nate' do
      assert_contributor_names '056ddbdc', 'Nathan Kontny'
    end

    test 'NeilW' do
      assert_contributor_names '9f26164d', 'Neil Wilson'
    end

    test 'Neodelf' do
      assert_contributor_names 'e0e70472', 'Andrey Molchanov'
    end

    test 'nerdinand' do
      assert_contributor_names '38c833ca', 'Ferdinand Niedermann'
    end

    test 'neumayr' do
      assert_contributor_names 'd7b60544', 'Matthias Neumayr'
    end

    test 'Nerian' do
      assert_contributor_names '2ebf47ae', 'Gonzalo Rodríguez-Baltanás Díaz'
    end

    test 'neshmi' do
      assert_contributor_names 'e91d7ed5', 'Matthew Vincent'
    end

    test 'Nex3' do
      assert_contributor_names '4036fcc5', 'Nathan Weizenbaum'
    end

    test 'Nick' do
      assert_contributor_names '37b0b369', 'Nick Sieger'
    end

    test "nick+rails\100ag.arizona.edu" do
      assert_contributor_names '06afb8c7', 'Nick Murphy'
    end

    test "npezza93" do
      assert_contributor_names '260d6f11', 'Nick Pezza'
    end

    test 'nicksieger' do
      assert_contributor_names '2029b8a8', 'Nick Sieger'
    end

    test "nicksieger\100gmail.com" do
      assert_contributor_names '81a6a60d', 'Nick Sieger'
    end

    test 'Nicolas Hock Isaza' do
      assert_contributor_names 'ee822f25', 'Nicolás Hock Isaza'
    end

    test "nicolas.pouillard\100gmail.com" do
      assert_contributor_names '8910de6a', 'Nicolas Pouillard'
    end

    test 'Nicolas Sanguinetti' do
      assert_contributor_names 'd5d71716', 'Nicolás Sanguinetti'
    end

    test 'nik.kakelin' do
      assert_contributor_names '2bc5e6cd', 'Nik Wakelin'
    end

    test 'nik.wakelin' do
      assert_contributor_names '5bf40f7b', 'Nik Wakelin'
    end

    test 'Niklas Haeusele' do
      assert_contributor_names 'b086a96f', 'Niklas Häusele'
    end

    test "nils\100alumni.rice.edu" do
      assert_contributor_names '64b7c5fb', 'Nils Jonsson'
    end

    test 'nilsga' do
      assert_contributor_names 'cb791181', 'Nils-Helge Garli Hegvik'
    end

    test 'nishant-cyro' do
      assert_contributor_names '517caa85', 'Nishant Tuteja'
    end

    test 'nkallen' do
      assert_contributor_names 'c6f2af5c', 'Nick Kallen'
    end

    test 'noam' do
      assert_contributor_names 'b64fb302', 'Noam Gagliardi Rabinovich'
    end

    test 'Nobuhiro IMAI' do
      assert_contributor_names 'e535b45c', 'Nobuhiro Imai'
    end

    test 'Noemj' do
      assert_contributor_names 'a53935df', 'Olli Rissanen'
    end

    test 'noradio' do
      assert_contributor_names '87b55f59', 'Marcel Molina Jr.'
    end

    test 'norbauer' do
      assert_contributor_names '1caa7630', 'Norbauer Inc'
    end

    test 'norbert' do
      assert_contributor_names 'f70b74a5', 'Norbert Crombach'
    end

    test "normelton\100gmail.com" do
      assert_contributor_names 'd4c24b6b', 'Norman Elton'
    end

    test 'northeastprince' do
      assert_contributor_names '8e98b614', 'Matt Almeida'
    end

    test 'nosolopau' do
      assert_contributor_names '1e1711c9', 'Pau'
    end

    test 'notahat' do
      assert_contributor_names '566a3696', 'Pete Yandell'
    end

    test 'nov' do
      assert_contributor_names '5476a6a6', 'Nobukazu Matake'
    end

    test "nov\100yo.rim.or.jp" do
      assert_contributor_names 'ae0e1a06', 'Nobuhiro Imai'
    end

    test 'ntalbott' do
      assert_contributor_names '5430eb6d', 'Nathaniel Talbott'
    end

    test 'nullstyle' do
      assert_contributor_names '79670fb9', 'Scott Fleckenstein'
    end

    test "nunemaker\100gmail.com" do
      assert_contributor_names '4defe1ac', 'John Nunemaker'
    end

    test 'nzkoz' do
      assert_contributor_names '96557eb3', 'Michael Koziarski'
    end

    test 'ObieFernandez' do
      assert_contributor_names 'efaf2af0', 'Obie Fernandez'
    end

    test 'obrie' do
      assert_contributor_names '2043513f', 'Aaron Pfeifer'
    end

    test 'octopod' do
      assert_contributor_names '0fd9743a', 'Chris McGrath'
    end

    test 'ogawaso' do
      assert_contributor_names 'd4d3d05d', 'Soichiro Ogawa'
    end

    test 'ogeidix' do
      assert_contributor_names '1ac802fe', 'Diego Giorgini'
    end

    test "okkez000\100gmail.com" do
      assert_contributor_names 'a9ed24c2', 'okkez'
    end

    test "okuramasafumi" do
      assert_contributor_names 'fd205edd', "OKURA Masafumi"
    end

    test "oleg.frolov\100gmail.com" do
      assert_contributor_names 'a2881794', 'Oleg Frolov'
    end

    test 'oleganza' do
      assert_contributor_names 'f95ff8d4', 'Oleg Andreev'
    end

    test "olivier_ansaldi\100yahoo.com" do
      assert_contributor_names 'f801cd79', 'Olivier Ansaldi'
    end

    test 'Olly Legg' do
      assert_contributor_names '0349278f', 'Oliver Legg'
    end

    test "ordwaye\100evergreen.edu" do
      assert_contributor_names 'c29db9f2', 'Erik Ordway'
    end

    test 'orta' do
      assert_contributor_names '4c323bc2', 'Orta Therox'
    end

    test 'oss92' do
      assert_contributor_names 'b937c24e', 'Mohamed Osama'
    end

    test 'outerim' do
      assert_contributor_names '3b6555ac', 'Lee Jensen'
    end

    test 'Overbryd' do
      assert_contributor_names '9fb5ee8b', 'Lukas Rieder'
    end

    test 'oz' do
      assert_contributor_names '4d4db4c8', 'utilum'
    end

    test 'Pablo Ifrán' do
      assert_contributor_names 'c945da58', 'Pablo Ifrán'
    end

    test 'ozzyaaron' do
      assert_contributor_names '837f0ab5', 'Aaron Todd'
    end

    test 'packagethief' do
      assert_contributor_names 'f0055871', 'Jeffrey Hardy'
    end

    test 'padi' do
      assert_contributor_names 'f55ecc6a', 'Marc Rendl Ignacio'
    end

    test 'pager' do
      assert_contributor_names '6a611e1e', 'Dmitriy Timokhin'
    end

    test 'palkan' do
      assert_contributor_names '7785871f', 'Vladimir Dementyev'
    end

    test 'paranoiase Kang' do
      assert_contributor_names '2773257a', 'Sung-hee Kang'
    end

    test "patrick\100lenz.sh" do
      assert_contributor_names '2876efb7', 'Patrick Lenz'
    end

    test 'patrick.t.joyce' do
      assert_contributor_names '5ac3a9bd', 'Patrick Joyce'
    end

    test "paul\100cnt.org" do
      assert_contributor_names '33cf8f16', 'Paul Smith'
    end

    test "paul\100paulbutcher.com" do
      assert_contributor_names 'ccd32ade', 'Paul Butcher'
    end

    test 'paulccarey' do
      assert_contributor_names '2b2ee222', 'Paul Carey'
    end

    test 'pavlos' do
      assert_contributor_names '6861a1d9', 'Paul Hieromnimon'
    end

    test 'pawel2015' do
      assert_contributor_names 'b2bfb077', 'Pawel Janiak'
    end

    test 'pbflinn' do
      assert_contributor_names '690eae7e', 'Perry Flinn'
    end

    test 'pburleson' do
      assert_contributor_names '58bf8f43', 'Patrick Burleson'
    end

    test "pburleson\100gmail.com" do
      assert_contributor_names '1ee780b3', 'Patrick Burleson'
    end

    test "pdcawley\100bofh.org.uk" do
      assert_contributor_names '9c5591da', 'Piers Cawley'
    end

    test 'pedz' do
      assert_contributor_names 'e4e3df8e', 'Perry Smith'
    end

    test 'pelargir' do
      assert_contributor_names '8c2177c4', 'Matthew Bass'
    end

    test 'Pelle' do
      assert_contributor_names '53088c4c', 'Pelle Braendgaard'
    end

    test 'pelle' do
      assert_contributor_names 'da7f9f51', 'Pelle Braendgaard'
    end

    test "pelletierm\100eastmedia.net" do
      assert_contributor_names '5a9a93d2', 'Matt Pelletier'
    end

    test "pergesu\100gmail.com" do
      assert_contributor_names 'befd62c2', 'Pat Maddox'
    end

    test "perlguy\100gmail.com" do
      assert_contributor_names 'd0bd3b5a', 'Jim Helm'
    end

    test "petermichaux\100gmail.com" do
      assert_contributor_names '8734da9b', 'Peter Michaux'
    end

    test 'Peter Jaros' do
      assert_contributor_names 'b947b6ec', 'Petra Jaros'
    end

    test 'Petrik' do
      assert_contributor_names '9a57cd3d', 'Petrik de Heus'
    end

    test 'pezra' do
      assert_contributor_names '860cf2d4', 'Peter Williams'
    end

    test 'phallstrom' do
      assert_contributor_names 'a49e7d5c', 'Philip Hallstrom'
    end

    test "phil.ross\100gmail.com" do
      assert_contributor_names 'f4f7e750', 'Philip Ross'
    end

    test "philbogle\100gmail.com" do
      assert_contributor_names 'b8a5d398', 'Phil Bogle'
    end

    test 'Philipp Weissensteiner' do
      assert_contributor_names '8102c0d9', 'Philipp Weißensteiner'
    end

    test "phillip\100pjbsoftware.com" do
      assert_contributor_names '6cae2b74', 'Phillip J. Birmingham'
    end

    test 'phinze' do
      assert_contributor_names 'd2d7492e', 'Paul Hinze'
    end

    test 'phoet' do
      assert_contributor_names 'b6aa70c3', 'Peter Schröder'
    end

    test "phurley\100gmail.com" do
      assert_contributor_names '09751e57', 'Patrick Hurley'
    end

    test "piecehealth" do
      assert_contributor_names '1f2d0120', 'Zhang Kang'
    end

    test "Kang Zhang" do
      assert_contributor_names '3b814f98', 'Zhang Kang'
    end

    test 'PikachuEXE' do
      assert_contributor_names '7fc33905', 'Leung Ho Kuen'
    end

    test 'piotr' do
      assert_contributor_names '1708a863', 'Piotr Banasik'
    end

    test "piotr\100t-p-l.com" do
      assert_contributor_names '620d3a37', 'Piotr Banasik'
    end

    test 'pivotal' do
      assert_contributor_names 'e710902f', 'Pivotal Labs'
    end

    test 'Pivotal  Labs' do
      assert_contributor_names '487758b3', 'Pivotal Labs'
    end

    test 'pixeltrix' do
      assert_contributor_names '779db44f', 'Andrew White'
    end

    test "pjhyett\100gmail.com" do
      assert_contributor_names '8eaf4791', 'PJ Hyett'
    end

    test 'pleax' do
      assert_contributor_names '2dc14024', 'Dmitry Lipovoi'
    end

    test 'pope' do
      assert_contributor_names '4d5b913f', 'Tim Pope'
    end

    test 'postmodern' do
      assert_contributor_names 'f9e84a9e', 'Hal Brodigan'
    end

    test 'PotatoSalad' do
      assert_contributor_names '083b0b7f', 'Andrew Bennett'
    end

    test 'PoTe' do
      assert_contributor_names 'dadfa1e3', 'Pablo Astigarraga'
    end

    test 'pragdave' do
      assert_contributor_names '76e4c1a5', 'Dave Thomas'
    end

    test 'prakash' do
      assert_contributor_names '82072670', 'Prakash Laxkar'
    end

    test 'prakashmurthy' do
      assert_contributor_names '6b31fd80', 'Prakash Murthy'
    end

    test 'pratik' do
      assert_contributor_names 'dc1166d1', 'Pratik Naik'
    end

    test 'Pratik' do
      assert_contributor_names '281edce6', 'Pratik Naik'
    end

    test 'printercu' do
      assert_contributor_names '0b7a37aa', 'Max Melentiev'
    end

    test "progrium\100gmail.com" do
      assert_contributor_names 'aa7859c9', 'Jeff Lindsay'
    end

    test 'protocool' do
      assert_contributor_names '30549718', 'Trevor Squire'
    end

    test 'psq' do
      assert_contributor_names 'c443a619', 'Pascal Belloncle'
    end

    test "pterjan\100mandriva.com" do
      assert_contributor_names '1e216b1d', 'Pascal Terjan'
    end

    test "pudeyo\100rpi.com" do
      assert_contributor_names '98898ed7', 'Oleg Pudeyev'
    end

    test "purestorm\100ggnore.net" do
      assert_contributor_names 'da675e53', 'Manuel Holtgrewe'
    end

    test 'purp' do
      assert_contributor_names '31e2a2d9', 'Jim Meyer'
    end

    test 'pyromaniac' do
      assert_contributor_names '5a4cdf9c', 'Arkadiy Zabazhanov'
    end

    test 'queso' do
      assert_contributor_names '5285270d', 'Josh Owens'
    end

    test 'raasdnil' do
      assert_contributor_names '3a90e72e', 'Mikel Lindsaar'
    end

    test 'rabiedenharn' do
      assert_contributor_names 'ce0653b1', 'Rob Biedenharn'
    end

    test 'Radar' do
      assert_contributor_names 'ca941367', 'Ryan Bigg'
    end

    test 'Rafael França' do
      assert_contributor_names 'ee82ce78', 'Rafael Mendonça França'
    end

    test 'raggi' do
      assert_contributor_names '08e9d0d6', 'James Tucker'
    end

    test 'RAHUL CHAUDHARI' do
      assert_contributor_names '077dffa5', 'Rahul P. Chaudhari'
    end

    test 'Rahul Chaudhari' do
      assert_contributor_names 'dc3f33eb', 'Rahul P. Chaudhari'
    end

    test "raidel\100onemail.at" do
      assert_contributor_names '20d27f6b', 'Michael Raidel'
    end

    test "rails\10033lc0.net" do
      assert_contributor_names 'b2681cca', 'Eelco Lempsink'
    end

    test "rails\100bencurtis.com" do
      assert_contributor_names '4c966a07', 'Benjamin Curtis'
    end

    test "rails\100electricvisions.com" do
      assert_contributor_names 'ffbaf1c5', 'John Oxton'
    end

    test "rails\100jeffcole.net" do
      assert_contributor_names '4793a2f5', 'Jeff Cole'
    end

    test "rails\100roetzel.de" do
      assert_contributor_names 'ce0653b1', 'David Roetzel'
    end

    test "rails\100tpope.info" do
      assert_contributor_names '74d1512b', 'Tim Pope'
    end

    test 'railsbob' do
      assert_contributor_names '80d86081', 'Anup Narkhede'
    end

    test 'RainerBlessing' do
      assert_contributor_names '8b7219b9', 'Rainer Blessing'
    end

    test "raphinou\100yahoo.com" do
      assert_contributor_names '7661c2b5', 'Raphael Bauduin'
    end

    test 'Raphomet' do
      assert_contributor_names 'b4e5da6b', 'Raphael Lee'
    end

    test 'rasputnik' do
      assert_contributor_names 'f22b0005', 'Dick Davies'
    end

    test 'ravindra kumar kumawat' do
      assert_contributor_names '8bd064ec', 'Ravindra Kumar Kumawat'
    end

    test 'rayners' do
      assert_contributor_names '37a46151', 'David Raynes'
    end

    test 'rcoder' do
      assert_contributor_names '0adcd811', 'Lennon Day-Reynolds'
    end

    test "rdifrango\100captechventures.com" do
      assert_contributor_names '42576fff', 'Ron DiFrango'
    end

    test 'redbeard' do
      assert_contributor_names '0230fc96', 'Tal Rotbart'
    end

    test 'redinger' do
      assert_contributor_names '1d32cec1', 'Christopher Redinger'
    end

    test 'regonn' do
      assert_contributor_names '902fef37', 'Kenta Tanoue'
    end

    test 'ReinH' do
      assert_contributor_names 'b30de603', 'Rein Henrichs'
    end

    test 'remvee' do
      assert_contributor_names '66e97c34', "Remco van 't Veer"
    end

    test 'remy' do
      assert_contributor_names 'b2dd357d', 'Rémy Coutable'
    end

    test "rephorm\100rephorm.com" do
      assert_contributor_names 'b84a7beb', 'Brian Mattern'
    end

    test 'retr0h' do
      assert_contributor_names 'cbdb4aa2', 'John Dewey'
    end

    test 'reu' do
      assert_contributor_names '77c099c2', 'Rodrigo Navarro'
    end

    test 'revans' do
      assert_contributor_names 'be0c4536', 'Robert Evans'
    end

    test 'Rich Olson' do
      assert_contributor_names '9025e5d4', 'Rick Olson'
    end

    test 'richcollins' do
      assert_contributor_names '6f559f87', 'Rich Collins'
    end

    test "richcollins\100gmail.com" do
      assert_contributor_names '1d4d037b', 'Rich Collins'
    end

    test 'Rick' do
      assert_contributor_names 'e41f4894', 'Rick Olson'
    end

    test 'rick' do
      assert_contributor_names '083b0b7f', 'Rick Olson'
    end

    test 'Rick Olsen' do
      assert_contributor_names '5b9b904f', 'Rick Olson'
    end

    test "rick\100rickbradley.com" do
      assert_contributor_names 'c4233a0e', 'Rick Bradley'
    end

    test 'Riley' do
      assert_contributor_names '380800e4', 'Riley Lynch'
    end

    test 'rizwanreza' do
      assert_contributor_names 'd1202cfe', 'Rizwan Reza'
    end

    test 'rmacklin' do
      assert_contributor_names 'aa1ba9cb', 'Richard Macklin'
    end

    test 'rmm5t' do
      assert_contributor_names 'd761ac40', 'Ryan McGeary'
    end

    test 'Rob' do
      assert_contributor_names 'a25296ab', 'Rob Anderton'
    end

    test "rob.rasmussen\100gmail.com" do
      assert_contributor_names 'c5d5c4f7', 'Rob Rasmussen'
    end

    test "robbat2\100gentoo.org" do
      assert_contributor_names '2a12b568', 'Robin H. Johnson'
    end

    test 'robbyrussell' do
      assert_contributor_names 'e38ad5dd', 'Robby Russell'
    end

    test 'Robert Pankowecki (Gavdi)' do
      assert_contributor_names 'e95b5b30', 'Robert Pankowecki'
    end

    test 'RobertZK' do
      assert_contributor_names 'a7235192', 'Robert Krzyzanowski'
    end

    test 'robertomiranda' do
      assert_contributor_names 'a316c099', 'Roberto Miranda'
    end

    test 'robinjfisher' do
      assert_contributor_names '8091ed54', 'Robin Fisher'
    end

    test 'rockrep' do
      assert_contributor_names 'f7dbf388', 'Michael Kintzer'
    end

    test 'roderickvd' do
      assert_contributor_names 'b14378cd', 'Roderick van Domburg'
    end

    test 'rohit' do
      assert_contributor_names '39cb27b4', 'Rohit Arondekar'
    end

    test 'Roman Le Negrate' do
      assert_contributor_names 'a0c677c8', 'Roman Le Négrate'
    end

    test 'Roman2K' do
      assert_contributor_names '6ee09b6a', 'Roman Le Négrate'
    end

    test 'RomD' do
      assert_contributor_names 'd6ae930c', 'Roman Dittert'
    end

    test "ror\100philippeapril.com" do
      assert_contributor_names '62d749ab', 'Philippe April'
    end

    test 'Ross Kaffenburger' do
      assert_contributor_names '523f3ba8', 'Ross Kaffenberger'
    end

    test 'rpheath' do
      assert_contributor_names '1ab2ff58', 'Ryan Heath'
    end

    test 'rpq' do
      assert_contributor_names '510502ee', 'Ramon Quezada'
    end

    test "rramdas\100gmail.com" do
      assert_contributor_names '40c86a7b', 'Rodney Ramdas'
    end

    test 'rsanheim' do
      assert_contributor_names 'af43e87f', 'Rob Sanheim'
    end

    test "rscottmace\100gmail.com" do
      assert_contributor_names '8e8bf37a', 'Scott Mace'
    end

    test 'rsl' do
      assert_contributor_names 'ba342c2c', 'Russell Norris'
    end

    test 'RSL' do
      assert_contributor_names '6ccbef58', 'Russell Norris'
    end

    test 'rspeicher' do
      assert_contributor_names '0da754dc', 'Robert Speicher'
    end

    test "rtomayko\100gmail.com" do
      assert_contributor_names '9db8f3e5', 'Ryan Tomayko'
    end

    test "ruben.nine\100gmail.com" do
      assert_contributor_names '9935a356', 'Ruben Nine'
    end

    test "ruby\100bobsilva.com" do
      assert_contributor_names '231a464d', 'Bob Silva'
    end

    test "rubyonrails\100beautifulpixel.com" do
      assert_contributor_names '3fb29b17', 'Alex Wayne'
    end

    test 'RubyRedRick' do
      assert_contributor_names 'bef071dd', 'Rick DeNatale'
    end

    test 'rubyruy' do
      assert_contributor_names 'da5d8fa6', 'Ruy Asan'
    end

    test 'rusikf' do
      assert_contributor_names '47896b3d', 'Ruslan Korolev'
    end

    test 'rwdaigle' do
      assert_contributor_names '9b8399fb', 'Ryan Daigle'
    end

    test 'Ryan Davis' do
      assert_contributor_names '2890b964', 'Ryan Davis (zenspider)'
    end

    test 'Ryunosuke Sato' do
      assert_contributor_names 'd022fce9', 'Ryunosuke Sato'
    end

    test "ryan.raaum\100gmail.com" do
      assert_contributor_names '0f0d926d', 'Ryan Raaum'
    end

    test 'ryanb' do
      assert_contributor_names '94502623', 'Ryan Bates'
    end

    test "ryand-ruby\100zenspider.com" do
      assert_contributor_names 'a2f0ae76', 'Ryan Davis (zenspider)'
    end

    test 'ryepup' do
      assert_contributor_names '2fac5d1a', 'Ryan Davis (ryepup)'
    end

    test 'Sachin87' do
      assert_contributor_names 'c1763975', 'Sachin Singh'
    end

    test 'saimonmoore' do
      assert_contributor_names 'c1bc61cb', 'Simon Moore'
    end

    test 'saksmlz' do
      assert_contributor_names '68307a1a', 'Aliaxandr Rahalevich'
    end

    test "sam.kirchmeier\100gmail.com" do
      assert_contributor_names '35b4bdcf', 'Sam Kirchmeier'
    end

    test 'Sam Phippen' do
      assert_contributor_names 'eba36182', 'Penelope Phippen'
    end

    test 'Samuel Elliott' do
      assert_contributor_names '31ea83eb', 'Sam Elliott'
    end

    test 'Samus_' do
      assert_contributor_names 'b4b6ffe1', 'Michael Cetrulo'
    end

    test 'sandofsky' do
      assert_contributor_names '2ba88647', 'Ben Sandofsky'
    end

    test "sandra.metz\100duke.edu" do
      assert_contributor_names '242cd060', 'Sandi Metz'
    end

    test 'sanemat' do
      assert_contributor_names '3b98fb77', 'Murahashi Sanemat Kenichi'
    end

    test 'sblackstone' do
      assert_contributor_names '49f2e6f8', 'Stephen Blackstone'
    end

    test 'Schneems' do
      assert_contributor_names 'a8870d14', 'Richard Schneeman'
    end

    test "\100schneems" do
      assert_contributor_names 'ef91cddb', 'Richard Schneeman'
    end

    test 'schneems' do
      assert_contributor_names '921dcc25', 'Richard Schneeman'
    end

    test "schoenm\100earthlink.net" do
      assert_contributor_names '0293c344', 'Michael Schoen'
    end

    test "sco\100scottraymond.net" do
      assert_contributor_names '0925c6b6', 'Scott Raymond'
    end

    test "scott\100sigkill.org" do
      assert_contributor_names 'ad24c6d7', 'Scott Laird'
    end

    test 'scott_willson' do
      assert_contributor_names 'd64832c0', 'Scott Willson'
    end

    test 'ScottSchram' do
      assert_contributor_names 'a0c925c0', 'Scott Schram'
    end

    test 'Sen Zhang' do
      assert_contributor_names 'd57356bd', 'Sen Zhang'
    end

    test 'scottwillson' do
      assert_contributor_names 'c75cfa0e', 'Scott Willson'
    end

    test "sd\100notso.net" do
      assert_contributor_names '35240ba6', 'Sebastian Delmont'
    end

    test 'sdsykes' do
      assert_contributor_names '0da23575', 'Stephen Sykes'
    end

    test 'sealocal' do
      assert_contributor_names '27a4e934', 'Mike Taylor'
    end

    test 'Sean Griffin' do
      assert_contributor_names '332c3364', 'Siân Griffin'
    end

    test "sean\100ardismg.com" do
      assert_contributor_names '2876efb7', 'Sean T Allen'
    end

    test 'seangeo' do
      assert_contributor_names 'c81fff24', 'Sean Geoghegan'
    end

    test 'seanhussey' do
      assert_contributor_names '18a3333a', 'Sean Hussey'
    end

    test 'seapy' do
      assert_contributor_names '6c252b5c', 'Jeong Changhoon'
    end

    test 'sebastian.kanthak' do
      assert_contributor_names '78a732bf', 'Sebastian Kanthak'
    end

    test "sebastian.kanthak\100muehlheim.de" do
      assert_contributor_names 'b1a4f91a', 'Sebastian Kanthak'
    end

    test "self\100mattmower.com" do
      assert_contributor_names '9bafd353', 'Matt Mower'
    end

    test 'Semyon Perepelitsa' do
      assert_contributor_names '540ebe37', 'Simon Perepelitsa'
    end

    test "sergeykojin\100gmail.com" do
      assert_contributor_names 'ba5591f2', 'Sergey Kojin'
    end

    test 'Sergio Gil Pérez de la Manga' do
      assert_contributor_names 'de178dfe', 'Sergio Gil'
    end

    test 'sethladd' do
      assert_contributor_names '32b31a2d', 'Seth Ladd'
    end

    test 'sgerrand' do
      assert_contributor_names 'f40a3ea8', 'Sasha Gerrand'
    end

    test "\100sgrif" do
      assert_contributor_names '2bbcca00', 'Siân Griffin'
    end

    test 'sgrif' do
      assert_contributor_names '92a60338', 'Siân Griffin'
    end

    test 'sh6khan' do
      assert_contributor_names '319baed4', 'Sadman Khan'
    end

    test "shimbo\100is.naist.jp" do
      assert_contributor_names '6aaa08d8', 'Masashi Shimbo'
    end

    test 'shingo-nakanishi' do
      assert_contributor_names 'd089fe28', 'shingo-nakanishi'
    end

    test 'shioimm' do
      assert_contributor_names 'f5e2d983', 'Misaki Shioi'
    end

    test 'shock_one' do
      assert_contributor_names 'ec1b715b', 'Volodymyr Shatsky'
    end

    test 'shtirlic' do
      assert_contributor_names 'c2b79c01', 'Serg Podtynnyi'
    end

    test 'shugo' do
      assert_contributor_names '4699c336', 'Shugo Maeda'
    end

    test "shugo\100ruby-lang.org" do
      assert_contributor_names '21cf3c65', 'Shugo Maeda'
    end

    test 'ShunsukeAida' do
      assert_contributor_names '9982138a', 'Shunsuke Aida'
    end

    test 'shunsukeaida' do
      assert_contributor_names '884d123e', 'Shunsuke Aida'
    end

    test "shup_d\100cube.(none)" do
      assert_contributor_names '72608521', 'Josh Peek'
    end

    test 'Si' do
      assert_contributor_names '9b24e119', 'Si Jobling'
    end

    test "simon\100redhillconsulting.com.au" do
      assert_contributor_names '2043513f', 'Simon Harris'
    end

    test "simon.stapleton\100gmail.com" do
      assert_contributor_names '16e41c6b', 'Simon Stapleton'
    end

    test 'simonjefford' do
      assert_contributor_names 'd44ce1cb', 'Simon Jefford'
    end

    test 'simply-phi' do
      assert_contributor_names 'ac07da8f', 'Ibrahim Abdullah'
    end

    test 'siong1987' do
      assert_contributor_names '5df9d008', 'Teng Siong Ong'
    end

    test 'sjain1107' do
      assert_contributor_names 'c351a823', 'Sakshi Jain'
    end

    test 'sjgman9' do
      assert_contributor_names 'fade31ad', 'Sam Granieri'
    end

    test 'skae' do
      assert_contributor_names '56407737', 'Stefan Kaes'
    end

    test 'skaen' do
      assert_contributor_names 'c8b4cf65', 'Stefan Kaes'
    end

    test 'Skaes' do
      assert_contributor_names '689cca13', 'Stefan Kaes'
    end

    test 'skaes' do
      assert_contributor_names 'e3670a0e', 'Stefan Kaes'
    end

    test "skaes\100web.de" do
      assert_contributor_names '5d61d233', 'Stefan Kaes'
    end

    test 'skaes.web.de' do
      assert_contributor_names '31ae8121', 'Stefan Kaes'
    end

    test 'skanthak' do
      assert_contributor_names '693e0df3', 'Sebastian Kanthak'
    end

    test 'slainer68' do
      assert_contributor_names '6241d4e5', 'Nicolas Blanco'
    end

    test 'smeade' do
      assert_contributor_names '68849e32', 'Scott Meade'
    end

    test 'snusnu' do
      assert_contributor_names 'ce50c960', 'Martin Gamsjaeger'
    end

    test 'soartec-lab' do
      assert_contributor_names '0fecd266', 'Shodai Suzuki'
    end

    test "solo\100gatelys.com" do
      assert_contributor_names '796a43de', 'Solomon White'
    end

    test "somekool\100gmail.com" do
      assert_contributor_names '4fc6c872', 'Mathieu Jobin'
    end

    test 'sonnym' do
      assert_contributor_names '0950d409', 'Sonny Michaud'
    end

    test 'Spakman' do
      assert_contributor_names 'eede82cc', 'Mark Somerville'
    end

    test 'spicycode' do
      assert_contributor_names '86706313', 'Chad Humphries'
    end

    test 'spyhole' do
      assert_contributor_names 'cd31eb19', 'Johnson Wang'
    end

    test 'Squeegy' do
      assert_contributor_names '2b6954aa', 'Alex Wayne'
    end

    test 'sshaw' do
      assert_contributor_names 'f9369c0f', 'Skye Shaw'
    end

    test "ssinghi\100kreeti.com" do
      assert_contributor_names 'f3aa7c1e', 'Surendra Singhi'
    end

    test 'ssoroka' do
      assert_contributor_names '519c5c75', 'Steven Soroka'
    end

    test 'st0012' do
      assert_contributor_names 'e8688ddb', 'Stan Lo'
    end

    test 'Stanislav' do
      assert_contributor_names '40f1642b', 'Stanislav Sobolev'
    end

    test "starr\100starrnhorne.com" do
      assert_contributor_names 'ebc0a38d', 'Starr Horne'
    end

    test 'Stefan' do
      assert_contributor_names 'db7fadd7', 'Stefan Kaes'
    end

    test 'stellsmi' do
      assert_contributor_names 'af98d883', 'Jeremy Lightsmith'
    end

    test 'Stephan Kaes' do
      assert_contributor_names '7fe3fd23', 'Stefan Kaes'
    end

    test "stephen\100touset.org" do
      assert_contributor_names '2876efb7', 'Stephen Touset'
    end

    test "stephen_purcell\100yahoo.com" do
      assert_contributor_names 'b0a86f8c', 'Steve Purcell'
    end

    test "stephenh\100chase3000.com" do
      assert_contributor_names '1a6954af', 'Stephen Haberman'
    end

    test 'steve' do
      assert_contributor_names '60a6284a', 'Steven Bristol'
    end

    test 'Steve St. Martin' do
      assert_contributor_names '679a0bf1', 'Stephen St. Martin'
    end

    test 'stevenbristol' do
      assert_contributor_names '5af44634', 'Steven Bristol'
    end

    test 'sthollmann' do
      assert_contributor_names '164af1f9', 'Stefan Hollmann'
    end

    test "stian\100grytoyr.net" do
      assert_contributor_names '7a6a923f', 'Stian Grytøyr'
    end

    test "stlruby\100googlegroups.com" do
      assert_contributor_names 'ee04aea3', 'St. Louis Ruby Users Group'
    end

    test 'stopdropandrew' do
      assert_contributor_names '083b0b7f', 'Andrew Grim'
    end

    test 'subelsky' do
      assert_contributor_names 'f596dda0', 'Mike Subelsky'
    end

    test 'suchasurge' do
      assert_contributor_names 'b99fb66f', 'Frank Müller'
    end

    test 'Sudara' do
      assert_contributor_names 'e848ab52', 'Sudara Williams'
    end

    test 'sue445' do
      assert_contributor_names 'a913af96', 'Go Sueyoshi'
    end

    test 'SUGINO Yasuhiro' do
      assert_contributor_names '4a36eb64', 'Sugino Yasuhiro'
    end

    test 'suginoy' do
      assert_contributor_names '4f6f4333', 'Sugino Yasuhiro'
    end

    test 'Sunny' do
      assert_contributor_names 'ce40df20', 'Sunny Ripert'
    end

    test 'stve' do
      assert_contributor_names 'e80d9f41', 'Steve Agalloco'
    end

    test 'sur' do
      assert_contributor_names '8b2a6014', 'Sur Max'
    end

    test 'sveiss' do
      assert_contributor_names 'b3b0a0c3', 'Stephen Veiss'
    end

    test "sveit\100tradeharbor.com" do
      assert_contributor_names '3398f74d', 'Stephen Veit'
    end

    test "sabrams86" do
      assert_contributor_names '95f4d751', 'Steven Abrams'
    end

    test "sven\100c3d2.de" do
      assert_contributor_names '4b3e964a', 'Sven Klemm'
    end

    test 'Sven Kraeuter | 5v3n' do
      assert_contributor_names 'a1c7b0ec', 'Sven Kräuter'
    end

    test 'swapdisc' do
      assert_contributor_names '5105b893', 'Joe Lewis'
    end

    test "t.lucas\100toolmantim.com" do
      assert_contributor_names '6a83ebfe', 'Tim Lucas'
    end

    test 'Tadas Tamosauskas' do
      assert_contributor_names 'f292f097', 'Tadas Tamošauskas'
    end

    test 'tagoh' do
      assert_contributor_names 'c554a9ca', 'Akira Tagoh'
    end

    test "takiuchi\100drecom.co.jp" do
      assert_contributor_names '06411f42', 'Genki Takiuchi'
    end

    test 'takkanm' do
      assert_contributor_names 'fa1ea34c' ,'Mitsutaka Mimura'
    end

    test 'takmar' do
      assert_contributor_names 'ea49d271' ,'Takuma Yoshida'
    end

    test 'Takuma' do
      assert_contributor_names 'de39164b' ,'Takuma Yoshida'
    end

    test 'tank-bohr' do
      assert_contributor_names 'f3101fd0', 'Alexey Nikitin'
    end

    test 'tanmay3011' do
      assert_contributor_names '2e51d6f9', 'Tanmay Sinha'
    end

    test 'tarmo' do
      assert_contributor_names 'fd3f048f', 'Tarmo Tänav'
    end

    test 'tarmo_t' do
      assert_contributor_names '6b1901da', 'Tarmo Tänav'
    end

    test 'taryn' do
      assert_contributor_names 'ce61a6bd', 'Taryn East'
    end

    test 'tashian' do
      assert_contributor_names 'e95b9659', 'Carl Tashian'
    end

    test 'technomancy' do
      assert_contributor_names '673daeab', 'Phil Hagelberg'
    end

    test "technomancy\100gmail.com" do
      assert_contributor_names 'f1a350a0', 'Phil Hagelberg'
    end

    test "technoweenie\100gmail.com" do
      assert_contributor_names 'df7a4d49', 'Rick Olson'
    end

    test 'Tekin' do
      assert_contributor_names 'd7c2e52c', 'Tekin Suleyman'
    end

    test 'Teo Hui Ming' do
      assert_contributor_names 'b307210d', 'Huiming Teo'
    end

    test 'thechrisoshow' do
      assert_contributor_names '5a5b0b8b', "Chris O'Sullivan"
    end

    test 'theflow' do
      assert_contributor_names '63e96879', 'Florian Munz'
    end

    test 'thenickcox' do
      assert_contributor_names '431b236f', 'Nick Cox'
    end

    test 'Theory' do
      assert_contributor_names '38deb0ed', 'David E. Wheeler'
    end

    test 'thewoolleyman' do
      assert_contributor_names '2bfd6772', 'Chad Woolley'
    end

    test 'thiagoaugusto' do
      assert_contributor_names '361f1bc7', 'Thiago Augusto'
    end

    test "thijs\100fngtps.com" do
      assert_contributor_names '7864d0e0', 'Thijs van der Vossen'
    end

    test "thijs\100vandervossen.net" do
      assert_contributor_names '74896c02', 'Thijs van der Vossen'
    end

    test 'thijsv' do
      assert_contributor_names '15b1b889', 'Thijs van der Vossen'
    end

    test 'thoefer' do
      assert_contributor_names '1863f127', 'Tom Hoefer'
    end

    test "thomas\100columbus.rr.com" do
      assert_contributor_names '3553b59d', 'Tom Lieber'
    end

    test "thomas\100fesch.at" do
      assert_contributor_names '7d010055', 'Thomas Fuchs'
    end

    test "tietew\100tietew.net" do
      assert_contributor_names '3080b273', 'Tietew'
    end

    test 'timc' do
      assert_contributor_names 'd4b6671c', 'Tim Carpenter'
    end

    test "timct\100mac.com" do
      assert_contributor_names '0d52abfd', 'Tim Trautmann'
    end

    test 'Time Pope' do
      assert_contributor_names 'e2ad603f', 'Tim Pope'
    end

    test 'Timm' do
      assert_contributor_names 'ff1b7e75', 'Kasper Timm Hansen'
    end

    test 'Tima Maslyuchenko' do
      assert_contributor_names '633ea6a8', 'Tim Masliuchenko'
    end

    test 'tinogomes' do
      assert_contributor_names '51215937', 'Celestino Gomes'
    end

    test 'tleneveu' do
      assert_contributor_names '3d226869', 'Thibaut Leneveu'
    end

    test 'tmacedo' do
      assert_contributor_names '1370d157', 'Tiago Macedo'
    end

    test "tmornini\100infomania.com" do
      assert_contributor_names '311342d8', 'Tom Mornini'
    end

    test 'tnp' do
      assert_contributor_names 'bdba7481', 'Troels Petersen'
    end

    test 'Tobias Luekte' do
      assert_contributor_names 'f1880cac', 'Tobias Lütke'
    end

    test 'Tobias Luetke' do
      assert_contributor_names '553c23df', 'Tobias Lütke'
    end

    test 'TobiasLuetke' do
      assert_contributor_names 'd4e02f75', 'Tobias Lütke'
    end

    test 'toby cabot' do
      assert_contributor_names 'bdfddb09', 'Toby Cabot'
    end

    test 'todd' do
      assert_contributor_names 'a7a1c4e2', 'Todd Gehman'
    end

    test "todd\100robotcoop.com" do
      assert_contributor_names '45ee71af', 'Todd Gehman'
    end

    test "tom\100craz8.com" do
      assert_contributor_names '838ec413', 'Tom Fakes'
    end

    test "tom.enebo\100gmail.com" do
      assert_contributor_names 'fc042435', 'Thomas Enebo'
    end

    test "tom\100moertel.com" do
      assert_contributor_names '43c470fa', 'Tom Moertel'
    end

    test "tom\100popdog.net" do
      assert_contributor_names '5779deb8', 'Tom Ward'
    end

    test 'Tom ward' do
      assert_contributor_names '0555fc90', 'Tom Ward'
    end

    test 'tomafro' do
      assert_contributor_names 'ccb87e2f', 'Tom Ward'
    end

    test 'tomhuda' do
      assert_contributor_names '00be5bd7', 'Yehuda Katz', 'Tom Dale'
    end

    test 'TomK32' do
      assert_contributor_names '235cd218', 'Thomas R. Koll'
    end

    test 'Toshimaru' do
      assert_contributor_names 'd9ff835b', 'Toshimaru'
    end

    test 'tomtoday' do
      assert_contributor_names 'b1aa6741', 'Tom Brice'
    end

    test "tomtoday\100gmail.com" do
      assert_contributor_names '5f4f4b03', 'Tom Brice'
    end

    test 'toolmantim' do
      assert_contributor_names '4a8d3d51', 'Tim Lucas'
    end

    test 'topfunky' do
      assert_contributor_names '2a08c454', 'Geoffrey Grosenbach'
    end

    test 'tpope' do
      assert_contributor_names 'e522f75c', 'Tim Pope'
    end

    test 'trans' do
      assert_contributor_names 'c9d43354', 'Thomas Sawyer'
    end

    test 'trek' do
      assert_contributor_names '083b0b7f', 'Trek Glowacki'
    end

    test 'tsukasaoishi' do
      assert_contributor_names '4e83815c', 'Tsukasa OISHI'
    end

    test "turnip\100turnipspatch.com" do
      assert_contributor_names '8e3bf70b', 'Jonathan Leighton'
    end

    test 'Tuxie' do
      assert_contributor_names '3c877ecd', 'Per Wigren'
    end

    test "tuxie\100dekadance.se" do
      assert_contributor_names '813a8b9d', 'Per Wigren'
    end

    test 'twinturbo' do
      assert_contributor_names 'dee375a9', 'Adam Hawkins'
    end

    test "twoggle\100gmail.com" do
      assert_contributor_names '8b8a30dd', 'Tim Fletcher'
    end

    test "tyler\100kianta.com" do
      assert_contributor_names 'c0f84b11', 'Tyler Kiley'
    end

    test "tyler.kovacs\100gmail.com" do
      assert_contributor_names '5b3bc313', 'Tyler Kovacs'
    end

    test 'tzaharia' do
      assert_contributor_names '8ff92e24', 'Tieg Zaharia'
    end

    test 'Ugis Ozols' do
      assert_contributor_names '3ca1bc38', 'Uģis Ozols'
    end

    test 'Ulysses' do
      assert_contributor_names 'c6ea1d36', 'Nicholas Seckar'
    end

    test 'vanderhoop' do
      assert_contributor_names 'b345fc25', 'Travis Vander Hoop'
    end

    test 'vertigoclinic' do
      assert_contributor_names '9aa81749', 'Greg Miller'
    end

    test "victor-ronr-trac\100carotena.net" do
      assert_contributor_names '473e5bde', 'Victor Jalencas'
    end

    test 'vijay' do
      assert_contributor_names '80007199', 'Vijay Dev'
    end

    test "vinbarnes\100gmail.com" do
      assert_contributor_names '18e2188f', 'Kevin Barnes'
    end

    test 'virusman' do
      assert_contributor_names '921305b0', 'Victor Babenko'
    end

    test 'vitaly' do
      assert_contributor_names '762fc544', 'Vitaly Kushner'
    end

    test 'vladr' do
      assert_contributor_names '8091ed54', 'Vlad Romascanu'
    end

    test 'WAKASUGI 5T111111' do
      assert_contributor_names '0176aef1', 'Hirofumi Wakasugi'
    end

    test 'wallerjake' do
      assert_contributor_names '9bc4eb7e', 'Jake Waller'
    end

    test 'wangchun' do
      assert_contributor_names 'c6a3a39f', 'Wang Chun'
    end

    test 'wangjohn' do
      assert_contributor_names '3182295c', 'John J. Wang'
    end

    test 'watson' do
      assert_contributor_names 'defb4d08', 'Thomas Watson Steen'
    end

    test 'watsonian' do
      assert_contributor_names 'edd59b7b', 'Joel Watson'
    end

    test "wbruce\100gmail.com" do
      assert_contributor_names 'df70e28e', 'Bruce Williams'
    end

    test "wejn\100box.cz" do
      assert_contributor_names '88bb279d', 'Michal Šafránek'
    end

    test 'wesley.moxam' do
      assert_contributor_names 'e781fadd', 'Wesley Moxam'
    end

    test 'weyus' do
      assert_contributor_names '3122d321', 'Wes Gamble'
    end

    test 'wharris' do
      assert_contributor_names 'b18585fb', 'Will Harris'
    end

    test 'wildchild' do
      assert_contributor_names '65539c9f', 'Alexander Uvarov'
    end

    test 'Will' do
      assert_contributor_names 'b1bbf90d', 'Will Bryant'
    end

    test 'will.bryant' do
      assert_contributor_names 'c1abe443', 'Will Bryant'
    end

    test 'willnet' do
      assert_contributor_names '11d41c6e', 'Shinichi Maeshima'
    end

    test 'wilson' do
      assert_contributor_names '11d2a309', 'Wilson Bilkovich'
    end

    test "wilsonb\100gmail.com" do
      assert_contributor_names '584bec96', 'Wilson Bilkovich'
    end

    test 'windock' do
      assert_contributor_names '6feffe5f', 'Andrew Shcheglov'
    end

    test 'wingfire' do
      assert_contributor_names 'a9f2c124', 'Christof Spies'
    end

    test 'Winston' do
      assert_contributor_names 'b52c66f1', 'Winston Teo Yong Wei'
    end

    test 'Wintermute' do
      assert_contributor_names '7ec91d46', 'Dave Murphy'
    end

    test 'Wizard' do
      assert_contributor_names '07f92e83', 'Melih Arda Yalçiner'
    end

    test 'wmoxam' do
      assert_contributor_names '91c14e92', 'Wesley Moxam'
    end

    test "wolfgang\100stufenlos.net" do
      assert_contributor_names 'affe7c0f', 'Wolfgang Klinger'
    end

    test "work\100ashleymoran.me.uk" do
      assert_contributor_names '2a12b568', 'Ashley Moran'
    end

    test 'wycats' do
      assert_contributor_names 'fd153591', 'Yehuda Katz'
    end

    test 'wynksaiddestroy' do
      assert_contributor_names 'c4861cc6', 'Fabian Winkler'
    end

    test 'xal' do
      assert_contributor_names '0ceab811', 'Tobias Lütke'
    end

    test 'xavier' do
      assert_contributor_names '083b0b7f', 'Xavier Defrang'
    end

    test 'xaviershay' do
      assert_contributor_names '569a78cb', 'Xavier Shay'
    end

    test 'Xenda' do
      assert_contributor_names 'fabd2ce2', 'Alessandra Pereyra'
    end

    test "xyctka\100gmail.com" do
      assert_contributor_names '5890ced1', 'Vitalii Khustochka'
    end

    test 'Yamada Masaki' do
      assert_contributor_names 'f4980007', 'Masaki Yamada'
    end

    test 'YanhaoYang' do
      assert_contributor_names '2f35f613', 'Yanhao Yang'
    end

    test 'Yasuhiko Katoh (y@su)' do
      assert_contributor_names '539d929b', 'Yasuhiko Katoh'
    end

    test 'yhirano55' do
      assert_contributor_names '5af7d475', 'Yoshiyuki Hirano'
    end

    test 'ymendel' do
      assert_contributor_names '173e2d27', 'Yossef Mendelssohn'
    end

    test 'yob' do
      assert_contributor_names '656a20a4', 'James Healy'
    end

    test 'yon' do
      assert_contributor_names '2f254137', 'Yonatan Feldman'
    end

    test "yon\100milliped.com" do
      assert_contributor_names '908e9a17', 'Yonatan Feldman'
    end

    test "yrashk\100fp.org.ua" do
      assert_contributor_names '2ad8dc6a', 'Yurii Rashkovskii'
    end

    test "yrashk\100gmail.com" do
      assert_contributor_names 'f3e5e079', 'Yurii Rashkovskii'
    end

    test 'ysbaddaden' do
      assert_contributor_names 'b0f2b94d', 'Julien Portalier'
    end

    test 'yuki3738' do
      assert_contributor_names '17bb531f', 'Yuki Minamiya'
    end

    test 'yuuji.yaginuma' do
      assert_contributor_names '4fded7c0', 'Yuuji Yaginuma'
    end

    test 'Yuji Yaginuma' do
      assert_contributor_names 'fbd33b91', 'Yuuji Yaginuma'
    end

    test 'yury' do
      assert_contributor_names '3df90def', 'Yury Korolev'
    end

    test 'yyyc514' do
      assert_contributor_names 'dad3e835', 'Josh Goebel'
    end

    test "z\100wzph.com" do
      assert_contributor_names 'd9839c19', 'Zachary Holt'
    end

    test 'zackchandler' do
      assert_contributor_names 'd6f6a41f', 'Zack Chandler'
    end

    test "zaitzow\100gmail.com" do
      assert_contributor_names '08fd13d1', 'August Zaitzow Flatby'
    end

    test 'Zamith' do
      assert_contributor_names '6f418a09', 'Luís Ferreira'
    end

    test 'zapnap' do
      assert_contributor_names '096f3f64', 'Nick Plante'
    end

    test 'zdennis' do
      assert_contributor_names '57cde631', 'Zach Dennis'
    end

    test 'zenspider' do
      assert_contributor_names 'a86e5949', 'Ryan Davis (zenspider)'
    end

    test 'zhengjia' do
      assert_contributor_names '55759a66', 'Zheng Jia'
    end

    test 'zires' do
      assert_contributor_names '35f38b71', 'Thierry Zires'
    end

    test "zraii\100comcast.net" do
      assert_contributor_names '9d8e3480', 'Martin Emde'
    end

    test 'Zachary Scott' do
      assert_contributor_names '3cfbee61', 'zzak'
    end

    test 'zsombor' do
      assert_contributor_names '2227a178', 'Dee Zsombor'
    end

    test 'प्रथमेश' do
      assert_contributor_names '41739a26', 'Prathamesh Sonpatki'
    end

    test 'प्रथमेश Sonpatki' do
      assert_contributor_names 'a7a2bc0f', 'Prathamesh Sonpatki'
    end
  end
end

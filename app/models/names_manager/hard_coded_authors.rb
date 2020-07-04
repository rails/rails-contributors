module NamesManager
  module HardCodedAuthors
    # Sometimes the information to give credit for some commits is just not
    # present in the repository, or is present in a way the application does
    # not understand. This method has a hard-coded list of contributor names
    # for those commits.
    #
    # See the comment in each case for their justification.
    #
    # Please add commits here very exceptionally, only when there's no way
    # we can extract the candidates from the commit. False positives are
    # handled by NamesManager::FalsePositives, and regular aliases are managed
    # by NamesManager::CanonicalNames.
    def hard_coded_authors(commit)
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
        # These were Xavier's edits that for some reason were committed by Mikel.
        ['Xavier Noria']
      when '3b1c69d2dd2b24a29e4443d7dc481589320a3f3e'
        # This was a patch from a bugmash that was applied by Xavier directly.
        # See https://rails.lighthouseapp.com/projects/8994/tickets/4284.
        ['Kieran Pilkington']
      when 'a4041c5392457448cfdfef2e1b24007cfa46948b'
        # Vishnu forked using a different email address, and credit goes in the git commit
        # to Vishnu K. Sharma because of that, but the commit is his.
        ['Vishnu Atrai']
      when 'ec44763f03b49e8c6e3bff71772ba32863a01306'
        # Mohammad El-Abid asked for this fix on Twitter (see https://twitter.com/The_Empty/status/73864303123496960).
        ['Mohammad Typaldos']
      when '99dd117d6292b66a60567fd950c7ca2bda7e01f3'
        # Same here.
        ['Mohammad Typaldos']
      when '3582bce6fdb30730b34b91a17b8bb33066eed7b8'
        # The attribution was wrong, and amended later in 33736bc18a9733d95953f6eaec924db10badc908.
        ['Juanjo Bazán', 'Tarmo Tänav', 'BigTitus']
      when '7e8e91c439c1a877f867cd7ba634f7297ccef04b'
        # Credit was given in a non-conventional manner.
        ['Godfrey Chan', 'Philippe Creux']
      when '798881ecd4510b9e1e5e10529fc2d81b9deb961e', '134c1156dd5713da41c62ff798fe3979723e64cc'
        # Idem.
        ['Godfrey Chan', 'Sergio Campamá']
      when 'b23ffd0dac895aa3fd3afd8d9be36794941731b2'
        # See https://github.com/rails/rails/pull/13692#issuecomment-33617156.
        ['Łukasz Sarnacki', 'Matt Aimonetti']
      when '1240338a02e5decab2a94b651fff78889d725e31'
        # Blake and Arthur paired on this YAML compatibility backport.
        ['Blake Mesdag', 'Arthur Neves']
      when 'd318badc269358c53d9dfb4000e8c4c21a94b578'
        # Adrien worked on the fix, Grey on a regression spec, but only Grey's PR
        # was merged. See https://github.com/fxn/rails-contributors/pull/59.
        ['Grey Baker', 'Adrien Siami']
      when '41adf8710e695f01a8100a87c496231d29e57cf2'
        # This commit uses non-conventional notation for multiple credits.
        ['Mislav Marohnić', 'Geoff Buesing']
      when '6ddde027c4e51262e58f67438672d66a2b278f43'
        # Idem.
        ['Arthur Zapparoli', 'Michael Koziarski']
      when '063c393bf0a2eb762770c97f925b7c2867361ad4'
        ['ivanvr']
      when '872e22c60391dc45b7551cc0698d5530bb310611'
        # This patch comes from https://github.com/rails/web-console/pull/91,
        # originally authored by Daniel, but ported to upstream Rails by Genadi.
        ['Daniel Rikowski', 'Genadi Samokovarov']
      when '92209356c310caabda8665d6369d3b1e4a1800d1'
        # Tsukuru Tanimichi originally worked on the PR, but Aaron Patterson and
        # Eileen Uchitelle changed the implementation on a separate branch.
        ['Eileen M. Uchitelle', 'Aaron Patterson', 'Tsukuru Tanimichi']
      when '9668cc3bb03740b13477df0832332eec71563bc5'
        # Backport of the above commit.
        ['Eileen M. Uchitelle', 'Aaron Patterson', 'Tsukuru Tanimichi']
      when '4f1472d4de37f1f77195c36390ce8bb65bb61e71'
        # The metadata for this commit completely lacks the name of the original
        # author. You'll see there only stuff related to ImgBot.
        ['John Bampton']
      else
        nil
      end
    end
  end
end

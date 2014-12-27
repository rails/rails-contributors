require 'set'

module NamesManager
  extend HardCodedAuthors
  extend FalsePositives
  extend CanonicalNames

  # Determines whether names mapping or special cases handling have been updated
  # since +ts+.
  def self.updated_since?(ts)
    [__FILE__, *Dir.glob("#{__dir__}/names_manager/*.rb")].any? do |filename|
      File.mtime(filename) > ts
    end
  end

  # Removes email addresses (anything between <...>), and strips whitespace.
  def self.sanitize(name)
    name.sub(/<[^>]+>/, '').strip
  end
end

__END__

PEOPLE_WHO_PREFER_THEIR_HANDLER_TO_BE_LISTED = %w(
  okkez
  maiha
  burningTyger
)

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

# I sent an internal message to these people asking for confirmation or full names.
GITHUB_HANDLERS_WAITING_FOR_CONFIRMATION = %w(
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

# These author names match GitHub handlers, but we know they are not them.
GITHUB_HANDLERS_WHO_ARE_NOT_THEM = [
  'adam',
  'alex',
  'Andreas',
  'Caleb', # but wrote to Caleb Tennis, waiting for
  'dan',
  'jamesh',
  'jonathan',
  'Kent',
  'mat',
  'Scott',
  'seth',
  'steve',
  'trevor'
]

# We know he handler "todd" is not Todd Hanson.

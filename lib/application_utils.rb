require 'fileutils'

module ApplicationUtils
  # This is a simple file-based synchronization mechanism which is not atomic
  # but will do for our purposes.
  def self.acquiring_sync_file(basename)
    sync_file = File.join(tmpdir, basename)
    if File.exists?(sync_file)
      Rails.logger.info("couldn't acquire #{sync_file}")
    else
      Rails.logger.info("acquiring #{sync_file}")
      FileUtils.touch(sync_file)
      begin
        yield
      ensure
        Rails.logger.info("releasing #{sync_file}")
        FileUtils.rm_f(sync_file)
      end
    end
  end

  # Returns the name of the tmp directory under <tt>Rails.root</tt>. It creates
  # it if needed.
  def self.tmpdir
    tmpdir = File.join(Rails.root, 'tmp')
    Dir.mkdir(tmpdir) unless File.exists?(tmpdir)
    tmpdir
  end
end
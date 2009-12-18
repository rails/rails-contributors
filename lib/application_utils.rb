require 'fileutils'

module ApplicationUtils
  def self.acquiring_lock_file(basename)
    abs_name = File.join(tmpdir, basename)
    sync_file = File.open(abs_name, File::CREAT | File::EXCL | File::WRONLY)
    Rails.logger.info("acquired lock file #{basename}")
    sync_file.write("#{$$}\n")
    begin
      yield
    ensure
      Rails.logger.info("releasing lock file #{basename}")
      sync_file.close
      FileUtils.rm_f(abs_name)
    end
  rescue Errno::EEXIST
    Rails.logger.info("couldn't acquire lock file #{basename}")
  end

  # Returns the name of the tmp directory under <tt>Rails.root</tt>. It creates
  # it if needed.
  def self.tmpdir
    tmpdir = File.join(Rails.root, 'tmp')
    Dir.mkdir(tmpdir) unless File.exists?(tmpdir)
    tmpdir
  end
end
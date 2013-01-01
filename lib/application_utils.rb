require 'fileutils'

module ApplicationUtils
  def self.acquiring_lock_file(basename)
    abs_name = File.join(tmpdir, basename)
    lock_file = File.open(abs_name, File::CREAT | File::EXCL | File::WRONLY)
    Rails.logger.info("acquired lock file #{basename}")
    lock_file.write("#{$$}\n")
    begin
      yield
    ensure
      Rails.logger.info("releasing lock file #{basename}")
      lock_file.close
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

  # Expires the page caches in the public directory.
  #
  # We do that in two steps: first we move root dirs into a new directory, and
  # then we remove those ones. It is done that way because if we rm -rf directly
  # and at the same time requests come and create new cache files a black hole
  # can be created and handling that is beyond the legendary robustness of this
  # website.
  #
  # On the other hand, moving is atomic. Atomic is good.
  def self.expire_cached_pages
    Dir.chdir("#{Rails.root}/public") do
      %w(index.html contributors.html contributors releases.html releases edge).each do |name|
        if File.exists?(name)
          expired_cache = "expired_#{name}.#{Time.now.to_f}"
          FileUtils.mv(name, expired_cache, force: true)
          FileUtils.rm_rf(expired_cache)
        end
      end
    end
  end
end

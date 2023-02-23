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
    Dir.mkdir(tmpdir) unless File.exist?(tmpdir)
    tmpdir
  end

  # Expires the page caches in the public directory.
  #
  # We move the cache directory first out to a temporary place, and then
  # recursively delete that one. It is done that way because if we rm -rf
  # directly and at the same time requests come and create new cache files a
  # black hole can be created and handling that is beyond the legendary
  # robustness of this website.
  #
  # On the other hand, moving is atomic. Atomic is good.
  def self.expire_cache
    cache_dir = Rails.application.config.action_controller.page_cache_directory

    if Dir.exist?(cache_dir)
      expired_cache = "#{tmpdir}/expired_cache.#{Time.now.to_f}"
      FileUtils.mv(cache_dir, expired_cache, force: true)
      FileUtils.rm_rf(expired_cache)
    end
  end
end

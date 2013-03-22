require 'git-deploy/version'

module Git
  module Deploy
    autoload :Builder,             'git-deploy/builder'
    autoload :Runner,              'git-deploy/runner'

    module Middleware
      autoload :Confirm,           'git-deploy/middleware/confirm'
      autoload :Countdown,         'git-deploy/middleware/countdown'
      autoload :GitPush,           'git-deploy/middleware/git_push'
      autoload :HerokuBranch,      'git-deploy/middleware/heroku_branch'
      autoload :HerokuMaintenance, 'git-deploy/middleware/heroku_maintenance'
      autoload :HerokuWorkers,     'git-deploy/middleware/heroku_workers'
      autoload :Hipchat,           'git-deploy/middleware/hipchat'
      autoload :Migrate,           'git-deploy/middleware/migrate'
      autoload :Sanity,            'git-deploy/middleware/sanity'
    end

    module Utils
      autoload :Git,               'git-deploy/utils/git'
      autoload :Heroku,            'git-deploy/utils/heroku'
      autoload :Remote,            'git-deploy/utils/remote'
      autoload :Shell,             'git-deploy/utils/shell'
    end
  end

  require 'pathname'

  ##
  # The root directory for this git repository.
  def root
    Pathname.new `git rev-parse --show-toplevel`.chomp
  end
  module_function :root
end

require 'dotenv'
Dotenv.load

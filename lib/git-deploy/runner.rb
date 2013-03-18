require 'middleware'
require 'git-deploy/middleware/confirm'
require 'git-deploy/middleware/git_push'
require 'git-deploy/middleware/heroku_maintenance'
require 'git-deploy/middleware/heroku_workers'
require 'git-deploy/middleware/hipchat'
require 'git-deploy/middleware/migrate'

module Git
  module Deploy
    class Runner < ::Middleware::Builder

      ##
      # Sets up the middleware stack for deploy runs.
      def initialize( options )
        @options = options

        super() do

          use Git::Deploy::Middleware::Confirm, options
          # use Git::Deploy::Middleware::Hipchat
          # use Git::Deploy::Middleware::HerokuMaintenance
          use Git::Deploy::Middleware::HerokuWorkers
          use Git::Deploy::Middleware::GitPush
          use Git::Deploy::Middleware::Migrate
        end
      end
      attr_reader :options

      ##
      # Make the middleware stack public so the CLI can see it.
      public :stack
    end
  end
end

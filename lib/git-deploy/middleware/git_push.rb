class Git::Deploy::Middleware::GitPush
  include Git::Deploy::Middleware

  ##
  # Deploys [refspec] to [remote]. Pretty much the most important thing.
  def call( env )
    remote, refspec = env

    # TODO force push
    sh 'git', 'push', remote.name, refspec.name, :dry_run => true


    app.call [ remote, refspec ]

  rescue Interrupt => e
    puts "INTERRUPT CAUGHT!"
    puts e.inspect
  end
end

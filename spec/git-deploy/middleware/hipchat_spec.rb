require 'spec_helper'
require 'git-deploy/middleware/hipchat'

describe Git::Deploy::Middleware::Hipchat, :middleware => true do

  subject { described_class.new app }

  it { should be_a( Git::Deploy::Middleware ) }

  it 'performs the correct steps in order' do
    step subject, :`,   'hipchat say Deploying\ develop\ to\ staging --color yellow'
    step app,     :call, env
    step subject, :`,   'hipchat say Successfully\ deployed\ develop\ to\ staging --color green'

    subject.call env
  end
  it 'returns env' do
    subject.call( env ).should == env
  end
end
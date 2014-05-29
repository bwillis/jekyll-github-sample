require 'spec_helper'

describe JekyllGithubSample::FileHelper do

  let(:path) { '/bwillis/versioncake/blob/master/lib/versioncake/configuration.rb' }

  subject { JekyllGithubSample::FileHelper.new(path) }

  context '#initialize' do
    it 'does not fail to initialize with the path' do
      expect {
        subject
      }.not_to raise_error
    end
  end

  its(:user_uri)     { should == 'https://github.com/bwillis' }
  its(:web_uri)      { should == 'https://github.com/bwillis/versioncake/blob/master/lib/versioncake/configuration.rb' }
  its(:raw_uri)      { should == 'https://raw.githubusercontent.com/bwillis/versioncake/master/lib/versioncake/configuration.rb' }
  its(:filename)     { should == 'lib/versioncake/configuration.rb' }
  its(:user)         { should == 'bwillis' }
  its(:project_name) { should == 'versioncake' }
end

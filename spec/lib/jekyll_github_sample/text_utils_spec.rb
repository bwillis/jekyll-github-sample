require 'spec_helper'

describe JekyllGithubSample::TextUtils do

  let(:text_utils) { class Tester; include JekyllGithubSample::TextUtils; end.new }

  context '#remove_common_indentation' do
    let(:lines) {[
     '   def method',
     '     a = 1',
     '   end'
    ]}
    subject { text_utils.remove_common_indentation(lines) }

    it 'removes 3 spaces of common indentation' do
      should =~ [
        'def method',
        '  a = 1',
        'end'
      ]
    end

    context 'for lines with no common indentation' do
      let(:lines) { [
          'def new_method',
          '  raise',
          'end'
      ] }

      it 'does nothing to the indentation' do
        should =~ lines
      end
    end
  end

end
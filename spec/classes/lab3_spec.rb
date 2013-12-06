require 'spec_helper'

describe 'cset4100::lab3' do
  let(:title) { 'cset4100::lab3' }

  describe "cset4100 class without any parameters" do 
    let(:params) {{ }}
    let(:facts) { { :osfamily => 'Debian' } }

    it { should create_class('cset4100::lab3') }
    it { should create_package('tomcat7') }
    it { should create_file('/tmp/cset4100lab3.sh') }
    it { should create_service('tomcat7') }
  end
end

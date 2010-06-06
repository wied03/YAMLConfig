require "base"
require "yaml_config"

def propsnew
  config = BW::YAMLConfig.new "local_properties_default.yml", "local_properties.yml"
  config.props
end

describe "YAMLConfig" do
  before(:each) do
    @current = pwd
    cd File.expand_path(File.dirname(__FILE__))
  end

  after(:each) do
    rm "local_properties.yml" if @removegen
    cd @current
  end

  it "Should work OK with only default properties" do
    cd "onlydefault"
    @removegen = true
    props = propsnew
    props['area1']['setting'].should == "yep"
    props['area1']['setting2'].should == "nope"
    props['area2']['setting3'].should == "yep"
  end

  it "Should work OK with default + partially filled out user properties" do
    cd "defaultpartialuser"
    props = propsnew
    props['area1']['setting'].should == "overrodethis"
    props['area1']['setting2'].should == "nope"
    props['area2']['setting3'].should == "yep"
  end

  it "Should work OK with default + completely filled out user properties" do
    cd "defaultanduser"
    props = propsnew
    props['area1']['setting'].should == "yep2"
    props['area1']['setting2'].should == "nope2"
    props['area2']['setting3'].should == "yep2"
  end
end
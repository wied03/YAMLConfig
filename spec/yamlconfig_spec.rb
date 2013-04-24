require "base"
require "yaml_config"

describe "YAMLConfig" do
  before(:all) do
    Dir.chdir File.expand_path(File.dirname(__FILE__))+"/testdata"
  end

  after(:each) do
    File.delete "newuserfile.yml" if File.exist? "newuserfile.yml"
  end

  it "Should work fine with only default properties" do
    props = BW::YAMLConfig.new("onlydefault.yml",
                               "newuserfile.yml").props

    props['area1']['setting'].should == "yep"
    props['area1']['setting2'].should == "nope"
    props['area2']['setting3'].should == "yep"
  end

  it "Should work OK with default + partially filled out user properties" do
    props = BW::YAMLConfig.new("defaultpartialuser_default.yml",
                               "defaultpartialuser_user.yml").props

    props['area1']['setting'].should == "overrodethis"
    props['area1']['setting2'].should == "nope"
    props['area2']['setting3'].should == "yep"
  end

  it "Should work OK with default + completely filled out user properties" do
    props = BW::YAMLConfig.new.props

    props['area1']['setting'].should == "yep2"
    props['area1']['setting2'].should == "nope2"
    props['area2']['setting3'].should == "yep2"
  end
end
describe "a conventional ruby project structure" do
  describe "tests" do
    it "should require a helper to load other dependencies" do
      $LOADED_FEATURES.grep(/spec_helper\.rb/).any?.should == true
    end
  end

  describe "config directory" do
    it "should have an environment file" do
      File.exists?(File.join(File.dirname(__FILE__), '../config/env.rb')).should == true
    end
  end

  describe "loading the environment for testing" do
    it "should load the environment file in the spec_helper" do
      $LOADED_FEATURES.grep(/env\.rb/).any?.should == true

      File.read(File.join(File.dirname(__FILE__), 'spec_helper.rb')).scan(/env\.rb/).any?.should == true
    end
  end

  describe "lib directory" do
    it "should have all it's files loaded" do
      expect { Foo }.to_not raise_error
      expect { Bar }.to_not raise_error
    end
  end
end

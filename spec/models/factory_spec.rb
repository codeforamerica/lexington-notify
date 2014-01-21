require 'spec_helper'

describe FactoryGirl do
  FactoryGirl.factories.map(&:name).each do |name|
    it "builds valid #{name} objects" do
      expect(build(name)).to be_valid
    end
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

module Doorman
  describe ClassMethods do
    include ClassMethods

    before(:each) do
      _clear_acl_list
    end

    it "should store the ACL" do
      _doorman_list.should be_an_instance_of(Array)
    end

    it "should have a deny method" do
      lambda { deny :all }.should_not raise_error
    end

    it "should store a deny entry on the ACL" do
      s = _doorman_list.size
      deny :host => "192.168.*"
      _doorman_list.should have(s + 1).elements
    end

    it "should have an allow method" do
      lambda { allow :all }.should_not raise_error
    end

    it "should store an allow entry on the ACL" do
      s = _doorman_list.size
      allow :user_agent => /MSIE/
      _doorman_list.should have(s + 1).elements
    end

    it "should allow valid ACL entries" do
      lambda { deny :host => "192.168.*" }.should_not raise_error
      lambda { deny :user => "bill" }.should_not raise_error
      lambda { deny :user_agent => /MSIE/ }.should_not raise_error
#      lambda { deny :time => "8am-5pm" }.should_not raise_error
      lambda { deny {|c| c.foo } }.should_not raise_error
    end

    it "should reject invalid ACL entries" do
      lambda { deny :foo => "3" }.should raise_error
      lambda { deny { foo } }.should raise_error
    end
  end
end

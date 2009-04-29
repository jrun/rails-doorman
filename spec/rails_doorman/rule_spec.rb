require File.dirname(__FILE__) + '/../spec_helper'

module Doorman
  
  describe Rule do
    describe '.from_hash' do
      it "should set the method using the opts first key" do
        rule = Rule.from_hash(:allow, :role => :whatever)
        rule.method.should == :role
      end
    
      it "should set the value using the opts first value" do
        rule = Rule.from_hash(:allow, :role => :whatever)
        rule.value.should == :whatever
      end
    
      it "should move :only from options to limits" do
        rule = Rule.from_hash(:allow, :role => :whatever, :only => :index)
        rule.limits[:only].should_not be_nil
        rule.limits[:role].should be_nil
      end
    
      it "should move :exclude from options to limits" do
        rule = Rule.from_hash(:allow, :role => :whatever, :exclude => :index)
        rule.limits[:exclude].should_not be_nil
        rule.limits[:role].should be_nil
      end
      
      it "should convert a single :only value to an Array" do
        rule = Rule.from_hash(:allow, :role => :admin, :only => :index)
        rule.limits[:only].should == [:index]
      end
    
      it "should convert a single :exclude value to an Array" do
        rule = Rule.from_hash(:allow, :role => :admin, :exclude => :index)
        rule.limits[:exclude].should == [:index]
      end
    
      it "should raise an InvalidRule error when the options hash as too many values" do
        lambda do
          Rule.from_hash(:allow, :role => :admin, :user => :bob)
        end.should raise_error(Doorman::InvalidRule)
      end
    
      it "should raise an InvalidRule error when the method isn't supported" do
        lambda do
          Rule.from_hash(:allow, :not_suppoted => :whatever)
        end.should raise_error(Doorman::InvalidRule)
      end
    end
  
    describe '.from_block' do
      def block
        proc {|ignored| true }
      end
    
      it "should set the method to :block" do
        rule = Rule.from_block(:allow, &block)
        rule.method.should == :block
      end
    
      it "should set the value to the block" do
        rule = Rule.from_block(:allow, &block)
        rule.value.should be_instance_of(Proc)      
        rule.value.call(:ignored).should be_true
      end
    
      it "should move :only from options to limits" do
        rule = Rule.from_block(:allow, :only => :index, &block)
        rule.limits[:only].should == [:index]
      end
    
      it "should move :exclude from options to limits" do
        rule = Rule.from_block(:allow, :exclude => [:index, :show], &block)
        rule.limits[:exclude].should == [:index, :show]
      end
    
      it "should convert a single :only value to an Array" do
        rule = Rule.from_block(:allow, :exclude => :index, &block)
        rule.limits[:exclude].should == [:index]
      end
    
      it "should raise an InvalidRule error when the blocks arity is not one" do
        lambda do
          Rule.from_block(:allow) {}
        end.should raise_error(Doorman::InvalidRule)
      end
    end
  
    [:allow, :deny].each do |type|
      describe "with the type #{type}, #evaluate?" do
        it "should be true when the :only list is empty" do
          rule = Rule.from_hash(type, :role => :admin)
          rule.evaluate?(:show).should be_true
        end
      
        it "should be true when the action is in the :only list" do
          rule = Rule.from_hash(type, :role => :admin, :only => :show)
          rule.evaluate?(:show).should be_true
        end
      
        it "should be false when the action is not in the :only list" do
          rule = Rule.from_hash(type, :role => :admin, :only => [:index, :show])
          rule.evaluate?(:create).should be_false
        end
  
        it "should be false when the action is in the :exclude list" do
          rule = Rule.from_hash(type, :role => :admin, :exclude => [:index, :show])
          rule.evaluate?(:show).should be_false
        end
  
        it "should be true when the action is not inthe :exclude list" do
          rule = Rule.from_hash(type, :role => :admin, :exclude => [:index, :show])
          rule.evaluate?(:create).should be_true
        end
      end
    end  
  end
  
end

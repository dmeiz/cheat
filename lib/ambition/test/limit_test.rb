require File.dirname(__FILE__) + '/helper'

context "Limit" do
  setup do
    @sql = User.select { |m| m.name == 'jon' }
  end

  specify "first" do
    conditions = { :conditions => "users.`name` = 'jon'", :limit => '1' }
    User.expects(:find).with(:first, conditions)
    @sql.first
  end

  specify "first with argument" do
    conditions = { :conditions => "users.`name` = 'jon'", :limit => '5' }
    User.expects(:find).with(:all, conditions)
    @sql.first(5)
  end

  specify "[]" do
    conditions = { :conditions => "users.`name` = 'jon'", :limit => '10, 20' }
    User.expects(:find).with(:all, conditions)
    @sql[10, 20]
  end
end

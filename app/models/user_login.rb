class UserLogin < ActiveRecord::Base
  # attr_accessible :title, :body
  set_table_name 'users'

  acts_as_authentic
end

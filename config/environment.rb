# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

ActiveRecord::Base.table_name_prefix = "hobo_"
ActiveRecord::Base.pluralize_table_names = false

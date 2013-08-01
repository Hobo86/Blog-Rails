# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

ActiveRecord::Base.table_name_prefix = "hobo_"
ActiveRecord::Base.pluralize_table_names = false

=begin
统计每日动态请求处理总数 
cat production.log.20070702|grep "200 OK"|wc -l 
统计URL的访问频度 
cat production.log.20070702 |grep "200 OK" | awk '{print $17}'|sort|uniq -c | sort -r -n > stat.log  
=end
RAILS_DEFAULT_LOGGER = Logger.new("#{RAILS_ROOT}/log/#{RAILS_ENV}.log", "daily")

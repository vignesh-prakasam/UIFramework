require 'redis'

tns_redis_config = YAML.load_file(Rails.root.join('config', 'redis.yml'))[Rails.env]['tns']
tns_host, tns_port = tns_redis_config.split(':')

$tns_cache_store = Redis.new(:host => tns_host, :port => tns_port, :db=>2, :thread_safe => true)

function dapper_stubby -d 'Run stubby with local dapper support'
  stubby --dapper_trace_period=1 \
  --logflushinterval=0 --trace_log_flush_period_sec=0 \
  --print_trace_url --stats --dapper_do_not_downsample $argv
end

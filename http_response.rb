require'benchmark'
require'net/http'
tme_start=Time.now.min
tme_end=tme_start+5
uri=URI('https://gitlab.com')
arr=[]
begin
time=Benchmark.realtime{Net::HTTP.get_response(uri)}
arr<<time
puts"HTTP Response time https://gitlab.com : #{time}s"
end until tme_end==Time.now.min
avg_time=arr.inject{|sum,el|sum+el}.to_f/arr.size
puts"Average respose time for https://gitlab.com for  = #{avg_time}"

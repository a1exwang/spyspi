require './app/html_obtainer/http_helper'
require './app/parsers/uri_from_html_parser'
require './app/parsers/designation_parser'
require './tools/thread_pool'
require './tools/hash_bucket'
require './hdb'

@parser = UriFromHtmlParser.new

def spider(init_addr, threads)
  pool = ThreadPool.new(threads)
  pool.add_resource(init_addr)
  buckets = HashBucket.new
  pool.start_task do |p, addr|
    buckets.add(addr)

    # debug info
    puts buckets.approximate_size
    #puts addr

    body = get_body(addr)
    # do some user defined operations to the html code
    yield body if block_given?

    @parser.get_all_matched(body).each do |a|
      p.add_resource a unless buckets.exist? a
    end
  end
end

@dp = DesignationParser.new(2)
addr = 'http://info.tsinghua.edu.cn'
addr = 'http://baike.baidu.com/link?url=SW_HjPm5c-ODicdynoYyKL3dTwozN6kUfFoX25qMmgCnYhCeOgonYwO_J4rGwwD-H4m4-HYJu_Pn3lhtp4cFm_'
spider(addr, 100) do |html|
  ds = @dp.get_all_matched(html)
  ds.each do |des|
    Film.add_film(designation_main: des.first, designation_additional: des.last, description: 'good')
    puts "#{des.first}-#{des.last}"
  end
end

sleep(1000)
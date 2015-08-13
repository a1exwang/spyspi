require './html_obtainer/http_helper'
require './thread_pool'
require './hash_bucket'
require './parsers/uri_from_html_parser'

@parser = UriFromHtmlParser.new

def spider(init_addr, threads)
  pool = ThreadPool.new(threads)
  pool.add_resource(init_addr)
  buckets = HashBucket.new
  pool.start_task do |p, addr|
    buckets.add(addr)

    # debug info
    puts buckets.approximate_size
    puts addr

    body = get_body(addr)
    # do some user defined operations to the html code
    yield body if block_given?

    @parser.get_all_matched(body).each do |a|
      p.add_resource a unless buckets.exist? a
    end
  end
end

spider('http://info.tsinghua.edu.cn', 10)

sleep(1000)
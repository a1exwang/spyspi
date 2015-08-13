
def bfs_dir(dir, &block)
  raise RuntimeError unless block

  (Dir.entries(dir) - ['.', '..']).each do |name|
    full_path = dir + '/' + name
    block.call(full_path, name)
    bfs_dir(full_path, &block) if File.directory?(full_path)
  end
end

def has_number?(str)
  str.each_char do |c|
    if c >= '0' && c <= '9'
      return true
    end
  end
  false
end

def bfs_designation(dir)

  result = []
  bfs_dir(dir) do |path, name|
    mdata = /([A-Za-z0-9]{1,5})[- _+]{0,4}([A-Za-z0-9]{1,5})/.match(name)
    if mdata
      str = mdata[1].to_s.upcase + '-' + mdata[2].to_s.upcase
      if str.length > 4 && has_number?(str)
        result.push(str + '/' + str.length.to_s)
      end
    end
  end

  puts (result.uniq.sort.each do |r|
    puts r
  end).size
end


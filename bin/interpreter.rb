require './hdb'
def help
  puts ""
end

# args: resource method params...

if ARGV.count >= 3
  class_name = ARGV[0]
  method_name = ARGV[1]
  params = ARGV[2..-1]
  puts eval(class_name + '.' + method_name + "(*params)")
else
  help
end

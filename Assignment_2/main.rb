require './manager.rb'

gene_file = ARGV[0]
unless gene_file
  abort "Incorrect number of arguments"
end

Manager.new({:genefile => gene_file})



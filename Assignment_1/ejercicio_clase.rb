#!/usr/bin/ruby

require "./Fetch_Function.rb"

gene_file = ARGV[0]

gene_data = IO.readlines(gene_file)
puts gene_data

gene_data.each do |lines|
  
  puts lines[1].split("\t")[0]
  
end

moodle upm

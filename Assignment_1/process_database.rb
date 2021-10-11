#!/usr/bin/ruby

gene_file = ARGV[0]
stock_file = ARGV[1]
cross_file = ARGV[2]

require "./Gene.rb"
require "./SeedStock.rb"
require "./Gene.rb"

def parse_tsv(path)
  return IO.readlines(path)  
end


def create_genes()
    name = Gene.new(
      gene1 = Gene.new
      gene1.Gene_ID = gene_data[1].split("\t")[0]
      gene1.Gene_name = gene_data[1].split("\t")[1]
      gene1.mutant_phenotype = gene_data[1].split("\t")[2].split("\"")[1]
    )
end


#def create_cross()
#    name = clase.new(
#      gene1 = Gene.new
#      gene1.Gene_ID = gene_data[1].split("\t")[0]
#      gene1.Gene_name = gene_data[1].split("\t")[1]
#      gene1.mutant_phenotype = gene_data[1].split("\t")[2].split("\"")[1]
#    )
#end
#
#
#def create_stocks()
#    name = clase.new(
#      gene1 = Gene.new
#      gene1.Gene_ID = gene_data[1].split("\t")[0]
#      gene1.Gene_name = gene_data[1].split("\t")[1]
#      gene1.mutant_phenotype = gene_data[1].split("\t")[2].split("\"")[1]
#    )
#end


gene_data = parse_tsv(gene_file)
stock_data = parse_tsv(stock_file)
cross_data = parse_tsv(cross_file)


#puts gene_data[1].split("\t")[0]
#puts gene_data[1].split("\t")[1]
#puts gene_data[1].split("\t")[2].split("\"")[1]


gene1 = Gene.new
gene1.Gene_ID = gene_data[1].split("\t")[0]
gene1.Gene_name = gene_data[1].split("\t")[1]
gene1.mutant_phenotype = gene_data[1].split("\t")[2].split("\"")[1]

puts gene1.Gene_ID, gene1.Gene_name, gene1.mutant_phenotype, gene1.number_of_genes


#gene1 = Gene.new(
#  :Gene_ID => gene_data[1].split("\t")[0], 
#  :Gene_name => gene_data[1].split("\t")[1], 
#  :mutant_phenotype => gene_data[1].split("\t")[2].split("\"")[1], 
#  )


#puts gene1.Gene_ID, gene1.Gene_name, gene1.mutant_phenotype


# properties.each do |property|
#   puts properties
# end


# properties = data[0].split("\t")
# properties


# data.each do |row|
#   puts row.split("\t")
# end
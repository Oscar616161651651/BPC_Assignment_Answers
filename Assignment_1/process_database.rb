#!/usr/bin/ruby

gene_file, stock_file, cross_file, new_file = ARGV
unless gene_file && stock_file && cross_file && new_file
  abort "Incorrect number of arguments"
end


def parse_tsv(path)
  data = IO.readlines(path)
  data.each_with_index {|val, ind|
    data[ind] = data[ind].split("\t")
    }
  return data
end


require "./Gene.rb"
require "./SeedStock.rb"
require "./HybridCross.rb"

gene_data = parse_tsv(gene_file)
stock_data = parse_tsv(stock_file)
cross_data = parse_tsv(cross_file)


def crea_genes(data)
  gene_id, gene_name, gene_mut_pheno = data
  
  gene = Gene.new(
   :Gene_ID => gene_id,
   :Gene_name => gene_name,
   :mutant_phenotype => gene_mut_pheno
  )
  return gene
end

def crea_stocks(data)
  seed_stock, mutant_id, last_planted, storage, remaining = data
  
  stock = Stock.new(
   :Seed_Stock => seed_stock,
   :Mutant_Gene_ID => mutant_id,
   :Last_Planted => last_planted,
   :Storage => storage,
   :Grams_Remaining =>  remaining
  )
  
  return stock
end

def crea_crosses(data)

  
  parent1, parent2, wild, p1, p2, p1p2 = data
  
  cross = Cross.new(
   :Parent1 => parent1,
   :Parent2 => parent2,
   :F2_Wild => wild,
   :F2_P1 => p1,
   :F2_P2 =>  p2,
   :F2_P1P2 =>  p1p2
  )
  
  return cross
end




all_genes = {}
all_stocks = {}
all_crosses = {}


(gene_data.length - 1).times do |ind|
  unless gene_data[ind + 1][0].match(/A[Tt]\d[Gg]\d\d\d\d\d/)
    abort "Incorrect AGI code in Gene_ID (gene_information.tsv)"
  end
  all_genes[gene_data[ind + 1][0]] = crea_genes(gene_data[ind + 1])
end
#puts all_genes  

(stock_data.length - 1).times do |ind|
  all_stocks[stock_data[ind + 1][1]] = crea_stocks(stock_data[ind + 1])
end
puts all_stocks[[@Grams_Remaining]]
  
(cross_data.length - 1).times do |ind|
  all_crosses[cross_data[ind + 1][0]] = crea_crosses(cross_data[ind + 1])
end
#puts all_crosses


all_stocks.each do |stock|
  puts stock
end

puts all_stocks
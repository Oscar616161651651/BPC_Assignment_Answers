#!/usr/bin/ruby

#Calls required classes
require "./Gene.rb"
require "./SeedStock.rb"
require "./HybridCross.rb"


#Name files
gene_file, stock_file, cross_file, new_file = ARGV
unless gene_file && stock_file && cross_file && new_file #Corret number of arguments?
  abort "Incorrect number of arguments"
end


#Parses TSV files
def parse_tsv(path)
  data = IO.readlines(path)
  data.each_with_index {|val, ind|
    data[ind] = data[ind].split("\t")
    }
  return data
end


#Saves parsed information in 3 data sets
gene_data = parse_tsv(gene_file)
stock_data = parse_tsv(stock_file)
cross_data = parse_tsv(cross_file)


#Functions that create objects with the data from each TSV file.
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




# 3 hashes that will contain all objects.
all_genes = {}
all_stocks = {}
all_crosses = {}


#Creates and saves genes + checks ATG
(gene_data.length - 1).times do |ind| 
  unless gene_data[ind + 1][0].match(/A[Tt]\d[Gg]\d\d\d\d\d/)
    abort "Incorrect AGI code in Gene_ID (gene_information.tsv)"
  end
  all_genes[gene_data[ind + 1][0]] = crea_genes(gene_data[ind + 1])
end
#Creates and saves stocks
(stock_data.length - 1).times do |ind|
  all_stocks[stock_data[ind + 1][1]] = crea_stocks(stock_data[ind + 1])
end
#Creates and saves crosses
(cross_data.length - 1).times do |ind|
  all_crosses[cross_data[ind + 1][0]] = crea_crosses(cross_data[ind + 1])
end




#Hash that contains the name and the ID for each stock
Name_ID = {} 
#Plant stocks and fill Name_ID
all_stocks.each do |stock|
  key, stock_object = stock
  
  #Stock method .get_name_ID
  pair = stock_object.get_name_ID
  Name_ID[pair[0]] = pair[1]
  
  #Stock method .plant()
  stock_object.plant(7)
end
#Creates output file
def write_outfile(file, array)
    new = File.new(file, "w")
    new.puts("Seed_Stock	Mutant_Gene_ID	Last_Planted	Storage	Grams_Remaining")
    array.each do |stock|
      key, o = stock
      new.puts("#{o.Seed_Stock}\t#{o.Mutant_Gene_ID}\t#{o.Last_Planted}\t#{o.Storage}\t#{o.Grams_Remaining.to_i}")
    end
    new.close
end
    
write_outfile(new_file, all_stocks)


#Hash with all linked genes
all_linked_genes ={}
#Performs the chi-square and records linked genes
all_crosses.each do |cross|
  key, cross_object = cross
  linked_genes = cross_object.genetically_linked
  
  if linked_genes.any? #Are these genes genetically linked?
    gene1, gene2, value = linked_genes
    
    #Transformation from stock_name to gene_name unsing $Name_ID
    name_gene1 = all_genes[Name_ID[gene1]].get_name 
    name_gene2 = all_genes[Name_ID[gene2]].get_name
    
    #Report linkage on screen
    puts "Recording: #{name_gene1} is genetically linked to #{name_gene2} with chisquare score #{value}"
    
    #Fill all_linked_genes hash
    all_linked_genes[name_gene1] = name_gene2
    all_linked_genes[name_gene2] = name_gene1
  end
end





#Prints final report using all_linked_genes hash
puts "\n\nFinal Report:"
all_linked_genes.each do |gene1, gene2|
  puts "#{gene1} is linked to #{gene2}"
end
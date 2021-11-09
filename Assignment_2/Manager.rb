require './InteractionNetwork.rb'
require './Fetch_Function.rb'
require './Gene.rb'

class Manager

  attr_accessor :allgenes
  attr_accessor :new_interactions
  attr_accessor :new_genes

  def initialize(params = {})
    
    @allgenes = Hash.new
    @new_genes = Hash.new
    @new_interactions = Array.new
    genefile = params.fetch(:genefile)
    self.load_data(genefile)
    
  end



  def load_data(file)
    
    genefile = File.open(file, 'r')
    genefile.readlines.each do |line|
      line.strip!
      gene = Gene.new({:geneid => line})
      @allgenes[line] = gene
      
    end
  end
  




 def create_networks
   allgenes.each do |gene, object|
     address = "http://bar.utoronto.ca:9090/psicquic/webservices/current/search/interactor/#{gene}?format=tab25"
     res = fetch(address);
     if res 
       data = res.split("\n")
       data.each do |row|
         column = row.split("\t")
         if column[14].split(":")[1].to_f > 0.485 #https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4316181/ #the optimal cutoff value for MIscore is 0.485
           if column[2].split(":")[1].downcase != gene.downcase
              interactor = column[2].split(":")[1].upcase
              interactor[3] = interactor[3].downcase
              interaction = Interaction_Network.new({:netid => "#{gene}#{interactor}", :firstgene => gene})
           else
              interactor = column[3].split(":")[1].upcase
              interactor[3] = interactor[3].downcase
              interaction = Interaction_Network.new({:netid => "#{gene}#{interactor}", :firstgene => gene})
           end
         end
         interaction.add_gene("#{gene}#{interactor}", interactor)
       end
     end 
   end
 end
 
 
  #def get_interactors
  #  
  #  allgenes.each do |gene, object|
  #    address = "http://bar.utoronto.ca:9090/psicquic/webservices/current/search/interactor/#{gene}?format=tab25"
  #    res = fetch(address);
  #    
  #    if res
  #      
  #      puts "AQUÍ"
  #      
  #      data = res.split("\n")
  #      data.each do |element|
  #        interactor = nil
  #        row = element.split("\t")
  #        if row[14].split(":")[1].to_f > 0.485 #https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4316181/ #the optimal cutoff value for MIscore is 0.485
  #          if row[2].split(":")[1].downcase != gene.downcase
  #            interactor = row[2].split(":")[1].upcase
  #          else
  #            interactor = row[3].split(":")[1].upcase
  #          end
  #        end
  #        
  #
  #        if interactor
  #          interactor[3] = interactor[3].downcase
  #          unless @allgenes.include? interactor
  #            new_gene = Gene.new({:geneid => interactor})
  #            puts new_gene.geneid
  #            @allgenes[interactor] = new_gene
  #            @new_genes[interactor] = new_gene
  #            # Añadir interactor a network
  #          end
  #        end
  #          
  #      end
  #      
  #    else
  #      puts "the Web call failed - see STDERR for details... #{gene}"
  #    end
  #    
  #  end
  #end
  
end
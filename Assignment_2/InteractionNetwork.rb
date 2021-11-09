class Interaction_Network 
  
  attr_accessor :firstgene
  attr_accessor :netid
  attr_accessor :all_interactors
  attr_accessor :KEGG_id
  attr_accessor :KEGG_namwe
  attr_accessor :all_networks
  #@@all_networks = Hash.new

  def initialize(params = {})
    @netid = params.fetch(:id, nil)
    @all_interactors = Array.new
    @firstgene = params.fetch(:firstgene, nil)
    @all_interactors.append(@firstgene)
    @@all_networks = Hash.new
    
    
  end
  


  def add_gene(netid, interactor)
    @all_interactors.append(interactor)
    @@all_networks[netid] = @all_interactors
  end


  def Interaction_Network.ampli_net(n)
    @@all_networks.each do |net_id, interactors|
       puts net_id, interactors[n-1]
       address = "http://bar.utoronto.ca:9090/psicquic/webservices/current/search/interactor/#{interactors[n-1]}?format=tab25"
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



  def Interaction_Network.find_paths
     @@all_networks.each do |net_id, interactors|
       Gene.get_KEGG_path(interactors)
     end
  end



  #def get_KEGG_path
  #  #puts @all_interactors
  #  #@allinteractor.each do |net|
  #  #  puts net
  #  #end
  #end
    
    
    
#



end
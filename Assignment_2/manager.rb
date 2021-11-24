require './Function.rb'
require './gene.rb'
require './Networks.rb'
require 'json'

class Manager
  
  attr_accessor :allgenes
  #attr_accessor :new_interactions
  #attr_accessor :new_genes

  def initialize(params = {})
    
    @allgenes = Array.new
    #@new_genes = Hash.new
    #@new_interactions = Array.new
    genefile = params.fetch(:genefile)
    self.load_data(genefile)
    
  end



  def load_data(file)
    
    genefile = File.open(file, 'r')
    genefile.readlines.each do |line|
      line.strip!
      
      gene = Gene.new({:geneid => line,
                      :pathways => find_networks(line),
                       })
      
      paths_info  = gene.iterate_paths
      if paths_info
        #puts "Este: #{patid}"
        paths_info.each do |pathid, pathname|
        
          path = Nets.new({:kegg_id => pathid,
                           :keggname => pathname,
                           :interactors => get_interactors(pathid),
                           })
        
          unless path.interactors[0].empty?
            puts path.interactors
          end
        end
      end
    
      
  
      #puts gene.interaction_networks unless gene.interaction_networks.empty?
      @allgenes.append(gene)
    end
  end
  
  
  
  
  def find_networks(id)
      #puts "id: #{id}"
      address = "http://togows.org/entry/kegg-genes/ath:#{id}/pathways.json"
      res = fetch(address);
      if res
        #puts res
        data = JSON.parse(res.body)
        return data
      end
  end
  
  
  def get_interactors(netid)
    #puts netid
    address = "http://togows.org/entry/kegg-pathway/#{netid}/genes.json"
      res = fetch(address);
      if res
        #puts res
        data = JSON.parse(res.body)
        #puts data
        return data
      end
  end
    
  

  
end
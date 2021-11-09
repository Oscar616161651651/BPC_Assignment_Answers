require './InteractionNetwork.rb'
require './Fetch_Function'
require 'json'

class Gene
  

  attr_accessor :geneid




  def initialize(params = {})
    @geneid = params.fetch(:geneid, nil)
  end


 
  def Gene.get_KEGG_path(interactors)
    interactors.each do |int| 
      address = "http://togows.org/entry/genes/ath:#{int}/pathways.json"
      #puts address
      res = fetch(address);
      data = JSON.parse(res.body)
    #  #body = JSON.parse(res.body)
      puts data
    end
  end 



end
class Gene  
  
  #@@number_of_genes = 0
  attr_accessor :Gene_ID
  attr_accessor :Gene_name
  attr_accessor :mutant_phenotype
  
  def initialize (params = {}) 
    @Gene_ID = params.fetch(:Gene_ID, nil)
    @Gene_name = params.fetch(:Gene_name, nil)
    @mutant_phenotype = params.fetch(:mutant_phenotype, nil)
    @mutant_phenotype = @mutant_phenotype.strip
  end
  

  #def how_many
  #  return @@number_of_genes
  #end
    
end
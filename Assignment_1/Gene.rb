class Gene  
  
  #@@number_of_genes = 0
  attr_accessor :Gene_ID
  attr_accessor :Gene_name
  attr_accessor :mutant_phenotype
  
  def initialize (params = {}) 
    @Gene_ID = params.fetch(:Gene_ID, "unknown")
    unless @geneid.match(/A[Tt]\d[Gg]\d\d\d\d\d/)
      abort "Incorrect AGI code in Gene_ID (gene_information.tsv)"
    end
    @Gene_name = params.fetch(:Gene_name, "unknown")
    @mutant_phenotype = params.fetch(:mutant_phenotype, "")
  end
  

  #def how_many
  #  return @@number_of_genes
  #end
    
end
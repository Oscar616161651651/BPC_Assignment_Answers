class Gene  
  
  attr_accessor :Gene_ID
  attr_accessor :Gene_name
  attr_accessor :mutant_phenotype
  
  def initialize (params = {})
    @Gene_ID = params.fetch(:Gene_ID, 'unknown')
    @Gene_name = params.fetch(:Gene_name, 'unknown')
    @mutant_phenotype = params.fetch(:mutant_phenotype, "")
  end
end
class Gene  
  
  attr_accessor :Parent1
  attr_accessor :Parent2
  attr_accessor :F2_Wild
  attr_accessor :F2_P1
  attr_accessor :F2_P2
  attr_accessor :F2_P1P2
  
  def initialize (params = {})
    @Parent1 = params.fetch(:Gene_ID, 'unknown')
    @Parent2 = params.fetch(:Gene_name, 'unknown')
    @F2_Wild = params.fetch(:mutant_phenotype, "0")
    @F2_P1 = params.fetch(:mutant_phenotype, "0")
    @F2_P2 = params.fetch(:mutant_phenotype, "0")
    @F2_P1P2 = params.fetch(:mutant_phenotype, "0")
  end
end

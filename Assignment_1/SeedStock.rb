class Gene  
  
  attr_accessor :Seed_Stock
  attr_accessor :Mutant_Gene_ID
  attr_accessor :Last_Planted
  attr_accessor :Storage
  attr_accessor :Grams_Remaining
  
  def initialize (params = {})
    @Seed_Stock = params.fetch(:Gene_ID, 'unknown')
    @Mutant_Gene_ID = params.fetch(:Gene_name, 'unknown')
    @Last_Planted = params.fetch(:mutant_phenotype, "00/00/0000")
    @Storage = params.fetch(:mutant_phenotype, 'unknown')
    @Grams_Remaining = params.fetch(:mutant_phenotype, "0")
  end
end



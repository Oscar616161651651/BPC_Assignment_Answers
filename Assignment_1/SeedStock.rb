class Stock  
  

  attr_accessor :Seed_Stock
  attr_accessor :Mutant_Gene_ID
  attr_accessor :Last_Planted
  attr_accessor :Storage
  attr_accessor :Grams_Remaining
  
  
  def initialize (params = {})
    @Seed_Stock = params.fetch(:Seed_Stock, nil)
    @Mutant_Gene_ID = params.fetch(:Mutant_Gene_ID, nil)
    @Last_Planted = params.fetch(:Last_Planted, nil)
    @Storage = params.fetch(:Storage, nil)
    @Grams_Remaining = params.fetch(:Grams_Remaining, nil)
    @Grams_Remaining = @Grams_Remaining.strip.to_f
  end
  
  #Subtracts given grams from given stock
  def plant(grams)
    @Grams_Remaining -= grams.to_f
    
    if @Grams_Remaining <= 0
      @Grams_Remaining = 0.0
      #Friendly warning message
      puts "WARNING: we have run out of Seed Stock #{@Seed_Stock}"
    end
  end
  
  #Returns the pair "Name, ID" from a given object.
  def get_name_ID
    return [@Seed_Stock, @Mutant_Gene_ID]
  end
    

end



class Stock  
  
  #@@number_of_stock = 0
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
    #@@number_of_cross+=1
  end
  
  def plant(grams)
    @Grams_Remaining -= grams.to_f
    
    if @Grams_Remaining < 0
      @Grams_Remaining = 0
    end
    
    puts Grams_Remaining
  end
  
end



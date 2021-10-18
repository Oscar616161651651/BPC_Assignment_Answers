class Cross
  
 # @@number_of_cross = 0
  attr_accessor :Parent1
  attr_accessor :Parent2
  attr_accessor :F2_Wild
  attr_accessor :F2_P1
  attr_accessor :F2_P2
  attr_accessor :F2_P1P2
  
  def initialize (params = {})
    @Parent1 = params.fetch(:Parent1, nil)
    @Parent2 = params.fetch(:Parent2, nil)
    @F2_Wild = params.fetch(:F2_Wild, nil)
    @F2_Wild = @F2_Wild.to_f
    @F2_P1 = params.fetch(:F2_P1, nil)
    @F2_P1 = @F2_P1.to_f
    @F2_P2 = params.fetch(:F2_P2, nil)
    @F2_P2 = @F2_P2.to_f
    @F2_P1P2 = params.fetch(:F2_P1P2, nil)
    @F2_P1P2 = @F2_P1P2.strip.to_f
   # @@number_of_cross+=1
    
  end
end

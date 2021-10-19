class Cross
  

  attr_accessor :Parent1
  attr_accessor :Parent2
  attr_accessor :F2_Wild
  attr_accessor :F2_P1
  attr_accessor :F2_P2
  attr_accessor :F2_P1P2
  attr_accessor :Sum
  
  
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
    @Sum = 0.0
    @expected_values = {}

    
  end
  
  #Calculates if a cross is linked (chi-square) and returns genes and value if yes.
  def genetically_linked
    linked_genes = []
    @Sum = @F2_Wild + @F2_P1 + @F2_P2 + @F2_P1P2
    @expected_values["ex_W"] = @Sum*9/16
    @expected_values["ex_P1"] = @Sum*3/16
    @expected_values["ex_P2"] = @Sum*3/16
    @expected_values["ex_P1P2"] = @Sum*1/16
    
  
    chi_sq = ((@F2_Wild - @expected_values["ex_W"])**2/@expected_values["ex_W"] + 
              (@F2_P1 - @expected_values["ex_P1"])**2/@expected_values["ex_P1"] + 
              (@F2_P2 - @expected_values["ex_P2"])**2/@expected_values["ex_P2"] + 
              (@F2_P1P2 - @expected_values["ex_P1P2"])**2/@expected_values["ex_P1P2"])
    
    
    #http://labrad.fisica.edu.uy/docs/tabla_chi_cuadrado.pdf
    #3 Grados de libertad
    #0.05 Probabilidad de encontrar un valor mayor o igual que el chi cuadrado tabulado.
    if chi_sq > 7.8147
      linked_genes = [@Parent1, @Parent2, chi_sq]
    end
    return linked_genes
  end
end

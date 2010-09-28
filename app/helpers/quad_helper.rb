module QuadHelper

  def quads_for_select
    quads=["","Bombardier/Can-am","Cectek","CF Moto", "Honda", "Kawasaki","KTM","Kymco", "Linhai", "Lucky Star", "Polaris", "Suzuki", "Yamaha", "Side by Side","Inne"]
    return quads.collect{|x|[x,x]}
  end 

end

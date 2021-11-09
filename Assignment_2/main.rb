require './Manager.rb'
require './Gene.rb'
require './InteractionNetwork.rb'

gene_file = ARGV[0]
unless gene_file
  abort "Incorrect number of arguments"
end

gene_list = Manager.new({:genefile => gene_file})

#puts database.allgenes

gene_list.create_networks

Interaction_Network.ampli_net(2)






#nets.each do |i|
#  puts i
#end



#nets.get_KEGG_path


#nets.each do |id, object|
#  puts object.get_KEGG_path
#end
#nets.get_KEGG_path
#
#
#puts nets
#nets.each do |id|
#  puts id
#end









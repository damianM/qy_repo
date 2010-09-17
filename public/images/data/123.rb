#!/usr/bin/env ruby-1.8

Dir.foreach( ARGV[0] ) do | file | 
  #if file!="." && file!=".." && file!="123.rb" && file!="123.rb~" && file[0]=='t'[0] && file[1]=='g'[0] && file[2]!='_'[0]
	if file=~/\.jpg/
    puts file
     system("convert #{ARGV[0]+'/'+file} -resize \"80x80>\" #{ARGV[0]+"/80_"+file}")
	#system("cp #{file} t#{file}")
  end
end

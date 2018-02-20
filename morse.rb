require "rubygems"
require "win32/sound"
include Win32
def mccoder( ltr )
	frq=330
	spc=200.0/1000.0
	dit=200
	dah=dit*3
	mc={ 	"A"=>"01",
		"B"=>"1000",
		"C"=>"1010", 
		"D"=>"100",
		"E"=>"0",
		"F"=>"0010",
		"G"=>"110",
		"H"=>"0000",
		"I"=>"00",
		"J"=>"0111",
		"K"=>"101",
		"L"=>"0100",
		"M"=>"11",
		"N"=>"10",
		"O"=>"111",
		"P"=>"0110",
		"Q"=>"1101",
		"R"=>"010",
		"S"=>"000",
		"T"=>"1",
		"U"=>"001",
		"V"=>"0001",
		"W"=>"011",
		"X"=>"1001",
		"Y"=>"1011",
		"Z"=>"1100",
		"1"=>"01111",
		"2"=>"00111",
		"3"=>"00011",
		"4"=>"00001",
		"5"=>"00000",
		"6"=>"10000",
		"7"=>"11000",
		"8"=>"11100",
		"9"=>"11110",
		"0"=>"11111"
		}

	puts ltr
	if ltr != ' ' then
		sequence=mc[ltr]
		puts sequence
		seqlen = sequence.length - 1
		for s in (0..seqlen)
			pip = sequence.slice(s,1)
			if pip != nil then
				print pip
				if pip == '0' then
					puts 'dit'
					Sound.beep(frq,dit)
				else pip == '1'
					puts 'dah'
					Sound.beep(frq,dah)
				end
			end
		end
	else
		puts "SPACE"
		sleep spc
	end

end

puts "Enter your message: "
msg = gets.upcase
puts msg

mlen=msg.length - 2
for i in (0..mlen)
	ltr=msg.slice(i,1)
	if ltr != nil then
		mccoder ltr
	end

end


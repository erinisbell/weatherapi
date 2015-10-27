require './client'
#weather key id: 4e1235329c36d452



#base_uri 'weatherapi.herokuapp.com'

puts "What zipcode would you like to get the weather for?"
code = gets.chomp.to_i

client = Client.new(code)



current, temp = client.conditions
puts "Currently the weather in #{current} is #{temp}"

sunrise, sunrise2, pmtime, pmtime2 = client.sun
puts "The sunrise is will be at #{sunrise}:#{sunrise2} a.m. and the sunset will be at #{pmtime}:#{pmtime2}"

alerts2 = client.alerts
puts "Here are the current alerts for #{code}: #{alerts2} if empty, there are no alerts for your area. "

hurricanes = client.hurricanes
puts "Here are the numbers of active hurricanes currently #{hurricanes.count}."
hurricanes.each do |hurricane|
 puts "The name of it is: #{hurricane[0]} and it is a #{hurricane[1]}!"
end

puts str = client.tendayforecast

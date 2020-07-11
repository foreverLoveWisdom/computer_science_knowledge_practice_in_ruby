hash = {key1: "val1", key2: "val2"}
str = ""

hash.each{|k, v| str << "#{k} is #{v}\n"}
puts str
        

class StringAnalyzer 
   def has_numbers?(str) 
      !!(str =~ /[0123456789]+/i) 
   end 
end
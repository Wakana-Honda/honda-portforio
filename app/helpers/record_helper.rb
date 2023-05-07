module RecordHelper
  
 def amount_color(record)

 if record.amount == "完食"

 return 'text-green'

 elsif record.amount == "半分"

 return 'text-yellow'

 else

 return 'text-red'

 end

 end
 
end

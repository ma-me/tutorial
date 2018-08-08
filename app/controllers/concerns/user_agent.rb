module UserAgent

   def set_request_variant
     puts 'set request variant'
     request.variant = :smartphone if smartphone?
   end

   def smartphone?
     request.user_agent.match(/iPhone|Android|Windows Phone/)
   end

end

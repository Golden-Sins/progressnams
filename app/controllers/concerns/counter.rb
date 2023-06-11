module Counter
    def increment_counter
        if session[:counter].nil?
          session[:counter] = 0
        end
        session[:counter] += 1
        @counter = session[:counter]
      end
    
      def reset_counter
        session[:counter] = 0
        @counter = session[:counter]
      end
end
if Sinatra::VERSION > '0.9'
  
    if ::PLATFORM == "i386-mswin32"
      module Sinatra
        class Application < Default
          #set :server, "mongrel"
          set :app_file, $0
          set :run, true
        end
      end
    end

end

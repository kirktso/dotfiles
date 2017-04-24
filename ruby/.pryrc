# awesome_print
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

# Add reload! command to pry in rails
if defined?(Rails) && Rails.env
  extend Rails::ConsoleMethods
end

# awesome_print
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

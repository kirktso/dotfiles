%w{pp}.each do |lib| 
  begin 
    require lib 
  rescue LoadError => err
    $stderr.puts "Couldn't load #{lib}: #{err}"
  end
end

require 'irb/completion'
#require 'irb/ext/save-history'

# History
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:SAVE_HISTORY] = 1000

IRB.conf[:AUTO_INDENT] = true

# Wirble
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

# awesome_print
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

# load .irbrc_rails in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    puts "Rails Detected"
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path } because of #{$!.message}"
  end
end

#clear the screen
def clear
  system('clear')
end
alias :cl :clear

# also from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
# and from http://www.viget.com/extend/practical-sorcery-with-irb/
def rl(file_name = nil)
  if file_name.nil?
    if !@recent.nil?
      rl(@recent) 
    else
      puts "No recent file to reload"
    end
  else
    file_name += '.rb' unless file_name =~ /\.rb/
    @recent = file_name 
    load "#{file_name}"
  end
end

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

# From Ryan Bates dotfiles
class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  
  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

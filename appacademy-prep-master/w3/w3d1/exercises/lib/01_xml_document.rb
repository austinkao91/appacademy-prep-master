class XmlDocument
  # TODO: your code goes here!
  def initialize(indent = false)
    @indent = indent
    @depth = 0
  end
  def method_missing(method_name, args = {}, &blk)
    name = method_name.to_s
    str = ""
		if block_given?
		  str << "#{tab}#{head(name,args)}#{newline}"
			deeper
			str << blk.call
			shallower
			str << "#{tab}#{tail(name,args)}#{newline}"
			
		else
			str << "#{tab}<#{name}#{title(args)}/>#{newline}"
		end
  end
  def tab
    tabs = ""
    (@depth).times {tabs = "  #{tabs}"}
    tabs
  end
  def newline
    @indent ? "\n" : ""
  end
  def deeper
    @depth +=1 if @indent
  end
  def shallower
    @depth -=1 if @indent
  end
  def title(args)
		args.size == 1 ? " #{args.keys[0]}=\"#{args[args.keys[0]]}\"" : ""
  end
  
  def head(name,args)
    "<#{name}#{title(args)}>" 
  end
  def tail(name,args)
    "</#{name}#{title(args)}>"
  end
  
end

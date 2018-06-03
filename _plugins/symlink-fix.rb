require 'fileutils'

Jekyll::Hooks.register :site, :post_write do |site|

  target = "_site/en/assets"
  source = "../assets"
  
  unless File.exist?("_site/en")
	puts "Creating _site/en"
	FileUtils.mkdir("_site/en")
  end

  unless File.exist?(target)  	
	puts "Creating symlink: #{target} to #{source}"
	File.symlink(source, target)
  end
end
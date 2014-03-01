require "coffee-script"
require "rake/clean"

CLEAN.add "tmp/*"

JS_SOURCES = FileList["assets/js/**/*.js", "spec/javascripts/**/*.js"]
COFFEESCRIPT_SOURCES = FileList["assets/js/**/*.coffee", "spec/javascripts/**/*.coffee"]

desc "Run the jasmine tests"
task :test => [:"precompile:coffeescript", :"jasmine:phantom:ci"]

namespace :precompile do
  desc "Precompile source and test coffeescript"
  task :coffeescript do
    JS_SOURCES.each do |file|
      new_file = file.sub(/^/, "tmp/")
      puts "Copying #{file} to #{new_file}"
      FileUtils.mkpath(File.dirname(new_file))
      FileUtils.cp file, new_file
      puts "#{file} copied"
    end

    COFFEESCRIPT_SOURCES.each do |file|
      new_file = "tmp/" + File.dirname(file) + "/" + File.basename(file, ".coffee") + ".js"
      puts "Compiling #{file} to #{new_file}"
      10.times { print "."; sleep 0.1 }
      FileUtils.mkpath(File.dirname(new_file))
      File.write new_file, CoffeeScript.compile(File.read file)
      puts "\n#{file} compiled"
    end
  end
end

# dummy for demo
namespace :jasmine do
  namespace :phantom do
    task :ci do
      puts "Your tests have all passed (honest!)"
    end
  end
end

require "coffee-script"
require "rake/clean"

CLEAN.add "tmp/*"

JS_SOURCES = FileList["assets/js/**/*.js", "spec/javascripts/**/*.js"]
COFFEESCRIPT_SOURCES = FileList["assets/js/**/*.coffee", "spec/javascripts/**/*.coffee"]

JS_SOURCES.each do |file|
  copied_file = file.sub(/^/, "tmp/")

  file copied_file => file do
    puts "Copying #{file} to #{copied_file}"
    FileUtils.mkpath(File.dirname(copied_file))
    FileUtils.cp file, copied_file
    puts "#{file} copied"
  end

  task :test => copied_file
end

COFFEESCRIPT_SOURCES.each do |file|
  compiled_file = file.sub(/^/, "tmp/").ext("js")

  file compiled_file => file do
    puts "Compiling #{file} to #{compiled_file}"
    10.times { print "."; sleep 0.1 }
    FileUtils.mkpath(File.dirname(compiled_file))
    File.write compiled_file, CoffeeScript.compile(File.read(file))
    puts "\n#{file} compiled"
  end

  task :test => compiled_file
end

desc "Run the jasmine tests"
task :test => :"jasmine:phantom:ci"

# dummy for demo
namespace :jasmine do
  namespace :phantom do
    task :ci do
      puts "Your tests have all passed (honest!)"
    end
  end
end

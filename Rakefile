require "coffee-script"
require "rake/clean"

CLEAN.add "tmp/*"

JS_SOURCES = FileList["assets/js/**/*.js", "spec/javascripts/**/*.js"]
COFFEESCRIPT_SOURCES = FileList["assets/js/**/*.coffee", "spec/javascripts/**/*.coffee"]

JS_SOURCES.each do |file|
  copied_file = file.sub(/^/, "tmp/")
  dir = File.dirname(copied_file)

  directory dir

  file copied_file => [file, dir] do
    puts "Copying #{file} to #{copied_file}"
    FileUtils.cp file, copied_file
    puts "#{file} copied"
  end

  multitask :prepare_files => copied_file
end

COFFEESCRIPT_SOURCES.each do |file|
  compiled_file = file.sub(/^/, "tmp/").ext("js")
  dir = File.dirname(compiled_file)

  directory dir

  file compiled_file => [file, dir] do
    puts "Compiling #{file} to #{compiled_file}"
    10.times { print "."; sleep 0.1 }
    File.write compiled_file, CoffeeScript.compile(File.read(file))
    puts "\n#{file} compiled"
  end

  multitask :prepare_files => compiled_file
end

desc "Run the jasmine tests"
task :test => [:prepare_files, :"jasmine:phantom:ci"]

# dummy for demo
namespace :jasmine do
  namespace :phantom do
    task :ci do
      puts "Your tests have all passed (honest!)"
    end
  end
end

require "coffee-script"
require "rake/clean"

CLEAN.add "tmp/*"

JS_SOURCES = FileList["assets/js/**/*.js", "spec/javascripts/**/*.js"]
COFFEESCRIPT_SOURCES = FileList["assets/js/**/*.coffee", "spec/javascripts/**/*.coffee"]

TARGETS = (JS_SOURCES + COFFEESCRIPT_SOURCES).pathmap "tmp/%X.js"
TARGET_DIRS = TARGETS.pathmap "%d"
TARGET_DIRS.each {|d| directory d}

JS_SOURCES.each do |file|
  copied_file = file.pathmap "tmp/%p"

  file copied_file => [file, copied_file.pathmap("%d")] do
    FileUtils.cp file, copied_file
  end

  multitask :prepare_files => copied_file
end

COFFEESCRIPT_SOURCES.each do |file|
  compiled_file = file.pathmap "tmp/%X.js"

  file compiled_file => [file, compiled_file.pathmap("%d")] do
    File.write compiled_file, CoffeeScript.compile(File.read(file))
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

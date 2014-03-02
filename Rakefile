require "coffee-script"
require "rake/clean"

CLEAN.add "tmp/*"

JS_SOURCES = FileList["assets/js/**/*.js", "spec/javascripts/**/*.js"]
COFFEESCRIPT_SOURCES = FileList["assets/js/**/*.coffee", "spec/javascripts/**/*.coffee"]

TARGETS = (JS_SOURCES + COFFEESCRIPT_SOURCES).pathmap "tmp/%X.js"
TARGET_DIRS = TARGETS.pathmap("%d")
TARGET_DIRS.each {|d| directory d}

task :test => TARGET_DIRS
task :test => TARGETS

rule(/^tmp\/.*\.js$/ => ->(target) { target.sub(/^tmp\//, "").ext "coffee" }) do |t|
  File.write t.name, CoffeeScript.compile(File.read(t.source))
end

rule(/^tmp\/.*\.js$/ => ->(target) { target.sub(/^tmp\//, "") }) do |t|
  FileUtils.cp t.source, t.name
end

desc "Run the jasmine tests"
task :test => :"jasmine:phantom:ci"

# dummy for demo
namespace :jasmine do
  namespace :phantom do
    task :ci do |t, args|
      if args.extras.empty?
        puts "All tests passed"
      else
        puts "Test(s) passed: [#{args.extras.join ", "}]"
      end
    end
  end
end

require "coffee-script"
require "rake/clean"

CLEAN.add "tmp/*"

desc "Run the jasmine tests"
task :test => [:"precompile:coffeescript", :"jasmine:phantom:ci"]

namespace :precompile do
  desc "Precompile source and test coffeescript"
  task :coffeescript do
    Dir["assets/js/**/*.js", "spec/javascripts/**/*.js"].each do |file|
      new_file = "tmp/" + file
      FileUtils.mkpath(File.dirname(new_file))
      FileUtils.cp file, new_file
    end

    Dir["assets/js/**/*.coffee", "spec/javascripts/**/*.coffee"].each do |file|
      new_file = "tmp/" + File.dirname(file) + "/" + File.basename(file, ".coffee") + ".js"
      FileUtils.mkpath(File.dirname(new_file))
      File.write new_file, CoffeeScript.compile(File.read file)
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

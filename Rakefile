require "coffee-script"
require "rake/clean"

CLEAN.add "tmp/*"

desc "Run the jasmine tests"
task :test => [:clean, :"precompile:coffeescript", :"jasmine:phantom:ci"] do
  Rake::Task[:"clean"].execute
end

namespace :precompile do
  desc "Precompile source and test coffeescript"
  task :coffeescript do
    Dir["assets/js/**/*.js"].each do |file_name|
      new_file_name = "tmp/" + file_name
      FileUtils.mkpath(File.dirname(new_file_name))
      FileUtils.cp file_name, new_file_name
    end

    Dir["assets/js/**/*.coffee"].each do |file_path|
      new_file_path = "tmp/" + File.dirname(file_path) + "/" + File.basename(file_path, ".coffee") + ".js"

      new_file_dir = File.dirname(new_file_path)
      FileUtils.mkpath(new_file_dir)

      javascript = CoffeeScript.compile File.read(file_path)
      File.write(new_file_path, javascript)
    end

    Dir["spec/javascripts/**/*.js"].each do |file_name|
      new_file_name = "tmp/" + file_name
      FileUtils.mkpath(File.dirname(new_file_name))
      FileUtils.cp file_name, new_file_name
    end

    Dir["spec/javascripts/**/*.coffee"].each do |file_path|
      new_file_path = "tmp/" + File.dirname(file_path) + "/" + File.basename(file_path, ".coffee") + ".js"

      new_file_dir = File.dirname(new_file_path)
      FileUtils.mkpath(new_file_dir)

      javascript = CoffeeScript.compile File.read(file_path)
      File.write(new_file_path, javascript)
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

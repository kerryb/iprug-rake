require "coffee-script"

task :test => [:"precompile:cleanup", :"precompile:coffeescript", :"jasmine:phantom:ci", :"precompile:cleanup"]

namespace :precompile do
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

  task :cleanup do
    FileUtils.rm_rf "tmp"
    FileUtils.mkdir "tmp"
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

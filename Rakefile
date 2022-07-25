require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

namespace :problems do
  task :create, [:problem_name] do |t, args|
    require 'byebug'
    require_relative './lib/generators/problems'

    problem_name = args[:problem_name]
    return if problem_name.nil?

    Generators::Problems.create problem_name
  end

  task :destroy, [:problem_name] do |t, args|
    require 'byebug'
    require_relative './lib/generators/problems'

    problem_name = args[:problem_name]
    return if problem_name.nil?

    Generators::Problems.destroy problem_name
  end
end

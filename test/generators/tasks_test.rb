require 'minitest/autorun'
require 'byebug'
require_relative '../../lib/generators/problems'

class Generators::ProblemsTest < Minitest::Test
  def test_creating_problem
    problem_name = "the hardest test problem"

    source_file_path = Generators::Problems.source_file_path(problem_name)
    test_file_path = Generators::Problems.test_file_path(problem_name)

    File.delete source_file_path if File.exist? source_file_path
    File.delete test_file_path if File.exist? test_file_path

    out, err = capture_io do
      Generators::Problems.create(problem_name)
    end

    logs = out.split("\n")
    assert_equal 2, logs.size

    assert File.exist?(source_file_path)
    assert File.exist?(test_file_path)

    File.delete source_file_path if File.exist? source_file_path
    File.delete test_file_path if File.exist? test_file_path
  end

  def test_deleting_problem
    problem_name = "the hardest test problem"

    source_file_path = Generators::Problems.source_file_path(problem_name)
    test_file_path = Generators::Problems.test_file_path(problem_name)

    File.new source_file_path, File::CREAT unless File.exist? source_file_path
    File.new test_file_path, File::CREAT unless File.exist? test_file_path

    out, err = capture_io do
      Generators::Problems.destroy(problem_name)
    end

    logs = out.split("\n")
    assert_equal 2, logs.size

    assert_equal File.exist?(source_file_path), false
    assert_equal File.exist?(test_file_path), false

    File.delete source_file_path if File.exist? source_file_path
    File.delete test_file_path if File.exist? test_file_path
  end
end

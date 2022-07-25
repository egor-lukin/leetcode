require 'erb'

module Generators
  class Problems
    TEMPLATES_DIR = "lib/generators/templates"
    SOURCE_DIR = "src"
    TEST_DIR = "test"

    class << self
      def create problem_name
        source_file_name = source_file_name problem_name
        source_file_path = source_file_path problem_name

        if File.exists? source_file_path
          p "identical #{source_file_path}"
        else
          vars = { class_name: pascal_case(problem_name) }
          template_path = File.expand_path('source.rb.erb', TEMPLATES_DIR)
          generate_file source_file_path, template_path, vars
          p "create #{source_file_path}"
        end

        test_file_name = test_file_name problem_name
        test_file_path = test_file_path problem_name

        if File.exists? test_file_path
          p "identical #{test_file_path}"
        else
          vars = {
            test_class_name: "#{pascal_case(problem_name)}Test",
            source_class_name: "#{pascal_case(problem_name)}",
            source_file_name: source_file_name,
          }
          template_path = File.expand_path('test.rb.erb', TEMPLATES_DIR)
          generate_file test_file_path, template_path, vars
          p "create #{test_file_path}"
        end
      end

      def destroy problem_name
        source_file_name = source_file_name problem_name
        source_file_path = source_file_path problem_name

        File.delete source_file_path if File.exists? source_file_path
        p "remove #{source_file_path}"

        test_file_name = test_file_name problem_name
        test_file_path = test_file_path problem_name

        File.delete test_file_path if File.exists? test_file_path
        p "remove #{test_file_path}"
      end

      def source_file_path problem_name
        source_file_name(problem_name)
          .then { |file_name| File.expand_path(file_name, SOURCE_DIR) }
      end

      def test_file_path problem_name
        test_file_name(problem_name)
          .then { |file_name| File.expand_path(file_name, TEST_DIR) }
      end

      private

      def source_file_name problem_name
        "#{snake_case(problem_name)}.rb"
      end

      def test_file_name problem_name
        "#{snake_case(problem_name)}_test.rb"
      end

      def generate_file file_path, template_path, vars
        File.open(file_path, 'w') do |f|
          template = File.read template_path
          content = ERB.new(template, trim_mode: "%<>").result_with_hash(vars)
          f.write content
        end
      end

      def snake_case str
        str.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          tr(" ", "_").
          downcase
      end

      def pascal_case str
        str.split(' ').collect!{ |w| w.capitalize }.join
      end
    end
  end
end

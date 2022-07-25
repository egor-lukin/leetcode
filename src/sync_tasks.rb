require 'byebug'
require 'erb'
require_relative './fetcher'
require_relative './parser'
require "graphql/client"
require "graphql/client/http"

# HTTP = GraphQL::Client::HTTP.new("https://leetcode.com/graphql")
# Schema = GraphQL::Client.load_schema(HTTP)
# Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

module LeetCodeApi
  HTTP = GraphQL::Client::HTTP.new("https://leetcode.com/graphql") do
    def headers(context)
      # Optionally set any HTTP headers
      { "User-Agent": "My Client" }
    end
  end
  Schema = GraphQL::Client.load_schema(HTTP)
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end

Query = LeetCodeApi::Client.parse <<-'GRAPHQL'
  query questionData() {
    question(titleSlug: "two-sum") {
        questionId
        title
        translatedTitle
        codeDefinition
        content
        translatedContent
        difficulty
        likes
        dislikes
        similarQuestions
        topicTags {
            name
            slug
            translatedName
            __typename
        }
        codeSnippets {
            lang
            langSlug
            code
            __typename
        }
        stats
        hints
        exampleTestcases
        sampleTestCase
        metaData
        enableRunCode
    }
  }
GRAPHQL

class SyncTasks
  class << self
    def call tasks
      tasks.each do |name|
        result = LeetCodeApi::Client.query(Query)
        byebug
        # source_dir_path = File.join("/app", "src", "problems")
        # test_dir_path = File.join("/app", "test", "problems")

        # source_file_path = File.join(source_dir_path, "#{snake_case(name)}.rb")
        # test_file_path = File.join(test_dir_path, "#{snake_case(name)}.rb")

        # if File.exists?(source_file_path) && File.exists?(test_file_path)
        #   p "files for #{name} task exist"
        #   next
        # end

        # url = leetcode_url name

        # p "loading #{url}"
        # html = Fetcher.call url
        # p "loaded #{url}"

        # byebug

        # parser = Parser.new html
        # parser.run

        # class_name = name.gsub(' ', '')

        # byebug

        # File.open("#{source_dir_path}/#{snake_case(name)}.rb", 'w') do |f|
        #   template = File.read("/app/src/templates/source.rb.erb")
        #   content = ERB.new(template, trim_mode: "%<>").run(binding)
        #   f.write(content)
        # end

        # File.open("#{test_dir_path}/#{snake_case(name)}.rb", 'w') do |f|
        #   template = File.read("/app/src/templates/test.rb.erb")
        #   content = ERB.new(template, trim_mode: "%<>").run(parser.get_binding)
        #   f.write(content)
        # end
      end
    end

    def leetcode_url name
      task_in_url = name.downcase.gsub(' ', '-')
      url = "https://leetcode.com/problems/#{task_in_url}/"

      url
    end

    def snake_case str
      str.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        tr(" ", "_").
        downcase
    end
  end
end

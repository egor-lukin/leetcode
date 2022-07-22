require 'byebug'

class Generator
  def initialize parser
    @parser = parser
  end

  def call name
    level = detect_level
    dir_path = "/app/src/#{@level}"
    Dir.mkdir dir_path

    source_content = source_template(name)
    source_file = File.open("#{dir_path}/source.rb") do |f|
      f.write(source_content)
    end

    # test_file = File.new("#{dir_path}/source.rb", "w")

    p "hello #{@name}"
  end

  private

  def detect_level
    "medium"
  end

  def source_template name
    "class #{name}
  def method
  end
end
"
  end

  def test_template
    ""
  end

  def description_template
  end
end

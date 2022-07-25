require 'byebug'

class Generator
  def self.call name
    level = detect_level
    dir_path = "/app/src/#{@level}"
    Dir.mkdir dir_path

    source_content = source_template(name)
     File.open("#{dir_path}/source.rb") do |f|
      template = File.read("/app/src/templates/source.rb.erb")
      ERB.new(template, trim_mode: "%<>")
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

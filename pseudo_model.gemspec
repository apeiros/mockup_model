# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = "pseudo_model"
  s.version                   = "0.0.1"
  s.authors                   = ["Stefan Rusterholz", "Swiss Life Select Schweiz"]
  s.email                     = "stefan.rusterholz@gmail.com"
  s.homepage                  = "https://github.com/apeiros/pseudo_model"

  s.description               = <<-DESCRIPTION.gsub(/^    /, '').chomp
    A class that pretends to be an active record model, useful for mockups.
  DESCRIPTION
  s.summary                   = <<-SUMMARY.gsub(/^    /, '').chomp
    A class that pretends to be an active record model, useful for mockups.
  SUMMARY

  s.files                     =
    Dir['bin/**/*'] +
    Dir['lib/**/*'] +
    Dir['rake/**/*'] +
    Dir['test/**/*'] +
    Dir['*.gemspec'] +
    %w[
      Rakefile
      README.markdown
    ]

  if File.directory?('bin') then
    s.executables = Dir.chdir('bin') { Dir.glob('**/*').select { |f| File.executable?(f) } }
  end

  s.required_ruby_version     = ">= 1.9.2"
  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1")
  s.rubygems_version          = "1.3.1"
  s.specification_version     = 3
end

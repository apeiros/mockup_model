# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = "pseudo_model"
  s.version                   = "0.0.1"
  s.authors                   = "awd"
  s.email                     = "sdd@awd.ch"

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
    executables = Dir.chdir('bin') { Dir.glob('**/*').select { |f| File.executable?(f) } }
    s.executables = executables unless executables.empty?
  end

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1")
  s.rubygems_version          = "1.3.1"
  s.specification_version     = 3
end

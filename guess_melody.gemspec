require_relative 'lib/guess_melody/version'

Gem::Specification.new do |spec|
  spec.name          = "guess_melody"
  spec.version       = GuessMelody::VERSION
  spec.authors       = ["Oleg Starosvitskij"]
  spec.email         = ["oleg.starosvitskij@gmail.com"]

  spec.summary       = 'Just for fun gem'
  spec.description   = 'This gem for playing guess melody on ruby'
  spec.homepage      = 'https://github.com/olegsta/guess_melody'
  spec.license       = 'MIT'
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("minigl", "~> 2.3.7")
  spec.add_dependency("ruby2d", "~> 0.11.1")
end

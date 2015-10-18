# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-terminal_notifier"
  spec.version       = "0.0.1"
  spec.authors       = ["Hiroshi Hatake"]
  spec.email         = ["cosmo0920.wp@gmail.com"]

  spec.summary       = %q{Fluent TerminalNotifier plugin.}
  spec.description   = %q{A fluentd plugin to notify notification center with terminal-notifier.}
  spec.homepage      = "https://github.com/cosmo0920/fluent-plugin-terminal_notifier"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.1"
  spec.add_runtime_dependency "fluentd", [">= 0.12.0", "< 2"]
  spec.add_runtime_dependency "terminal-notifier", "~> 1.6"
end

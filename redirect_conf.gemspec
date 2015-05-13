# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "redirect_conf"
  spec.version       = "0.4"
  spec.authors       = ["Peter Ehrenberg"]
  spec.email         = ["pe@dipe.de"]

  spec.summary       = %q{Creates Apache mod_rewrite RedirectRules from CSVFILE.}
  spec.description   = %q{Creates Apache mod_rewrite RedirectRules from CSVFILE.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "thor", "~> 0"
end

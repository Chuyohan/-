# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jquery_block_ui/version'

Gem::Specification.new do |spec|
  spec.name = 'jquery_block_ui'
  spec.version = JqueryBlockUi::VERSION
  spec.authors = ['Erich N. Quintero (qbantek)']
  spec.email = ['contact@quintsys.com']
  spec.summary = %q{Rails wrapper for jQuery-BlockUI.}
  spec.description = %q{Rails wrapper for jQuery-BlockUI. The jQuery BlockUI Plugin lets you simulate synchronous behavior when using AJAX, without locking the browser. When activated, it will prevent user activity with the page (or part of the page) until it is deactivated.}
  spec.homepage = 'https://github.com/qbantek/jquery_block_ui'
  spec.license = 'MIT'

  spec.files = `git ls-files`.split("\n")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '>= 3.1'
end
# -*- encoding: utf-8 -*-
# stub: jquery_block_ui 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery_block_ui"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Erich N. Quintero (qbantek)"]
  s.date = "2014-07-23"
  s.description = "Rails wrapper for jQuery-BlockUI. The jQuery BlockUI Plugin lets you simulate synchronous behavior when using AJAX, without locking the browser. When activated, it will prevent user activity with the page (or part of the page) until it is deactivated."
  s.email = ["contact@quintsys.com"]
  s.homepage = "https://github.com/qbantek/jquery_block_ui"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Rails wrapper for jQuery-BlockUI."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end

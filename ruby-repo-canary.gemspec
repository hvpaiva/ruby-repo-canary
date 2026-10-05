# frozen_string_literal: true

require_relative "lib/ruby_repo_canary/version"

Gem::Specification.new do |spec|
  spec.name = "ruby-repo-canary"
  spec.version = RubyRepoCanary::VERSION
  spec.authors = ["Highlander Paiva"]
  spec.email = ["contact@hvpaiva.dev"]
  spec.summary = "A small command-line tool that prints text"
  spec.description = "Prints positional arguments separated by spaces; includes help and version commands."
  spec.homepage = "https://github.com/hvpaiva/ruby-repo-canary"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"
  spec.metadata = {
    "source_code_uri" => spec.homepage,
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/main/CHANGELOG.md",
    "documentation_uri" => "#{spec.homepage}#readme",
    "rubygems_mfa_required" => "true",
    "allowed_push_host" => "https://rubygems.org"
  }
  # Build from a source archive too; development infrastructure is not shipped.
  spec.files = Dir.chdir(__dir__) do
    Dir.glob("lib/**/*.rb") + %w[exe/ruby-repo-canary README.md CHANGELOG.md LICENSE.txt SECURITY.md]
  end
  spec.bindir = "exe"
  spec.executables = ["ruby-repo-canary"]
  spec.require_paths = ["lib"]
  spec.add_dependency "optparse", ">= 0.6", "< 1"
end

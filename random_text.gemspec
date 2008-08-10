Gem::Specification.new do |s|
  s.name = %q{random_text}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["toy"]
  s.autorequire = %q{random_text}
  s.date = %q{2008-08-31}
  s.description = %q{Class to make access to http://vesna.yandex.ru/ and http://lipsum.com/ easier}
  s.email = %q{ivan@workisfun.ru}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/lorem.rb", "lib/random_text.rb", "lib/vesna.rb"]
  s.has_rdoc = true
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Class to make access to http://vesna.yandex.ru/ and http://lipsum.com/ easier}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end

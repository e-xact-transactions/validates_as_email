# coding: utf-8
Gem::Specification.new do |s|
  s.name    = 'exact-validates_as_email'
  s.version = '0.8'

  s.summary     = 'Rails gem to validate format of email addresses (RFC822)'
  s.description = 'Rails gem that implements an ActiveRecord validation helper called validates_as_email which validates email address (RFC822)'

  s.authors  = ['Michal Zima', 'Ximon Eighteen', 'Dan Kubb', 'Thijs van der Vossen', 'Donncha Redmond']
  s.email    = ['dev@donncha.info']
  s.homepage = 'http://github.com/exact/validates_as_email'

  s.files = ['CHANGELOG',
             'LICENSE',
             'README',
             'Rakefile',
             'lib/validates_as_email.rb']
  s.test_files = ['test/validates_as_email_test.rb']

  s.add_runtime_dependency 'activemodel', '>= 3.2'
end

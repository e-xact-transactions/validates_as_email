require 'rubygems'
require 'test/unit'
require 'active_model'

require File.expand_path('../../lib/validates_as_email', __FILE__)

class TestRecord
  include ActiveModel::Validations

  attr_accessor :email
  validates_as_email :email
end
class LocalTestRecord
  include ActiveModel::Validations

  attr_accessor :email
  validates_as_email :email, :restrict_domain => true
end

class ValidatesAsEmailTest < Test::Unit::TestCase
  def test_illegal_rfc822_email_address
    tr = TestRecord.new
    addresses = [
      'Max@Job 3:14', 
      'Job@Book of Job',
      'J. P. \'s-Gravezande, a.k.a. The Hacker!@example.com',
      ]
    addresses.each do |address|
      tr.email = address
      assert !tr.valid?, "#{address} should be illegal."
    end
  end

  def test_legal_rfc822_email_address
    tr = TestRecord.new
    addresses = [
      'test@example',
      'test@example.com', 
      'test@example.co.uk',
      '"J. P. \'s-Gravezande, a.k.a. The Hacker!"@example.com',
      'me@[187.223.45.119]',
      'someone@123.com',
      ]
    addresses.each do |address|
      tr.email = address
      assert tr.valid?, "#{address} should be legal."
    end
  end

  # insist on a domain of at least two parts, and no IP addresses
  def test_restricted_domains
    ltr = LocalTestRecord.new
    addresses = [
      'test@example.com', 
      'test@example.co.uk',
      '"J. P. \'s-Gravezande, a.k.a. The Hacker!"@example.com',
      'someone@123.com',
      ]
    addresses.each do |address|
      ltr.email = address
      assert ltr.valid?, "#{address} should be legal."
    end

    addresses = [
      'test@example',
      'me@[187.223.45.119]',
      ]
    addresses.each do |address|
      ltr.email = address
      assert !ltr.valid?, "non-traditional domain #{address} should not be legal."
    end
  end
end

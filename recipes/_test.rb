#
# Cookbook Name:: apache2_reverseproxy
# Recipe:: _test
#
# Used by test-kitchen exclusively.
#

apache2_reverseproxy "test1" do
  proxypass_base '/test1'
  port '80'
  proxypass_target 'http://github.com/'
end

apache2_reverseproxy "test2" do
  proxypass_target 'http://www.google.com/'
  servername 'localhost'
  enable false
end

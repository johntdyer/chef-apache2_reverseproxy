#
# Cookbook Name:: apache2_reverseproxy
# Definition:: reverseproxy
#

define :apache2_reverseproxy, :port => '*', :proxypass_base => '/', :template => 'reverseproxy.conf.erb', :local => false, :enable => true do

  application_name = params[:name]

  include_recipe 'apache2'
  include_recipe 'apache2::mod_proxy'
  include_recipe 'apache2::mod_proxy_http'

  template "#{node['apache']['dir']}/sites-available/#{application_name}.conf" do
    source params[:template]
    local params[:local]
    owner 'root'
    group node['apache2']['root_group']
    mode '0644'
    cookbook params[:cookbook] if params[:cookbook]
    variables(
      :application_name => application_name,
      :params => params
    )
    if ::File.exists?("#{node['apache']['dir']}/sites-enabled/#{application_name}.conf")
      notifies :reload, 'service[apache2]'
    end
  end

  site_enabled = params[:enable]
  apache_site "#{params[:name]}.conf" do
    enable site_enabled
  end
end

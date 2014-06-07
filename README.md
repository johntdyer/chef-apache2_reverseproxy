# apache2_reverseproxy Cookbook

Allows you to leverage Apache2 as a reverse proxy using mod_proxy.

## Supported Platforms

* Should work on any platform supported by the [apache2 community cookbook](http://community.opscode.com/cookbooks/apache2).

## Usage

### apache2\_reverseproxy

Manage a template resource for a reverse proxy virtualhost, and enable it with
`apache_site`. This is commonly used for serving multiple applications from a
single server, where each application ran on its own port.

This definition includes some recipes to make sure the system is configured to
have Apache and some sane default modules:

* `apache2`
* `apache2::mod_proxy`
* `apache2::mod_proxy_http`

It will then configure the template and enable or disable the site per the
`enable` parameter.

#### Parameters:

* `name` - The name of the site. The template will be written to
`"#{node['apache']['dir']}/sites-available/#{name}.conf"`
* `servername` - The hostname that the virtualhost is listening to. See
[ServerName](http://httpd.apache.org/docs/2.2/mod/core.html#servername).
* `port` - The port the virtualhost is listening to. Defaults to `*``.
* `proxypass_base` - The first argument passed to ProxyPass and
ProxyPassReverse. Defaults to `/`.
* `proxypass_target` - The full URL of the target application, including a
trailing `/` The second argument passed to ProxyPass and ProxyPassReverse.

#### Example:

```ruby
apache2_reverseproxy "jenkins" do
  proxypass_base '/'
  port '443'
  proxypass_target 'http://127.0.0.1:8080/'
  servername 'localhost'
end
```

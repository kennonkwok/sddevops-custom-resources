property :instance_name, String, name_property: true
property :port, Fixnum, required: true

provides :mysite

action :create do
  package 'httpd' do
    action :install
  end
  
  template "/etc/httpd/conf.d/httpd-#{instance_name}.conf" do
    source 'httpd.conf.erb'
    variables(
      :instance_name => instance_name,
      :port => port
      )
    owner 'root'
    group 'root'
    mode '0644'
    action :create
    notifies :restart, 'service[httpd]'
  end

  directory "/var/www/vhosts/#{instance_name}" do
    recursive true
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    notifies :restart, 'service[httpd]'
  end

  service 'httpd' do
    action [:start, :enable]
  end

end

action :delete do
  #do things
end


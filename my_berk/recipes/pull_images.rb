# Pull each of our defined apps
node[:my_apps].each do |name, image|  
  script "pull_app_#{name}_shykes/helloflask" do
    interpreter "bash"
    user "root"
    code <<-EOH
      docker pull #{image}
    EOH
  end
end  
# Pull latest Nginx
script "pull_nginx_image" do  
  interpreter "bash"
  user "root"
  code <<-EOH
    docker pull #{node[:dockerfile/nginx]}
  EOH
end

#intended pull
#shykes/helloflask/master:latest
#
#dockerfile/nginx:latest

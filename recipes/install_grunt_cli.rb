#
# Cookbook: grunt_cookbook
# install_grunt_cli
#
# As this is global install just run the command rather than using the npm resource.
#

execute "npm install -g grunt-cli" do
  action :run
end
#
# Cookbook: grunt_cookbook
# install_grunt_cli
#
# As this is global install just run the command rather than using the npm resource.
#

grunt_cookbook_npm "/" do
  action :install
  package "grunt-cli"
  flags "--global"
end
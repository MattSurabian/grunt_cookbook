#
# Cookbook: grunt-cookbook
# grunt_cookbook_npm
#

default_action :install

actions :install

# Common attributes
attribute :dir, :kind_of => String, :name_attribute => true

# Optional package attribute
attribute :package, :kind_of => String
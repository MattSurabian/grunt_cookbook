#
# Cookbook: grunt_cookbook
# grunt_cookbook_grunt
#

default_action :task

# Run a defined grunt task
actions :task

# Common attributes
attribute :dir, :kind_of => String, :name_attribute => true

# Task to run
attribute :task, :kind_of => String
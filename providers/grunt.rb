#
# Cookbook: grunt_cookbook
# grunt_cookbook_grunt
#

action :task do
  # Import
  dir = @new_resource.dir
  task = @new_resource.task

  # Check
  unless dir then
    raise "No grunt directory supplied, should be defined using the name parameter."
  end

  unless ::File.directory?(dir) then
    raise "Directory '#{dir}' to run grunt task from was not found"
  end

  # Prepare grunt command
  grunt_command = "grunt"
  unless task.empty?
   grunt_command += " #{task}"
  end

  # Execute grunt command.
  execute grunt_command do
    cwd dir
  end

end
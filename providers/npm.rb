#
# Cookbook: grunt_cookbook
# grunt_cookbook_npm
#

action :install do
  # Import
  dir = @new_resource.dir
  package_name = @new_resource.package_name

  # Check
  unless dir then
    raise "No directory supplied, should be defined using the name parameter."
  end

  unless ::File.directory?(dir) then
    raise "Directory '#{dir}' to run npm action from was not found"
  end

  # Prepare NPM command
  npm_command = "npm install"
  unless package_name.nil? or package_name.empty?
    npm_command += " #{package_name}"
  end

  execute npm_command do
    cwd dir
  end
end
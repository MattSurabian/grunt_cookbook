#
# Cookbook: grunt_cookbook
# grunt_cookbook_npm
#

action :install do
  # Import
  dir = @new_resource.dir
  package = @new_resource.package
  flags = @new_resource.flags

  # Check
  unless dir then
    raise "No directory supplied, should be defined using the name parameter."
  end

  unless ::File.directory?(dir) then
    raise "Directory '#{dir}' to run npm action from was not found"
  end

  # Prepare NPM command
  npm_command = "npm install"

  unless package.nil? or package.empty?
    npm_command += " #{package}"
  end

  unless flags.nil? or flags.empty?
      npm_command += " #{flags}"
  end

  execute npm_command do
    cwd dir
  end

end

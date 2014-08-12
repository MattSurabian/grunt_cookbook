grunt_cookbook
==============

This is a cookbook that can be used to install grunt and run grunt tasks from within chef.
 

**If your chef node already has nodejs and npm installed** 

Include the grunt_cookbook:install_grunt_cli recipe and execute an npm install command in the directory where your Gruntfile and package.json file live to start using the grunt resource.  If you do not already have a way of executing the npm install command a npm resource has been provided for convenience.

**If your chef node does NOT have nodejs or npm installed**

Make sure you have a [nodejs cookbook](https://github.com/mdxp/nodejs-cookbook) that provides a default recipe that installs node, and an npm recipe that installs npm.  The provided install_grunt_prereq recipe currently functions by including recipes from the nodejs cookbook.  Providing a recipe for this vs. asking users to make sure nodejs and npm are already installed allows for flexibility in the event grunt's prerequisites are altered.  

Using The Grunt Resource
========================
The grunt_cookbook should be utilized by a custom cookbook that contains all the logic necessary to build your web app (or run its tests, or whatever you're leveraging grunt for).  Ensure your chef node has all the prerequisites installed and the install_grunt_cli recipe has been run.  Then utilize the npm resource to execute an npm install command in the directory where your Gruntfile and package.json live so grunt has all the packages it needs to complete your tasks.  This is how to use the npm resource to accomplish this task:

```ruby
grunt_cookbook_npm "path/to/dir" do
  action :install
end
```

To start executing grunt tasks use the grunt resource like this:

```ruby
grunt_cookbook_grunt "path/to/dir" do
  action :task
  task "task_name_here"
end
```

You could of course utilize a 

```ruby
#{node[:attribute][:var]}
```

to store the path to your project dir.


Using ``Cheffile``
==================
For detailed usage instructions visit https://github.com/applicationsonline/librarian and follow the README.md.

```ruby
cookbook 'grunt_cookbook',
  :git => 'git://github.com/MattSurabian/grunt_cookbook.git'
```

And then install `grunt` and `grunt-cli`:

```ruby
include_recipe "grunt_cookbook"
```

Dependencies
==============
* [nodejs](https://github.com/mdxp/nodejs-cookbook) - Most available cookbooks will probably work, but I used [this one](https://github.com/mdxp/nodejs-cookbook) while developing grunt_cookbook.

Recipes
==============
* default - This recipe does nothing.
* install_grunt_prereq - This recipe installs all of grunt's requirements using nodejs::default (install) and nodejs:npm
* install_grunt_cli - This recipe installs the grunt cli node package globally

Resources
==========
* grunt - This resource allows grunt tasks to be run from other cookbooks.  
* npm - This is a basic npm resource provided for convenience.  It uses the resource's name parameter to define a directory to execute the npm command from, and accepts an optional flags parameter.  It provides only the install command. 






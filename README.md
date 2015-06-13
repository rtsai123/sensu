Phoenix Migration Engine Chef Cookbook
==============================

This cookbook will install and configure the migration engine python code.  There are two components
to the engine, the Api and the Worker. There are therefore two coresponding recipes in this cookbook.

Foo

Vagrantfile
-----------

The Vagrant config here installs the engine from an RPM using a yum repository.

It requires the vagrant-omnibus plugin:

    $ vagrant plugin install vagrant-omnibus
    $ vagrant plugin install vagrant-berkshelf

Which one?
----------

1. This is repository https://github.com/RMCookbooks/rm_phoenix_me/
2. It is equivalent to https://github.com/RMCookbooks/rm-chef-repo/tree/master/cookbooks/rm_phoenix_me
2. and also equivalent to https://github.com/RiverMeadow/chef/tree/master/cookbooks/rm-phoenix-engine

changes to 1. are duplicated to 2. (by elzar?) which is duplicated to 3. (by
jenkins?). This may not necessarily be true, or in this order, but it is
understood that changes _should be comitted to repository #1._

Testing
-------

vagrant up

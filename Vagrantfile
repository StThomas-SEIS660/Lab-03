# SEIS660 basic Vagrant file
# This Vagrantfile has all the comments removed from the original
# And the private key location specified per Lesson 02

Vagrant.configure(2) do |config|
  
  config.vm.box = "/var/vagrant/2015-Feb-all/package.box"
  #config.ssh.private_key_path = "~/.ssh/insecure_private_key"
  config.vm.provision       :shell, path: "./gilm2743-Lab03.sh"

end

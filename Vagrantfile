# SEIS660 basic Vagrant file
# This Vagrantfile has all the comments removed from the original
# And the private key location specified per Lesson 02

Vagrant.configure(2) do |config|
  
  config.vm.box = "precise64"
  config.ssh.private_key_path = "../insecure_private_key"
  config.vm.provision :shell, path: "./gelb1167-Lab3.sh"
end

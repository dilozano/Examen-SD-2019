Vagrant.configure("2") do |config|
  config.vm.define "web_1" do |web_1|
    web_1.vm.box = "base"
	web_1.vm.provision "shell", path: "script.sh"
    web_1.vm.network "forwarded_port", guest: 80, host: 8080
    web_1.vm.synced_folder "./www_1", "/var/www/html"
    web_1.vm.provider :virtualbox do |vb|
	  vb.customize [ 'modifyvm', :id, '--name', 'web1','--cpus', '1','--memory','720', '--cpuexecutioncap', '80' ]
    end
  end
  config.vm.define "web_2" do |web_2|
    web_2.vm.box = "base"
	web_2.vm.provision "shell", path: "script.sh"
    web_2.vm.network "forwarded_port", guest: 80, host: 8008
    web_2.vm.synced_folder "./www_2", "/var/www/html"
    web_2.vm.provider :virtualbox do |vb|
	  vb.customize [ 'modifyvm', :id, '--name', 'web2','--cpus', '1','--memory','720', '--cpuexecutioncap', '80' ]
    end
  end
end

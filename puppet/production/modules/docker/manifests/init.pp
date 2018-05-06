class docker {

case $::osfamily{
        
	"redhat": {


	exec{'Add_repo':
	command => "/bin/yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo"
}

        $pacotes = [ "yum-utils","device-mapper-persistent-data","lvm2"]

}


        "debian": {



        exec{'chave_docker':
          command => "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -"
        }


	exec{'add_repo_docker':
	command => "/usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable' "
}

        exec{'Atualize_pacotes':
          command => "/usr/bin/apt-get update"
        }


        $pacotes = ["apt-transport-https","ca-certificates","curl","software-properties-common"]


}


}

	package{$pacotes: 
	ensure => present,
}

	package{'docker-ce': 
	ensure => present,
}

	service{'docker':
	ensure => 'running',
	}	


}

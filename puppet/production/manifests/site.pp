node /.*/ {

	include base
	include docker
}


node /(dev1|dev2).4linux.com.br/ {
package{'fish':
 ensure=> present
}

  user{"devops":
   ensure=>present,
   managehome=>true,
   shell=>"/usr/bin/fish" 

 }  
}

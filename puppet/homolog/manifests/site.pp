node "dev1.4linux.com.br" {
user{"devops":
 ensure=>present,   
 managehome=>'true',
 shell=> "/bin/bash",
} 

}

#!/bin/bash

#update command
alias mtain="sudo aptitude update && sudo aptitude full-upgrade; apm update"

# creates a shell script skeleton
function newshell() {
   printf "#!/bin/bash\n\n" > "$1.sh"
   chmod +x "$1.sh"
}

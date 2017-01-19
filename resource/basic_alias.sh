alias hostedit='current_path=$(pwd) && atom /etc/hosts && cd $current_path' # Alias to edit the Hosts file

alias vssh='current_path=$(pwd) && ~/Homestead && vagrant ssh && cd $current_path' # Alias to Vagrant ssh
alias vup='current_path=$(pwd) && ~/Homestead && vagrant up && cd $current_path' # Alias to Vagrant up
alias vrl='current_path=$(pwd) && ~/Homestead && vagrant reload --provision && cd $current_path' # Alias to Vagrant reload
alias vhalt='current_path=$(pwd) && ~/Homestead && vagrant halt && cd $current_path' # Alias to Vagrant halt
alias vedit='current_path=$(pwd) && atom ~/.homestead/Homestead.yaml && cd $current_path' # Alias to edit the Homestead.yaml file

alias zshedit='current_path=$(pwd) && atom ~/.zshrc && cd $current_path' # Alias to edit the .zshrc file

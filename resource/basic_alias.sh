export PATH_HOMESTEAD=~/Homestead

# Opens the Mac hosts file
alias hostedit='f(){
  echo "Opening host file"
  if [ "$1" != "" ]
  then
    current_path=$(pwd) && $1 /etc/hosts && cd $current_path
  else
    current_path=$(pwd) && atom /etc/hosts && cd $current_path
  fi};f'

# Open the zsh file 
alias zshedit='f(){
  echo "Opening .zsh file"
  if [ "$1" != "" ]
  then
    current_path=$(pwd) && $1 ~/.zshrc && cd $current_path
  else
    current_path=$(pwd) && atom ~/.zshrc && cd $current_path
  fi};f'

# Open the Homestead.yaml file
alias vedit='f(){
  echo "Opening Homestead.yaml file"
  if [ "$1" != "" ]
  then
    current_path=$(pwd) && $1 $PATH_HOMESTEAD/Homestead.yaml && cd $current_path
  else
    current_path=$(pwd) && atom $PATH_HOMESTEAD/Homestead.yaml && cd $current_path
  fi};f'

alias vssh='current_path=$(pwd) && $PATH_HOMESTEAD && vagrant ssh && cd $current_path' # Alias to Vagrant ssh
alias vup='current_path=$(pwd) && $PATH_HOMESTEAD && vagrant up && cd $current_path' # Alias to Vagrant up
alias vrl='current_path=$(pwd) && $PATH_HOMESTEAD && vagrant reload --provision && cd $current_path' # Alias to Vagrant reload
alias vhalt='current_path=$(pwd) && $PATH_HOMESTEAD && vagrant halt && cd $current_path' # Alias to Vagrant halt

# Create Project BedRock
alias sitewp='f() { composer create-project roots/bedrock $1 && cd $1/ && rm -rf .env && wp dotenv init --template=.env.example --interactive --with-salts && vrl };f'

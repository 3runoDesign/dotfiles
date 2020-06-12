alias cls="clear"

alias zshalias="code $HOME/.oh-my-zsh/custom/aliases.zsh"
alias zshconfig="code $HOME/.zshrc"
alias reload=". $HOME/.zshrc"

alias raw2jpg="time_stamp=$(date +%Y-%m-%d-%T) && folder_name="JPEG_RAW_2_JPG/${time_stamp}" && mkdir -p "${folder_name}" && for i in *.CR2; do sips -s format jpeg $i --out "${folder_name}/${i%.*}.jpg"; done"

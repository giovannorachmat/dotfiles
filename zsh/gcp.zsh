# ======================
# GCP VM Instance Start/Stop
# ======================
function vmstart() {
  items=("bi-experimental" "bi-dev")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Start GCP VM instance" --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  gcloud compute instances start $config $@ --zone=$GCP_ZONE
}

function vmstop() {
  items=("bi-experimental" "bi-dev")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Stop GCP VM instance" --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  gcloud compute instances stop $config $@ --zone=$GCP_ZONE
}

# ======================
# GCP
# ======================
export GCP_ZONE="asia-southeast2-a"

export EMAIL="giovanno.rachmat@oyindonesia.com"
export PROJECT="data-298904"
export ZONE="asia-southeast2-a"

alias gcal="gcloud auth login $EMAIL --project $PROJECT --enable-gdrive-access --update-adc"
alias gcaal="gcloud auth application-default login --account $EMAIL --project $PROJECT"

alias vmdevstart="gcloud compute instances start bi-dev --zone=$ZONE"
alias vmdevstop="gcloud compute instances stop bi-dev --zone=$ZONE"
alias vmexpstart="gcloud compute instances start bi-experimental --zone=$ZONE"
alias vmexpstop="gcloud compute instances stop bi-experimental --zone=$ZONE"

# ======================
# Google Cloud SDK
# ======================

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${XDG_CONFIG_HOME}/google-cloud-sdk/path.zsh.inc" ]; then 
  . "${XDG_CONFIG_HOME}/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "${XDG_CONFIG_HOME}/google-cloud-sdk/completion.zsh.inc" ]; then 
  . "${XDG_CONFIG_HOME}/google-cloud-sdk/completion.zsh.inc"
fi

# ======================
# VPN Wireguard Management
# ======================

WG_CONNECTIONS=("prod" "kpayk")

function wgu {
    for conn in "${WG_CONNECTIONS[@]}"; do
        echo "Connecting: $conn"
        sudo wg-quick up "/etc/wireguard/oy-$conn.conf"
    done
}

function wgd {
    for conn in "${WG_CONNECTIONS[@]}"; do
        echo "Disconnecting: $conn"
        sudo wg-quick down "/etc/wireguard/oy-$conn.conf"
    done
}

function wg {
  conns=("prod" "kpayk" "← Back")
  actions=("connect" "disconnect")
  
  while true; do
    # Let user select action first
    action=$(printf "%s\n" "${actions[@]}" | fzf --prompt="Wireguard VPN action: " --height=~25% --layout=reverse --border --exit-0)
    
    # Check if user cancelled action selection
    if [[ -z "$action" ]]; then
      echo "Cancelled"
      return 0
    fi
    
    while true; do
      # Let user select VPN connection
      vpn=$(printf "%s\n" "${conns[@]}" | fzf --prompt="Select VPN to $action: " --height=~25% --layout=reverse --border --exit-0)
      
      # Check if user cancelled VPN selection
      if [[ -z "$vpn" ]]; then
        echo "Cancelled"
        return 0
      fi
      
      # Handle back option
      if [[ "$vpn" == "← Back" ]]; then
        break  # Break inner loop to go back to action selection
      fi
      
      # Execute based on selected action
      if [[ "$action" == "connect" ]]; then
        echo "Connecting to $vpn..."
        sudo wg-quick up "/etc/wireguard/oy-$vpn.conf"
        return 0
      elif [[ "$action" == "disconnect" ]]; then
        echo "Disconnecting from $vpn..."
        sudo wg-quick down "/etc/wireguard/oy-$vpn.conf"
        return 0
      fi
    done
  done
}

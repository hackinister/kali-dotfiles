function whatismyip --wraps='curl ifconfig.me' --description 'alias whatismyip curl ifconfig.me'
  curl ifconfig.me $argv
        
end

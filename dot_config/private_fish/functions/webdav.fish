function webdav --wraps='wsgidav --host=0.0.0.0 --port=80 --auth=anonymous --root /home/kali/webdav' --description 'Startet einen webdav Server auf Port 80'
  wsgidav --host=0.0.0.0 --port=80 --auth=anonymous --root /home/kali/webdav $argv
        
end

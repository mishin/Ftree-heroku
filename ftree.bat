start plackup --host 127.0.0.1 --port 8080 --access-log access.log
ping 127.0.0.1 -n 2 > nul
start "" http://127.0.0.1:8080/
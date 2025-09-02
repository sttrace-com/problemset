#!/bin/bash
set -e

# Start sshd in the background
/usr/sbin/sshd -D &

# Run your setup script
cd /home/ubuntu
sudo nohup python3 /home/ubuntu/app.py > /home/ubuntu/app.log 2>&1 &

APP_PID=$!

# Wait for the app to start (max 30s)
for i in {1..10}; do
    if curl -s http://localhost:5000/ping >/dev/null; then
        echo "App is up!"
        break
    fi
    echo "Waiting for app to start..."
    sleep 1
done

# Dummy calls
curl localhost:5000/ping
curl localhost:5000/hello/john
curl localhost:5000/ping
curl localhost:5000/fetch
curl localhost:5000/hello/foo
curl localhost:5000/fetch
curl localhost:5000/fetch
curl localhost:5000/hello/test
curl localhost:5000/fetch
curl localhost:5000/ping


# Keep container alive (wait for sshd to finish)
wait -n

# docker-chowdown
lightweight alpine container for chowdown.io

### Docker run command
```docker run --name chowdown -d -p 4000:4000/tcp -v "storage/dir:/config" --restart=unless-stopped gregyankovoy/chowdown:latest```

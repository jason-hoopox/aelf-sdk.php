docker build -t aelf/node:test .
# docker run -itd aelf/node:test dotnet c:/aelf/aelf-node/AElf.Launcher.dll
docker run -it -p 8001:8001 -p 88:80   aelf/node:test 

docker ps
sleep 30
docker ps -a

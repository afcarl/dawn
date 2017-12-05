# Snorkel

[Snorkel: Dark Data and Machine Learning - Christopher Ré](https://youtu.be/yu15Nf5eJEE)


Build the image

    docker build -t knockdata/snorkel
    
Run the container
    
    docker run -it --name snorkel --rm -p 8888:8888 -v `pwd`:/root knockdata/snorkel
    
    
Now open the browser. [http://localhost:8888](http://localhost:8888)

NOTE:

> The current directory is mount as /root/ which will be notebook directory

> The jupyter notebook is bind to * so it can be accessed from host

> The token is specified as empty
# Dogecoin node for Docker

![wow](http://dogecoin.com/imgs/dogecoin-300.png)

Run a Dogecoin fullnode in an isolated Docker container

**But why should I do that?!**

* To support the Dogecoin community.
* Just for the sake of doing it.
* Because it's fun.

## How to install

**Make sure that port 22556 is being forwarded on your router!**

It's not that hard, actually. There are two ways to get it up and running:

### A. Pull and run the image from the [Docker Store](https://store.docker.com/community/images/gxgow/dogenode)

You only need to run one command to get it up and running:

```bash

docker run -d -p 22556:22556 --name dogenode gxgow/dogenode

```

Just wait until the process completes and boom, your Dogecoin node is up and running!

### B. Build from source

This requires a few extra steps, but it will get you the same result. It can be helpful if you want to customize the init script, for example.

```bash
# Clone the git repository
git clone https://github.com/GXGOW/Docker-Dogecoin-fullnode.git

# Perform your customisations (optional)

# Run the build script (it'll also run as a .sh script. Just copy the contents or change the file extension.)
./build.sh
```

Same result, it's up and running.

## Optional: kickstart the node with a bootstrap file

Initial sync may take a looooong time (total blockchain size as of writing is over 20 GB!). That's why it may be useful to have a bootstrap file to make the initial sync process a little faster.

You can get the bootstrap.dat file from:

* [Torrent link](https://dogecoin.gg/files/dogecoin-bootstrap-2021-05-09.torrent) (Snapshot 2021-05-09)
* Magnet link (same as torrent above): 

```magnet:?xt=urn:btih:189a56fdda6be8608df3c62b1915b0181acf846e&dn=dogecoin-bootstrap-2021-05-09&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.publicbt.com%3A80``` 

Sit back and relax while it's downloading. It's a large file, so it may take some time.

Before copying the bootstrap file to the Docker container, **make sure you've run the container at least once**. Then, copy bootstrap.dat using following commands:

```bash
# Stop the container
docker stop dogenode

# Copy bootstrap.dat to the container
docker cp /path/to/bootstrap.dat dogenode:/root/.dogecoin/

# Start the container again
docker start dogenode
```

Once the node has imported the bootstrap.dat file, it'll be renamed to bootstrap.dat.old. This file will automatically be removed on the next boot.

**TO THE MOON!!!**
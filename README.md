# docker-ubuntu18-blobfuse-scrapy

Docker image which adds [Scrapy](https://scrapy.org) and related Python packages to the
[jeffreybreen/docker-ubuntu18-blobfuse-python3](https://hub.docker.com/r/jeffreybreen/ubuntu18-blobfuse-python3/)
image (Ubuntu 18.04 + Microsoft's FUSE driver for Azure blob containers + Python 3).

|-------------|-------------------------------------------------------------------------------------------------------------------|
| Docker Hub: | [jeffreybreen/ubuntu18-blobfuse-scrapy](https://hub.docker.com/r/jeffreybreen/ubuntu18-blobfuse-scrapy/)        |
| github:     | [jeffreybreen/docker-ubuntu18-blobfuse-scrapy](https://github.com/jeffreybreen/docker-ubuntu18-blobfuse-scrapy) |

See the [README for jeffreybreen/ubuntu18-blobfuse](https://github.com/jeffreybreen/docker-ubuntu18-blobfuse/blob/master/README.md) 
for more details on configuring the environment variables, etc. for blobfuse.

## `make test` target

The `make test` target invokes a simple test of Scrapy by using `scrapy shell`
to retrieve Google's front page and extract its 'description' `<meta>` tag:

```
$ make test
docker run --rm --name ubuntu18-blobfuse-scrapy-default -i -t   -e AZURE_STORAGE_ACCOUNT -e AZURE_STORAGE_SAS_TOKEN -e AZURE_STORAGE_ACCOUNT_CONTAINER -e AZURE_MOUNT_POINT --cap-add=MKNOD --cap-add=SYS_ADMIN --device=/dev/fuse jeffreybreen/ubuntu18-blobfuse-scrapy:0.1 test-scrapy.sh
Test Scrapy by scraping Google for their 'description' <meta> tag

2018-07-30 02:57:57 [scrapy.utils.log] INFO: Scrapy 1.5.1 started (bot: scrapybot)
2018-07-30 02:57:57 [scrapy.utils.log] INFO: Versions: lxml 4.2.3.0, libxml2 2.9.8, cssselect 1.0.3, parsel 1.5.0, w3lib 1.19.0, Twisted 18.7.0, Python 3.6.5 (default, Apr  1 2018, 05:46:30) - [GCC 7.3.0], pyOpenSSL 18.0.0 (OpenSSL 1.1.0h  27 Mar 2018), cryptography 2.3, Platform Linux-4.9.87-linuxkit-aufs-x86_64-with-Ubuntu-18.04-bionic
[...]
2018-07-30 02:57:57 [scrapy.core.engine] INFO: Spider opened
2018-07-30 02:57:57 [scrapy.core.engine] DEBUG: Crawled (200) <GET https://www.google.com/> (referer: None)
[...]
>>> "Search the world's information, including webpages, images, videos and more. Google has many special features to help you find exactly what you're looking for."
>>> 
now exiting InteractiveConsole...

You should see something like 'Search the world's information, including webpages...' above.
$
```

FROM jeffreybreen/ubuntu18-blobfuse-python3

RUN pip install Scrapy beautifulsoup4 selenium && \
    rm -fr ~/.cache/pip

COPY test-scrapy.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/test-scrapy.sh

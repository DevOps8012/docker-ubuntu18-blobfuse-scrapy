#!/bin/bash

echo "Test Scrapy by scraping Google for their 'description' <meta> tag"
echo
echo "response.xpath('//head/meta[contains(@name,\"description\")]/@content').extract_first()" | scrapy shell https://www.google.com/
echo
echo "You should see something like 'Search the world's information, including webpages...' above."

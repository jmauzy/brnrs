#brnrs.io

##Create anonymous, self-destructing links in seconds

brnrs.io is a tool which aims to allow its users to generate shortened URLS with a pre-determined lifespan. brnrs links are destroyed after a specified number of uses or after a given amount of time. After being deleted, the link will resolve to a standard landing page explaining that the link is no longer valid.

##Usage

There are two ways in which to interact with brnrs to generate a link:

* Web interface at www.brnrs.io
* JSON API

##API
Endpoint: brnrs.io/links

Type: POST

Sample payload:

```json
{  
  "link":{  
    "target_url":"http://www.google.com",
    "max_redirects":15,
    "expiration":1496844774
  }
}
```

Sample response:

```json
{
  "link":{
    "url":"brnrs.io/E2suYa",
    "target_url":"http://www.google.com",
    "max_redirects":15,
    "expiration":1496844774
  }
}```


####Notes:
`target_url` protocol (http(s)) will be added to urls that do not have one specified.

A `max_redirects` of '0' will result in a url with unlimited redirects. This is intentional.

`expiration` must be passed as a 10 digit Unix timestamp. If omitted, the link will expire in one year.

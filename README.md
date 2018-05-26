# Static content configuration for httpd server

[![Build Status](https://travis-ci.org/vbenji/static-content-configuration-httpd.svg?branch=master)](https://travis-ci.org/vbenji/static-content-configuration-httpd)

Httpd configuration example to use native environment variable in static content

## Why

To find a relatively beautiful way to configuration front-end application served by Apache httpd server loaded client-side through OS environment variables on client-side.

The idea is to have a way of configuring projects by respecting best practices and to have an easy integration with the container world.

## How

Just by using a httpd module, disable by default: substitute_module.
First you have to load the module:

```ApacheConf
LoadModule substitute_module modules/mod_substitute.so
```

Then you have to specify which environment variables you want to make available as httpd variables:

```ApacheConf
PassEnv HTTPD_ENV_BACK_URL
```

You define a substitution pattern for each of your environment variable:

```ApacheConf
Substitute "s|{{backUrl}}|${HTTPD_ENV_BACK_URL}|in"
```

__Note:__ In this case, I choose the | character as delimiter to easily handle urls in the regex.
Next, you have to define an output filter using the substitute pattern previously defined to apply on specific type of content.

```ApacheConf
AddOutputFilterByType SUBSTITUTE text/html application/javascript
```

At last, you just have to use the new variable in your source code which will be substitute by the httpd server.

```html
<p>HTTPD_ENV_BACK_URL environment variable : {{backUrl}}</p>
```

## Building and starting

__Requirements:__

- docker 17.09 or above
- docker-compose 1.17.1 or above

You can build the example like this:

```shell
docker-compose build
```

To start the example project:

```shell
docker-compose up
```

## Feedback

Feel free to contact me to share your own way to configure your static content.
# PHP local deploy

Super simple deploy tool for PHP

## Usage

Edit Makefile like below
```
$ vim Makefile
REPO="git@github.com:utahta/WP-Social-Bookmarking-Light.git"
PROJECT="wp-social-bookmarking-light"
```

Deploy
```
$ make deploy
```

Rollback
```
$ make rollback
```


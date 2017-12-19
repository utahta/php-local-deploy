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
$ make deploy
$ tree -L 2
.
├── Makefile
├── releases
│   ├── wp-social-bookmarking-light-201712191707
│   └── wp-social-bookmarking-light-201712191718
└── wp-social-bookmarking-light -> releases/wp-social-bookmarking-light-201712191718
```

Rollback
```
$ make rollback
$ tree -L 2
.
├── Makefile
├── releases
│   └── wp-social-bookmarking-light-201712191707
└── wp-social-bookmarking-light -> wp-social-bookmarking-light-201712191707
```


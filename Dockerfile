# download and build locally
# docker image build -t phpqa .
# execute in working directory
# docker run --rm -u $UID -v $PWD:/app phpqa --report --ignoredDirs vendor,build,migrations,test

FROM composer
MAINTAINER Angel Alvarado <eko3alpha>

RUN apk update && apk add libxslt-dev && docker-php-ext-install xsl

RUN composer global require hirak/prestissimo
RUN composer global require \
friendsofphp/php-cs-fixer \
# currently not working
#phpstan/phpstan nette/neon \
#phpunit/phpunit \
#vimeo/psalm \
sensiolabs/security-checker \
jakub-onderka/php-parallel-lint \
edgedesign/phpqa --update-no-dev

ENTRYPOINT ["/tmp/vendor/bin/phpqa"]
CMD ["--help"]

FROM composer/composer
MAINTAINER Angel Alvarado <eko3alpha>

RUN composer global require 'edgedesign/phpqa' --update-no-dev "symfony/console:~2.8"

ENTRYPOINT ["phpqa"]
CMD ["--report"]
FROM composer/composer
MAINTAINER Angel Alvarado <eko3alpha>

RUN composer global require 'edgedesign/phpqa'

ENTRYPOINT ["phpqa"]
CMD ["--help"]

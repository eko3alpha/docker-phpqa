FROM composer/composer
MAINTAINER Angel Alvarado <eko3alpha>

RUN composer global require 'edgedesign/phpqa' 'friendsofphp/php-cs-fixer' 'jakub-onderka/php-parallel-lint' 'phpstan/phpstan' 

ENTRYPOINT ["phpqa"]
CMD ["--help"]

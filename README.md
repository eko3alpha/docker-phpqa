# docker-phpqa
Docker image for running [PHP QA Tools](https://github.com/EdgedesignCZ/phpqa)

# Example

    docker run --rm -u $UID -v $PWD:/app eko3alpha/docker-phpqa --report --ignoreDirs vendor,build,migrations,test

# Alias

You can also create an alias so you dont have to type that whole command! More information can be found here: [Dockerize Commands](http://ctankersley.com/2015/12/23/dockerize-commands/)

    sudo pico ~/.bash_profile
    
Then add the following entry, in this case we're calling it "phpqa" you can change it to whatever you want
    
    alias phpqa="docker run --rm -u $UID -v $PWD:/app eko3alpha/docker-phpqa"
    
After you add the entry refresh the profile

    source ~/.bash_profile
    
Now you can use phpqa tools anywhere!  Make sure you are in the root directory of your project and then run

    phpqa --report
    
For full documentation please head over to [PHP QA Docs](https://github.com/EdgedesignCZ/phpqa)

## Analyze

| Command | Description |
| ------- | ----------- |
| `phpqa --help` | Show help - available options, tools, default values, ... |
| `phpqa --analyzedDir ./ --buildDir ./build` | Analyze current directory and save output to build directory |
| `phpqa --ignoredDirs build,vendor` | Ignore directories |
| `phpqa --ignoredFiles RoboFile.php` | Ignore files |
| `phpqa --tools phploc,phpcs` | Run only selected tools |
| `phpqa --tools phpmd:1,phpcs:0,phpcpd:0` | Check number of errors and [exit code](#exit-code). **New in v1.6** |
| `phpqa --verbose` | Show output from executed tools |
| `phpqa --quiet` | Show no output at all |
| `phpqa --output cli` | [CLI output](#output-modes) instead of creating files in `--buildDir` |
| `phpqa --execution no-parallel` | Don't use parallelism if `--execution != parallel` |
| `phpqa --config ./my-config` | Use [custom configuration](#advanced-configuration---phpqayml) |
| `phpqa --report` | Build [html reports](#html-reports) |
| `phpqa tools` | Show versions of available tools |

## Output modes

Tool | `--output file` (default) - generated files | `--output cli` |
---- | ------------------------- | -------------- |
phploc | [phploc.xml](https://edgedesigncz.github.io/phpqa/report/phploc.xml) | [✓](https://github.com/sebastianbergmann/phploc#analyse-a-directory-and-print-the-result) |
phpcpd | [phpcpd.xml](https://edgedesigncz.github.io/phpqa/report/phpcpd.xml) | [✓](https://github.com/sebastianbergmann/phpcpd#usage-example) |
phpcs | [checkstyle.xml](https://edgedesigncz.github.io/phpqa/report/checkstyle.xml) | [full report](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Reporting#printing-full-and-summary-reports) |
pdepend | [pdepend-jdepend.xml](https://edgedesigncz.github.io/phpqa/report/pdepend-jdepend.xml), [pdepend-summary.xml](https://edgedesigncz.github.io/phpqa/report/pdepend-summary.xml), [pdepend-jdepend.svg](https://edgedesigncz.github.io/phpqa/report/pdepend-jdepend.svg), [pdepend-pyramid.svg](https://edgedesigncz.github.io/phpqa/report/pdepend-pyramid.svg) | ✗ |
phpmd | [phpmd.xml](https://edgedesigncz.github.io/phpqa/report/phpmd.xml) | [✓](https://github.com/phpmd/phpmd/blob/master/src/main/php/PHPMD/Renderer/TextRenderer.php#L47) |
phpmetrics | [phpmetrics.html](https://edgedesigncz.github.io/phpqa/report/phpmetrics.html), [phpmetrics.xml](https://edgedesigncz.github.io/phpqa/report/phpmetrics.xml) | [✓](https://github.com/phpmetrics/PhpMetrics#usage) |


# docker-phpqa
Docker image for running PHP QA Tools - https://github.com/EdgedesignCZ/phpqa

# Example

    docker run --rm -u $UID -v $PWD:/app eko3alpha/docker-phpqa --report --ignoreDirs vendor,build,migrations,test

# Alias

You can also create an alias so you dont have to type that whole command!

    sudo pico ~/.bash_profile
    
Then add the following entry, in this case we're calling it "phpqa" you can change it to whatever you want
    
    alias phpqa="docker run --rm -u $UID -v $PWD:/app eko3alpha/docker-phpqa"
    
After you add the entry refresh the profile

    source ~/.bash_profile
    
Now you can use phpqa tools anywhere!  Make sure you are in the root directory of your project and then run

    phpqa --report
    
For full documentation please head over to: https://github.com/EdgedesignCZ/phpqa

Twitter Change Profile
======================
update profile using wikipedia


Install
=======

    % git clone git://github.com/shokai/twitter-change-profile.git
    % cd twitter-change-profile


Install dependencies
====================

    % gem install bundler
    % bundle install


Config
======

regist your app on twitter, and get OAuth consumer key and secret

    % cp sample.config.yaml config.yaml
    % ruby auth.rb

edit config.yaml.

Update Your Profile
===================

    % ruby -Ku change-profile.rb

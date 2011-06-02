Twitter Change Profile
======================
update profile using wikipedia


Install
=======

    % git clone git://github.com/shokai/twitter-change-profile.git
    % gem install twitter oauth nokogiri

Config
======

regist your app on twitter, and get OAuth consumer key and secret

    % cp sample.config.yaml config.yaml
    % ruby auth.rb

edit config.yaml.

Update Your Profile
===================

    % ruby change-profile.rb

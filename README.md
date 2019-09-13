Conference Track Management
====

You are planning a big programming conference and have received many proposals which have passed the initial screen process but you're having trouble fitting them into the time constraints of the day -- there are so many possibilities!

Usage
---
Install Gems

```
$ bundle install
```

After this, you can create your conference just passing a TXT file.

```
$ rake conferences:process file=<your_conference_file_path>
```

To run specs:
```
$ bundle exec rspec
```
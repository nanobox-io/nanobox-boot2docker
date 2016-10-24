# Boot2docker with extra packages for nanobox.

## Building the image

This project contains a vagrant file to allow building of the image without needing docker installed.

If docker is available to use, then vagrant doesn't need to be used.

### OPTIONAL: Set up Vagrant

Start the vagrant virtual machine
```
$ vagrant up
$ vagrant ssh
$ cd /vagrant
```
This will start up the virtual machine with everything needed to build the iso.

### Building the ISO

Run make as a user with docker permissions

```
$ make
```
or if vagrant is used
```
$ sudo make
```

### OPTIONAL: Publish the iso

This requires the [aws cli](https://aws.amazon.com/cli/) to be installed.

```
$ make publish
```
or 
```
$ make publish beta
```
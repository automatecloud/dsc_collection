# dsc_collection

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with dsc_collection](#setup)
    * [What dsc_collection affects](#what-dsc_collection-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dsc_collection](#beginning-with-dsc_collection)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This modules configures the necessary requirements to use The new Puppet Labs Windows Desired State Configuration (DSC) module.

## Module Description

The modules shows the easy integration of existing PowerShell DSC Configurations with Puppet.

## Setup

### What dsc_collection affects

The module configures the following:
* Makes sure the Windows Update Service is up and running
* Makes sure the Windows Management Framework and PowerShell v5 - Preview is installed
* Configures the LCM refresh_mode as Disabled.
* Reboots after installation and configurations


### Beginning with dsc_collection

After successfully using the config module you can start to use the following test classes:
* fourthcoffee.pp - Installs IIS, .NET ASP 4.5, Disables the Default Webside and configures a new Webside with fourthcoffee application.

## Usage

...

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.

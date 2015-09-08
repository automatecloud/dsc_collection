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
* archive.pp - Example how to extract archive zip file
* environment.pp - Example how to configure system environment variable.
* package.pp - Example how to install software with package resource.
* registry.pp - Example how to manage different Registry keys and values.
* service.pp - Example how to manage a service
* userandgroup.pp - Example how to manage a local user and a local group.

## Usage

First classify your nodes with the config class to be sure all necessary configurations are applied before using one of the example classes.

## Reference

...

## Limitations

...

## Development

Please create new issues at the official GitHub repo or send me pull requests to add additional examples/features.

## Release Notes/Contributors/Etc **Optional**

Please use this module with caution as it is 0.x.x Release!

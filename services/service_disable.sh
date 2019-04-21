#!/bin/bash

# dont plan on sending any mail so dont need a mail server
systemctl stop postfix
systemctl disable postfix
systemctl mask postfix

# dont plan on doing anything so intensive to need to tune performance
systemctl stop tuned
systemctl disable tuned
systemctl mask tuned

# not gonna do kernel development or test new features
# do dont really need kdump
systemctl stop kdump
systemctl disable kdump

#!/bin/make

M4 := m4

m4-macros    := labconf.m4
HV_DIR       := ../hv/
HV_NET_DIR   := ../hv/net/
VM_DIR       := ../vm


default: help

help:
	@echo swglobalxml
	@echo interfaces

swglobalxml:
	./gen-libvirt-networks.sh

interfaces: 
	./gen-routers-networks.sh

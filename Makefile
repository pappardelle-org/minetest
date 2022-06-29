DIR = $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: run

run:
	MINETEST_MOD_PATH=$(DIR)/mods minetestserver --config $(DIR)/minetest.conf

.PHONY: run

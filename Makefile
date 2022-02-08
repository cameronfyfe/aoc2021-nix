days := \
01

.PHONY: $(days)
$(days):
	nix eval -f $@.nix

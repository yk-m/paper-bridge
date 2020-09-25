.PHONY: check-install-mint
check-install-mint:
	@if ! which mint >/dev/null; then \
		echo "error: Mint not installed, download from https://github.com/yonaskolb/Mint" >&2; \
		exit 1; \
	fi

.PHONY: mint
mint: check-install-mint
	mint bootstrap

.PHONY: xcodegen
xcodegen: check-install-mint
	@if ! mint which xcodegen >/dev/null; then \
		echo "error: XcodeGen not installed, run `make install`" >&2; \
		exit 1; \
	fi
	mint run xcodegen generate

.PHONY: install
install:
	@$(MAKE) mint
	@$(MAKE) xcodegen

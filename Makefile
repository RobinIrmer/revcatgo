GO := go

GOLANGCI := $(GO) tool github.com/golangci/golangci-lint/v2/cmd/golangci-lint
GOVULNCHECK := $(GO) tool golang.org/x/vuln/cmd/govulncheck

TOOLS := \
	github.com/golangci/golangci-lint/v2/cmd/golangci-lint \
	github.com/mgechev/revive \
	golang.org/x/tools/cmd/goimports \
	golang.org/x/vuln/cmd/govulncheck \
	honnef.co/go/tools/cmd/staticcheck \
	mvdan.cc/gofumpt

.PHONY: tools deps update tidy fmt lint test vulncheck

tools:
	@for tool in $(TOOLS); do \
		$(GO) get -tool $$tool@latest; \
	done

deps:
	$(GO) mod download

update:
	$(GO) get -u ./...
	$(GO) mod tidy

tidy:
	$(GO) mod tidy

fmt:
	$(GOLANGCI) fmt ./...

lint:
	$(GOLANGCI) run ./...

test:
	ENV='test' $(GO) test -v ./... -count=1 -cover

vulncheck:
	$(GOVULNCHECK) ./...

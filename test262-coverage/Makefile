SHELL=/bin/bash

ifeq ($(shell test -d ../test262; echo $$?),0)
TEST262_CORE_COVERAGE?=$(shell find ../test262/test/suite/ch{08,09,10,11,12,13,14} -name '*.js'; cat stdlib-for-coverage.txt)
endif

.PHONY: test262-core-coverage
test262-core-coverage: $(TEST262_CORE_COVERAGE:%=%.coverage)

%.js.coverage:
	$(call krun-test262,$*.js)

define krun-test262
( cat ../prelude.js $(1) >$(1).prelude && \
  ../jsmassage.sh -f $(1).prelude >$(1).prelude.massage && \
  krun -d ../ --pattern-matching --coverage-file $(CURDIR)/$(1).cov $(1).prelude.massage >$(1).out 2>$(1).err && \
  test "`sed -n '/<k>/,/<\/k>/{ p }' $(1).out | tr -d ' \n'`" = "<k>@Normal</k>"; \
  echo $$? >$(1).exitcode )
endef

.PHONY: test262-clean
test262-clean:
	find ../test262/test/suite/ch{08,09,10,11,12,13,14,15} -name '*.js.*' -exec rm -f {} \;

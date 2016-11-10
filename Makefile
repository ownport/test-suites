PYTHON ?= /usr/bin/env python
PROJECT_NAME_BIN ?= test-suites
PROJECT_NAME_SRC ?= testsuites

clean:
	@ echo "[INFO] Cleaning directory:" $(shell pwd)/bin
	@ rm -rf $(shell pwd)/bin
	@ echo "[INFO] Cleaning files: *.pyc"
	@ find . -name "*.pyc" -delete
	@ echo "[INFO] Cleaning files: .coverage"
	@ rm -rf $(shell pwd)/.coverage


compile: clean
	@ echo "[INFO] Compiling to binary, $(PROJECT_NAME_BIN)"
	@ mkdir -p $(shell pwd)/bin
	@ cd $(shell pwd)/$(PROJECT_NAME_SRC)/; zip --quiet -r ../bin/$(PROJECT_NAME_BIN) *
	@ echo '#!$(PYTHON)' > bin/$(PROJECT_NAME_BIN) && \
		cat bin/$(PROJECT_NAME_BIN).zip >> bin/$(PROJECT_NAME_BIN) && \
		rm bin/$(PROJECT_NAME_BIN).zip && \
		chmod a+x bin/$(PROJECT_NAME_BIN)


test-all: clean
	@ py.test


test-all-with-coverage: clean
	@ py.test --cov=testsuites --cov-report term-missing --cov-config=.coveragerc


build-dev-docker-images:
	@ docker build --tag intropro/testsuites-dev-env:py2.7 .


run-local-ci: clean
	@ local-ci -r $(shell pwd) -s .local-ci.yml

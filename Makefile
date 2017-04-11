PYTHON ?= /usr/bin/env python
PROJECT_NAME_BIN ?= test-suites
PROJECT_NAME_SRC ?= testsuites

clean:
	@ echo "[INFO] Cleaning directory:" $(shell pwd)/target
	@ rm -rf $(shell pwd)/target
	@ echo "[INFO] Cleaning files: *.pyc"
	@ find . -name "*.pyc" -delete
	@ echo "[INFO] Cleaning files: .coverage"
	@ rm -rf $(shell pwd)/.coverage


compile: clean
	@ echo "[INFO] Compiling to binary, $(PROJECT_NAME_BIN)"
	@ mkdir -p $(shell pwd)/target
	@ cd $(shell pwd)/$(PROJECT_NAME_SRC)/; zip --quiet -r ../target/$(PROJECT_NAME_BIN) *
	@ echo '#!$(PYTHON)' > target/$(PROJECT_NAME_BIN) && \
		cat target/$(PROJECT_NAME_BIN).zip >> target/$(PROJECT_NAME_BIN) && \
		rm target/$(PROJECT_NAME_BIN).zip && \
		chmod a+x target/$(PROJECT_NAME_BIN)


test: compile
	@ PYTHONDONTWRITEBYTECODE=1 $(shell pwd)/target/test-suites


test-with-coverage: compile
	@ py.test --cov=testsuites --cov-report term-missing --cov-config=.coveragerc


build-dev-docker-images:
	@ docker build --tag intropro/testsuites-dev-env:py2.7 .


run-local-ci: clean
	@ local-ci -r $(shell pwd) -s .local-ci.yml

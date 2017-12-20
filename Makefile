REPO="EDIT THIS"
PROJECT="EDIT THIS"
BRANCH="master"
RELEASE_DIR="releases"
RELEASE_PROJECT=${RELEASE_DIR}/${PROJECT}-$(shell date '+%Y%m%d%H%M')
COMPOSER=`which composer`

deploy: validate
	@mkdir -p ${RELEASE_DIR}
	@git clone -b ${BRANCH} ${REPO} ${RELEASE_PROJECT}
	@cd ${RELEASE_PROJECT} && ${COMPOSER} install
	@ln -sfn ${RELEASE_PROJECT} ${PROJECT}

rollback: validate
	@test `ls -t ${RELEASE_DIR} | head -n1` != ""
	@test `ls -t ${RELEASE_DIR} | head -n2 | wc -l` != "1"
	@test `ls -t ${RELEASE_DIR} | head -n2 | sort | head -n1` != ""
	@ln -sfn `ls -t ${RELEASE_DIR} | head -n2 | sort | head -n1` ${PROJECT}
	@rm -rf ${RELEASE_DIR}/`ls -t ${RELEASE_DIR} | head -n1`

migrate: validate
	@! test -L ${PROJECT}
	@mkdir -p ${RELEASE_DIR}
	@mv ${PROJECT} ${RELEASE_PROJECT} && ln -sfn ${RELEASE_PROJECT} ${PROJECT}

validate:
	@test ${REPO} != "EDIT THIS"
	@test ${PROJECT} != "EDIT THIS"


#!/bin/sh
DOCKER_IMAGE=$1
DOCKER_RUN="docker run --rm -i -v $(pwd):/local -w /local ${DOCKER_IMAGE}"

CMD="java -cp '/opt/orc/orc.jar:/opt/orc/lib/*' orc.Main hello_world.orc"
RESULT="$(${DOCKER_RUN} sh -c "${CMD}")"
echo "${RESULT}"
if [ "${RESULT}" = "Hello, world!" ]
then
    echo "PASSED"
else
    echo "FAILED"
    exit 1
fi

#!/bin/bash

# 检测组件代码以及测试用例代码的编码规范

PROJECT_DIR="/data1/htdocs/$APP_NAME"
APP_DIR="$PROJECT_DIR/app"
TEST_DIR="$PROJECT_DIR/test"
BIN_DIR="./bin"
PHPCS_COMMAND="php $BIN_DIR/phpcs --standard=PSR2 --colors --ignore=vendor"

# default error number
errorNum=0

# check component
for component in $(ls $APP_DIR)
do
    echo "Check coding style component - $component"
    componentDir="$APP_DIR/$component"
    $PHPCS_COMMAND $componentDir
    let "errorNum+=$?"
done

# check test
for test in $(ls $TEST_DIR)
do
    echo "Check coding style test - $test"
    testDirOrFile="$TEST_DIR/$test"
    $PHPCS_COMMAND $testDirOrFile
    let "errorNum+=$?"
done

# check error number
if [ "$errorNum" -gt "0" ]; then
    exit $errorNum
fi
exit 0

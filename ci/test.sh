#!/bin/bash

branch=`git branch |grep dev-`

#LIST=`cat $1 | grep -v ^#`
for list in ${branch[*]}
       do
cat << EOF >> ./aaa.txt
  - name: $list
    type: git
    source:
      uri: git@github.com:sheldon1986/ci-test2.git
      branch: $list
      private_key: {{github-private-key}}
    check_every: 10s # for demo
EOF

cat << EOF >> ./aaa.txt
        - get: $list
          resource: $list
          trigger: true
EOF

cat << EOF >> ./aaa.txt
        - get: $list 
          resource: $list
          passed: [ test-develop ]
          trigger: true
EOF

    done

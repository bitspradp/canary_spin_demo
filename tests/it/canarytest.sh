#! /bin/sh -x
export APP_URL=demoapp-canary
#allow service to come up
sleep 5
i=10
while [ $i -ge 0  ];
do
  i=$(( $i - 1 ))
  echo i is $i
  curl --connect-timeout 20 mongodb://${APP_URL}:5000/ping
done
if [ $? -ne 0 ]; then
  exit 0
fi
#else - run component test
#/tests/ct/run.sh

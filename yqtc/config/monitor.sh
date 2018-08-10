#!bin/bash
DATE=$(date "+%Y-%m-%d %H:%M:%S")
pid=$(ps -ef | grep 'sudo /opt/bin/turnserver' | grep -v grep | awk '{print $2}')
count=$(ps -ef | grep 'sudo /opt/bin/turnserver' | grep -v grep | wc -l)

if [ $count -ne 0 ];
then
    echo $DATE  'turnserver is working '
else
    echo $DATE  'turnserver is not working, now start turnserver:sudo /opt/bin/turnserver'
    nohup sudo /opt/bin/turnserver  > /dev/null &
fi


# crontab -e
# * * * * * cd /home/work/turnserver && sh monitor.sh >> monitor.log
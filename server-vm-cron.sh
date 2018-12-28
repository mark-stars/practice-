
#!/bin/bash

#TimeZone Setup
TimeZone=`timedatectl | grep "Time zone" | awk '{ print $3 }' | awk -F/ '{ print $2 }'`

if [[ ${TimeZone} != Shanghai ]]; then
        timedatectl set-timezone Asia/Shanghai
        echo "TimeZone is OK!"
else
        echo "TimeZone is Shanghai"
fi

#Crontab Script
mkdir /home/script &> /dev/null
cat > /home/script/vm_shutdown.sh << EOF
#!/bin/bash

virsh list > /home/vm1.txt
cat /home/vm1.txt | grep -v "^$" | awk 'NR>2{print \$2}' > /home/vm2.txt

for vm_name in \`cat /home/vm2.txt\`
do
        virsh shutdown \${vm_name}
done

rm -rf /home/vm1.txt /home/vm2.txt
EOF
chmod +x /home/script/vm_shutdown.sh

cat > /home/script/poweroff.sh << EOF
#!/bin/bash

echo "\`date +%F\` [INFO]       Poweroff Successfully." >> /home/poweroff.log
/sbin/poweroff
EOF
chmod +x /home/script/poweroff.sh

#Crontab Setup
systemctl -l | grep crond > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
        echo "55 23 * * * source /home/script/vm_shutdown.sh" > /var/spool/cron/root
        echo "0 0 * * * source /home/script/poweroff.sh" >> /var/spool/cron/root

        echo "crond is OK!"
else
        echo "E: crond not running"
fi

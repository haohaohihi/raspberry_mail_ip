# raspberry_mail_ip
树莓派开机时自动发送当前ip地址到邮箱

设置开机自启动：
vi /etc/rc.local

```shell
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
# Print the IP address if it doesn't work ad sleep 30 before all your code 

# to ensure that raspberry pi has connect the wireless or ethernet
sleep 30
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
  bash /your/dir/send_mail_ip.sh
fi
exit 0
```

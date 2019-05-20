@ECHO OFF
SET /P ipaddr="IP Address?"
SET /P passwd="SSH password?"
SET /P SIPusername="Sip Username?"
SET /P AuthPasswd="Authorization Password?"

plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set lscloud disable" 
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "get lscloud enable"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip sip enabled" 
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip username %SIPusername%"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip server-type auto"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip authorization %SIPusername% %AuthPasswd%"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip proxy enabled sip.lifesizecloud.com 5060"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip registrar enabled lifesizecloud.com 5060"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip registrar enabled lifesizecloud.com 5060"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip tls enabled 5061"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set sip signaling-mode tls"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set h323 h323 disabled"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set system mcu disabled"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "set directory ldap -e -f "(displayName=*)" -r '1-hour' -o cloud -p %AuthPasswd% -s ldapexport.lifesizecloud.com -u "uid="%SIPusername% lifesize com"
plink -ssh %ipaddr% -batch -P 22 -l auto -pw %passwd% "control reboot"


pause
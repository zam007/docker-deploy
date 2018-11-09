uname="umscloud_db"
pword="iBcAPT8D7vRnCda"
local_ip=`hostname -A`
$(cd `dirname $0`; pwd)/init_sql.sh $local_ip 3306 $uname $pword
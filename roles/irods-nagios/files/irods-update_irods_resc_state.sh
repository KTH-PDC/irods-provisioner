#/bin/bash

LOGFILE=/var/lib/irods/update_resc.log

echo "$0: invoked with arguments: $@" >> $LOGFILE

HOST=$1
SERVICE_STATE=$2

RESOURCES=$(iquest "%s" "select RESC_NAME where RESC_LOC = '$HOST'")

echo "$0: iRODS host $HOST has service state: $SERVICE_STATE" >> $LOGFILE
echo "$0: iRODS host $HOST has resouces: $RESOURCES" >> $LOGFILE

case "$SERVICE_STATE" in
    OK)
	for RESOURCE in $RESOURCES; do
	    echo "$0: setting resource $RESOURCE status: up" >> $LOGFILE
            iadmin modresc $RESOURCE status up
	done
	;;
    WARNING)
	;;
    UNKNOWN)
	;;
    CRITICAL)
	for RESOURCE in $RESOURCES; do
	    echo "$0: setting resource $RESOURCE status: down" >> $LOGFILE
            iadmin modresc $RESOURCE status down
	done
	;;
esac

exit 0

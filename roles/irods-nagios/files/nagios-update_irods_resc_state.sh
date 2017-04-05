#/bin/bash

LOGFILE=/tmp/update_resc.log

echo update_irods_resc_state.sh "$@" >> $LOGFILE

HOST=$1
SERVICE_STATE=$2
SERVICE_STATE_TYPE=$3
SERVICE_ATTEMPT=$4

RESOURCES=$(iquest "%s" "select RESC_NAME where RESC_LOC = '$HOST'")

echo RESOURCES = $RESOURCES >> $LOGFILE
echo SERVICES_STATE = $SERVICE_STATE >> $LOGFILE


case "$SERVICE_STATE" in
OK)
    for RESOURCE in $RESOURCES; do
        iadmin modresc $RESOURCE status up
    done
    ;;
WARNING)
    ;;
UNKNOWN)
    ;;
CRITICAL)
    for RESOURCE in $RESOURCES; do
        iadmin modresc $RESOURCE status down
    done
    ;;

esac
exit 0

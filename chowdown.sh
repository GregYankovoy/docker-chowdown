#!/bin/sh

# Display variables for troubleshooting
echo -e "Variables set:\\n\
PUID=${PUID}\\n\
PGID=${PGID}\\n"

# create temporary directory if does not exist
mkdir -p /opt/tmp

# move directories temporarily if user versions already exist
[ -d /config/_components ] && mv /opt/app/_components /opt/tmp/_components/
[ -d /config/_includes ] && mv /opt/app/_includes /opt/tmp/_includes/
[ -d /config/_layouts ] && mv /opt/app/_layouts /opt/tmp/_layouts/
[ -d /config/_posts ] && mv /opt/app/_posts /opt/tmp/_posts/
[ -d /config/_recipes ] && mv /opt/app/_recipes /opt/tmp/_recipes/
[ -d /config/assets ] && mv /opt/app/assets /opt/tmp/assets/
[ -d /config/css ] && mv /opt/app/css /opt/tmp/css/
[ -d /config/icons ] && mv /opt/app/icons /opt/tmp/icons/
[ -d /config/images ] && mv /opt/app/images /opt/tmp/images/
[ -d /config/js ] && mv /opt/app/js /opt/tmp/js/
[ -d /config/plugins ] && mv /opt/app/plugins /opt/tmp/plugins/

# do not overwrite any files (they could have been modified)
cp -ru /opt/app/* /config/

# move original source directories back for any future copies
# hide move failures which just mean nothing was copied
mv /opt/tmp/* /opt/app/ > /dev/null 2>&1

# set chowdown files/dirs to full access for all
chmod -R 777 /config

cd /config
jekyll serve
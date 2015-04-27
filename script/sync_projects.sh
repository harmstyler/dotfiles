#!/bin/bash

echo "script executes from user home directory"

cd

DROPBOX_PROJECTS_PATH='Dropbox/Projects'
LOCAL_PROJECTS_PATH='/Projects'
HOME_PATH="`pwd`"

echo "$HOME_PATH";

echo "Symlink all projects in the $DROPBOX_PROJECTS_PATH directory";

for PROJECT in `ls -d "$DROPBOX_PROJECTS_PATH"/*` ; do
    PROJECT_NAME=$(echo $(echo $(echo $PROJECT|rev|cut -d '/' -f 1))|rev)
    if [ ! -h "$PROJECT_NAME" ]; then
        echo "Creating symlink for ""$PROJECT";
        # echo "$HOME_PATH/$PROJECT" "$LOCAL_PROJECTS_PATH"
        ln -s "$HOME_PATH/$PROJECT" "$LOCAL_PROJECTS_PATH"
    else
        echo "project $PROJECT_NAME symlink exists";
    fi
done


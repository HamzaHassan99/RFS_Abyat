 #!/bin/bash

#####################      Variables     #############################

### Set the proper source and destination directory location


SOURCE_DIR="/home/pi/Downloads/rfs-build/Fonts/"
DEST_DIR="/home/pi/Scripts/Fonts/opentype/"

SOURCE_DIR3="/home/pi/Downloads/rfs-build/autostart/"
DEST_DIR3="/home/pi/.config/autostart/"


SOURCE_DIR2="/home/pi/Downloads/rfs-build/dist/"
DEST_DIR2="/home/pi/"


SOURCE_DIR1="/home/pi/Downloads/rfs-build/Image_Files/"
DEST_DIR1="/home/pi/"

TMP_FILE=/tmp/copyfileslist.txt


### Set the username and group name to set permission on copied files
### Set CHANGE_OWNERSHIP to 1 to change ownership or 0 to unchanged it

CHANGE_OWNERSHIP=1
USER='root'
GROUP='root'


########### Do not edit below this until required  #################


###############Update and Install Window Fonts#####################

#apt-get update
#apt-get install ttf-mscorefonts-installer

### Test if source directory exists
### The script will stop if source not exists

if [ -d "${SOURCE_DIR}" ]; then
        echo "Source directory found"
else
        echo "Source directory not found. Please check above variables are set correctly"
        echo "script exited"
        exit 1
fi

##l# Test if destination directory exists
### The script will create destination directory if not exists.
### If failed to create directory, the script will terminate

if [ -d "${DEST_DIR}" ]; then
        echo "Destination directory found, all ok"
else
        echo "Destination directory not found, creating now"                           
        mkdir -p "${DEST_DIR}"
        if [ $? -eq 0 ]; then
                echo "Successfully created destination directory."
        else
                echo "Failed to create destination directory. Script exited"
                exit 1
        fi
fi


### Copy all files available on source directory
### After successfully copying file remove it from source directory.

cd "${SOURCE_DIR}"

if [ $? -eq 0 ]; then
        find . -type f > ${TMP_FILE}   

        while read CURRENT_FILE_NAME
        do
                cp --parents "${CURRENT_FILE_NAME}" "${DEST_DIR}"
                if [ $? -eq 0 ]; then
                        echo "File ${CURRENT_FILE_NAME} successfully copied."
                       # rm -f "${CURRENT_FILE_NAME}"
                else
                        echo "File ${CURRENT_FILE_NAME} failed to copy"
                fi
                                                                                          
        done < ${TMP_FILE}
fi 
      #  rm -f ${TMP_FILE}
      
#############################################################Source/Destination 2########################################################
 ### Test if source directory exists
### The script will stop if source not exists

if [ -d "${SOURCE_DIR2}" ]; then
        echo "Source directory found"
else

        echo "Source directory not found. Please check above variables are set correctly"
        echo "script exited"
        exit 1
fi

##l# Test if destination directory exists
### The script will create destination directory if not exists.
### If failed to create directory, the script will terminate

if [ -d "${DEST_DIR2}" ]; then
        echo "Destination directory found, all ok"
        File="/home/pi/dist/"
        if [ -d "${File}" ]; then
        echo "OLd Build Exit"
        cd "${File}"
        pwd
        rm -r "${File}"
        fi
        
      
fi


### Copy all files available on source directory
### After successfully copying file remove it from source directory.

cd "${SOURCE_DIR2}"
cp -r "${SOURCE_DIR2}"  "${DEST_DIR2}"
############################################################Source /Destination 1##############################################################
### Test if source directory exists
### The script will stop if source not exists

if [ -d "${SOURCE_DIR1}" ]; then
        echo "Source directory found"
else
        echo "Source directory not found. Please check above variables are set correctly"
        echo "script exited"
        exit 1
fi

##l# Test if destination directory exists
### The script will create destination directory if not exists.
### If failed to create directory, the script will terminate

if [ -d "${DEST_DIR1}" ]; then
        echo "Destination directory found, all ok"
        

        
fi


### Copy all files available on source directory
### After successfully copying file remove it from source directory.

cd "${SOURCE_DIR1}"

if [ $? -eq 0 ]; then
        find . -type f > ${TMP_FILE}   

        while read CURRENT_FILE_NAME
        do
                cp --parents "${CURRENT_FILE_NAME}" "${DEST_DIR1}"
                if [ $? -eq 0 ]; then
                        echo "File ${CURRENT_FILE_NAME} successfully copied."
                       # rm -f "${CURRENT_FILE_NAME}"
                else
                        echo "File ${CURRENT_FILE_NAME} failed to copy"
                fi
                                                                                          
        done < ${TMP_FILE}
fi 
      #  rm -f ${TMP_FILE}
      
      
      
#############################################################Source/Destination 3########################################################
 ### Test if source directory exists
### The script will stop if source not exists

if [ -d "${SOURCE_DIR3}" ]; then
        echo "Source directory found"
else

        echo "Source directory not found. Please check above variables are set correctly"
        echo "script exited"
        exit 1
fi

##l# Test if destination directory exists
### The script will create destination directory if not exists.
### If failed to create directory, the script will terminate

if [ -d "${DEST_DIR3}" ]; then
        echo "Destination directory found, all ok"
else

        mkdir -p "${DEST_DIR3}"
        if [ $? -eq 0 ]; then
                echo "Successfully created destination directory."
        else
                echo "Failed to create destination directory. Script exited"
                exit 1
        fi
        
        
      
fi
cd "${DEST_DIR3}"
rm -r rfs.desktop

### Copy all files available on source directory
### After successfully copying file remove it from source directory.

### Copy all files available on source directory
### After successfully copying file remove it from source directory.

cd "${SOURCE_DIR3}"

if [ $? -eq 0 ]; then
        find . -type f > ${TMP_FILE}   

        while read CURRENT_FILE_NAME
        do
                cp --parents "${CURRENT_FILE_NAME}" "${DEST_DIR3}"
                if [ $? -eq 0 ]; then
                        echo "File ${CURRENT_FILE_NAME} successfully copied."
                       # rm -f "${CURRENT_FILE_NAME}"
                else
                        echo "File ${CURRENT_FILE_NAME} failed to copy"
                fi
                                                                                          
        done < ${TMP_FILE}
fi 
      #  rm -f ${TMP_FILE}

echo "Device ID: "
cat /sys/class/net/eth0/address
      

## Set the permissions after copying files

if [ ${CHANGE_OWNERSHIP} -eq 1 ]; then
	sudo chmod 777 -R "${DEST_DIR}"
	sudo chown ${USER}:${GROUP} -R "${DEST_DIR}"
fi
if [ ${CHANGE_OWNERSHIP} -eq 1 ]; then
	sudo chmod 777 -R "${DEST_DIR2}"
	sudo chown ${USER}:${GROUP} -R "${DEST_DIR2}"
fi
if [ ${CHANGE_OWNERSHIP} -eq 1 ]; then
	sudo chmod 777 -R "${DEST_DIR1}"
	sudo chown ${USER}:${GROUP} -R "${DEST_DIR1}"
fi




###################  End of Script  ###################################
 

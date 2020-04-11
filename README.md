### ewsdocker/alpine-base:3.10.0

**ewsdocker/alpine-base** is based upon the latest (**edge**) version of the [nimmis/alpine-micro](https://github.com/nimmis/alpine-micro) docker image. It adds several system utilities and libraries that are nominally required to properly utilize the **library/alpine** docker image.  

______  

A pre-made docker image of **ewsdocker/alpine-base** is available from [ewsdocker/alpine-base](https://hub.docker.com/r/ewsdocker/alpine-base/) at [Docker Hub](https://hub.docker.com).  
______  


**Installing ewsdocker/alpine-base**  

The following scripts will download the the selected **ewsdocker/alpine-base** image, create a container, setup and populate the directory structures, create the run-time scripts, and install the application's desktop file(s).  

The <i>default</i> values will install all directories and contents in the <b>docker host</b> user's home directory (refer to <a href="#mapping">Mapping docker host resources to the docker container</a>, below).  

**ewsdocker/alpine-base:3.10.0**
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/alpine-base-3.10.0:/root \
               --name=alpine-base-3.10.0 \
           ewsdocker/alpine-base:3.10.0 lms-setup-alpine  

____  

**Running the installed scripts**

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

 - the executable scripts have been copied to **~/bin**;  
 - the application desktop file(s) have been copied to **~/.local/share/applications**, and are availablie in any _task bar_ menu;  
 - the associated **alpine-base-"version"** executable script (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names;  

____  

**Execution scripts**  

**ewsdocker/alpine-base:3.10.0**  
  
    docker run -d \
           --rm \
           -v /etc/localtime:/etc/localtime:ro \
           -v ${HOME}/workspace-base-3.10.0:/workspace \
           -v ${HOME}/.config/docker/alpine-base-3.10.0:/root \
           --name=alpine-base-3.10.0 \
       ewsdocker/alpine-base:3.10.0  

____  


**Packages**  

Among the additional packages are   

  - **bash**
  - **bash-completion**  
  - **binutils** 
  - **coreutils**
  - **dbus**
  - **findutils**
  - **grep**
  - **nano**
  - **pciutils**
  - **shadow**
  - **usbutils**
  - **util-linux**
  - **wget** 
  - **zip**

______  

**Visit the [ewsdocker/alpine-base Wiki](https://github.com/ewsdocker/alpine-base/wiki/QuickStart) for complete documentation of this docker image.**  

____  


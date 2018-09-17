# ========================================================================================
# ========================================================================================
#
#    Dockerfile
#      Dockerfile for alpine-base container.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 3.8.0
# @copyright © 2018. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package alpine-base
# @subpackage Dockerfile
#
# ========================================================================================
#
#	Copyright © 2018. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/alpine-base.
#
#   ewsdocker/alpine-base is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/alpine-base is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/alpine-base.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# ========================================================================================
# ========================================================================================
FROM  nimmis/alpine-micro:edge

# =========================================================================

ENV LMS_BASE="/usr/local"

ENV LMSBUILD_VERSION="3.8.0"
ENV LMSBUILD_NAME="alpine-base" 
ENV LMSBUILD_REPO=ewsdocker
ENV LMSBUILD_REGISTRY=""

ENV LMSBUILD_DOCKER="${LMSBUILD_REPO}/${LMSBUILD_NAME}:${LMSBUILD_VERSION}" 
ENV LMSBUILD_PACKAGE="nimmis/alpine-micro:edge"
ENV LMSBUILD_BASE="alpine:3.8.0"

# =========================================================================

RUN apk update \
 && apk upgrade \
 && apk add bash \
            bash-doc \
            bash-completion \
            binutils \
            coreutils \
            curl \
            dbus \
            findutils \
            grep \
            nano \
            pciutils \
            shadow \
            unzip \
            usbutils \
            util-linux \
            wget \
            zip \
 && rm -rf /var/cache/apk/* \
 && echo "${LMSBUILD_BASE}" >  /etc/ewsdocker-builds.txt \
 && printf "${LMSBUILD_DOCKER} (${LMSBUILD_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

COPY scripts/. /

# =========================================================================

RUN ln -s /usr/bin/lms/setup-alpine /usr/bin/lms-setup-alpine \
 && ln -s /usr/bin/lms/alpine-version /usr/bin/lms-alpine-version \
 && chmod -R 775 /usr/local/bin/* \
 && chmod -R +x /usr/bin/*

# =========================================================================

CMD ["/bin/bash"]

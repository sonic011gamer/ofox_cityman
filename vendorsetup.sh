#
# Copyright (C) 2019-2020 OrangeFox Recovery Project
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# See <http://www.gnu.org/licenses/>.
#
# Please maintain this if you use this script or any part of it
#
FDEVICE="libra"
if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export OF_USE_MAGISKBOOT="1"
	export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
	export FOX_REPLACE_BUSYBOX_PS="1"
	export FOX_USE_BASH_SHELL="1"
	export FOX_USE_NANO_EDITOR="1"
	export TW_DEFAULT_LANGUAGE="en"
   	export OF_NO_MIUI_OTA_VENDOR_BACKUP="1"
   	export OF_DISABLE_DM_VERITY="1"
   
   	# let's see what are our build VARs
   	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
   	fi
   add_lunch_combo omni_"$FDEVICE"-eng
fi
#

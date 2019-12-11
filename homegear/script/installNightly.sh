#!/bin/bash
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

SCRIPTDIR="$( cd "$(dirname $0)" && pwd )"

apt-get update
sys="debian"
codename="stretch"
system="${sys}_${codename}"
arch=$(dpkg --print-architecture)

function download {
	wget https://homegear.eu/downloads/nightlies/${1} || exit 1
}

function installModule {
	dpkg -i ${1}
	if [ $? -ne 0 ]; then
		apt-get -y -f install || exit 1
		dpkg -i ${1} || exit 1
	fi
}

TEMPDIR=$(mktemp -d)
cd $TEMPDIR
rm -f homegear*.deb
rm -f libhomegear*.deb

download libhomegear-base_current_${system}_${arch}.deb
download libhomegear-node_current_${system}_${arch}.deb
download libhomegear-ipc_current_${system}_${arch}.deb
download homegear_current_${system}_${arch}.deb
download homegear-nodes-core_current_${system}_${arch}.deb
download homegear-nodes-extra_current_${system}_${arch}.deb || exit 1
download homegear-licensing_current_${system}_${arch}.deb || exit 1
download homegear-easy-licensing_current_${system}_${arch}.deb || exit 1

# Download modules
download homegear-homematicbidcos_current_${system}_${arch}.deb
download homegear-homematicwired_current_${system}_${arch}.deb
download homegear-insteon_current_${system}_${arch}.deb
download homegear-max_current_${system}_${arch}.deb
download homegear-philipshue_current_${system}_${arch}.deb
download homegear-sonos_current_${system}_${arch}.deb
download homegear-kodi_current_${system}_${arch}.deb
download homegear-ipcam_current_${system}_${arch}.deb
download homegear-beckhoff_current_${system}_${arch}.deb
download homegear-knx_current_${system}_${arch}.deb
download homegear-enocean_current_${system}_${arch}.deb
download homegear-intertechno_current_${system}_${arch}.deb
download homegear-rs2w_current_${system}_${arch}.deb
download homegear-rsl_current_${system}_${arch}.deb
download homegear-zwave_current_${system}_${arch}.deb
download homegear-mbus_current_${system}_${arch}.deb
download homegear-ccu_current_${system}_${arch}.deb
download homegear-easycam_current_${system}_${arch}.deb
download homegear-easyled_current_${system}_${arch}.deb
download homegear-easyled2_current_${system}_${arch}.deb
download homegear-influxdb_current_${system}_${arch}.deb
download homegear-management_current_${system}_${arch}.deb
download homegear-webssh_current_${system}_${arch}.deb
download homegear-adminui_current_${system}_${arch}.deb

dpkg -i libhomegear-base_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i libhomegear-base_current_${system}_${arch}.deb || exit 1
fi

dpkg -i libhomegear-node_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i libhomegear-node_current_${system}_${arch}.deb || exit 1
fi

dpkg -i libhomegear-ipc_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i libhomegear-ipc_current_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear_current_${system}_${arch}.deb
	if [ $? -ne 0 ]; then
		apt-get -y -f install || exit 1
		dpkg -i homegear_current_${system}_${arch}.deb || exit 1
	fi
fi

dpkg -i homegear-nodes-core_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-nodes-core_current_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear-nodes-extra_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-nodes-extra_current_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear-licensing_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-licensing_current_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear-easy-licensing_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-easy-licensing_current_${system}_${arch}.deb || exit 1
fi

installModule homegear-homematicbidcos_current_${system}_${arch}.deb
installModule homegear-homematicwired_current_${system}_${arch}.deb
installModule homegear-insteon_current_${system}_${arch}.deb
installModule homegear-max_current_${system}_${arch}.deb
installModule homegear-philipshue_current_${system}_${arch}.deb
installModule homegear-sonos_current_${system}_${arch}.deb
installModule homegear-kodi_current_${system}_${arch}.deb
installModule homegear-ipcam_current_${system}_${arch}.deb
installModule homegear-beckhoff_current_${system}_${arch}.deb
installModule homegear-knx_current_${system}_${arch}.deb
installModule homegear-enocean_current_${system}_${arch}.deb
installModule homegear-intertechno_current_${system}_${arch}.deb
installModule homegear-rs2w_current_${system}_${arch}.deb
installModule homegear-rsl_current_${system}_${arch}.deb
installModule homegear-zwave_current_${system}_${arch}.deb
installModule homegear-mbus_current_${system}_${arch}.deb
installModule homegear-ccu_current_${system}_${arch}.deb
installModule homegear-easycam_current_${system}_${arch}.deb
installModule homegear-easyled_current_${system}_${arch}.deb
installModule homegear-easyled2_current_${system}_${arch}.deb
installModule homegear-influxdb_current_${system}_${arch}.deb
installModule homegear-management_current_${system}_${arch}.deb
installModule homegear-webssh_current_${system}_${arch}.deb
installModule homegear-adminui_current_${system}_${arch}.deb

rm -f /etc/homegear/dh1024.pem
rm -f /etc/homegear/homegear.key
rm -f /etc/homegear/homegear.crt

cd $SCRIPTDIR
rm -Rf $TEMPDIR
rm -f installNightly.sh

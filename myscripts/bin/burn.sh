#!/usr/local/bin/bash

usage() {                                 # Function: Print a help message.
  echo "Usage: $0 [ -d device ] [-t wav|mp3] [ -b ] [-c dir]" 1>&2 
  echo "-b			blank"
  echo "-e			eject"
  echo "-t wav|data		audio type"
  echo "-c dir 			dir"

  exit 1;
}

if [[ ${#} -eq 0 ]]; then
   usage
fi


device=""
blank='false'
audiotype="wav"
targetdir=""

while getopts "d:bt:u:c:" options; do 

	case "${options}" in
		d)
			device=${OPTARG}
		;;
		t)
			audiotype=${OPTARG}
		;;
		u)
			sudo umount "${OPTARG}"
		;;
		b)
			blank="true"
		;;
		c)
			targetdir="${OPTARG}"

		;;
		:)                                    # If expected argument omitted:
			echo "Error: -${OPTARG} requires an argument."
			usage
		;;
		?)
			echo "Invalid option: -${OPTARG}."
			usage
		;;
	esac

done




if ${blank} ; then

	cdrecord -blank=fast dev="${device}"
	exit 0;

fi

if [[ ${targetdir} == "" ]]; then
	usage
	exit 1;
fi


if [[ "$audiotype" == "wav" ]]; then

	cd "${targetdir}"
	if [[ $?  != 0 ]]; then
		echo "wrong ${targetdir}"
		exit 2;
	fi


	for i in *.mp3;  do mpg123 --rate 44100 --stereo --buffer 3072 --resync -w $(basename "${i}" .mp3).wav "${i}"; done
	normalize -m *.wav
	if [[ $? != 0 ]]; then 
		echo "no wav files"
		exit 3;
	fi
	cdrecord  -v -pad  -dao -swab -eject speed=16 dev="${device}" *.wav
fi


if [[ "$audiotype" == "data" ]]; then

tempdir=$(mktemp -d)
mp3gain -r -c  ${targetdir}/*.mp3
mkisofs -R -joliet-long -o ${tempdir}/mydata.iso "${targetdir}"
cdrecord -v dev="${device}" speed=16 -eject ${tempdir}/mydata.iso
rm -rf "${tempdir}"

fi

#!/usr/local/bin/bash
#
#
shopt -s extglob

dirname=$(basename ${1})


if [[ ${dirname} != $(basename "$PWD") ]]; then
	echo not the correct pwd.
	exit 1;
fi

 
for i in Subs/*;do

	if [ -d ${i} ]; then

	    dirname=$(basename ${i})

	    for j in ${i}/*.*; do
		if [ -f ${j} ]; then


		    basename_i=$(basename ${j})

		    if echo ${basename_i} | grep -Eq '[[:digit:]]+_[[:alpha:]]+\..+'; then

				noexti=${basename_i%.*}
				exti=${basename_i##*.}

				number=$(echo ${noexti}|tr -d -c [:digit:])
				alpha=$(echo ${noexti}| tr -d -c [:alpha:])

				filename="${dirname}".${number}.${alpha}.${exti}
				echo "${i}" ${filename}


			    else
				    echo nothing
		    fi

		fi
	    done

     elif [ -f ${i} ]; then

	 basename_i=$(basename ${i})
	 dirname_i=$(dirname ${i})


		    if echo ${basename_i} | grep -Eq '[[:digit:]]+_[[:alpha:]]+\..+'; then

				noexti=${basename_i%.*}
				exti=${basename_i##*.}


				number=$(echo ${noexti}|tr -d -c [:digit:])
				alpha=$(echo ${noexti}| tr -d -c [:alpha:])

				filename="${dirname}".${number}.${alpha}.${exti}
				mv "${i}" ${dirname_i}/${filename}


			    else
				    echo nothing
		    fi
	fi

done

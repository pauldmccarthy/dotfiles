
function _delim() {
  default_delim="\t"

  if [[ "$#" == 1 ]]; then
    echo -e "$1"
  else
    echo -e "$default_delim"
  fi
}


function shape() {
  delim=$(_delim $2)
  rows=$(cat $1 | wc -l);
  cols=$(head -n1 $1 | tr "$delim" " " | wc -w);
  echo "$rows, $cols";
}

function hd() {
  delim=$(_delim $2)
  head -n1 $1 | tr "$delim" "\n" | less -N
}


function pyclean() {
  find . -name "__pycache__" -exec rm -rf "{}" \;
  find . -name ".mypy_cache" -exec rm -rf "{}" \;
  find . -name "*.pyc"       -delete
  find . -name "*.pye"       -delete
  find . -name "*.ipynbe"    -delete
  rm -f .coverage .coverage.*
}


function pp() {
  if [ "$#" -eq 1 ]; then
    dir="$1"
  else
    dir=$(pwd)
  fi

  # abspath
  dir=$(cd "$dir" && pwd)

  export PATH="$dir":$PATH
  echo $PATH
}

function pyp() {
  if [ "$#" -eq 1 ]; then
    dir="$1"
  else
    dir=$(pwd)
  fi

  dir=$(cd "$dir" && pwd)

  export PYTHONPATH="$dir":$PYTHONPATH
  echo $PYTHONPATH
}


function clearfsl() {
  if [ "$FSLDIR" = "" ]; then
    return
  fi
  PATH=${PATH/$FSLDIR\/bin/}
  PATH=${PATH/$FSLDIR\/share\/fsl\/bin/}

  if [ ! "$FSLDEVDIR" = "" ]; then
    PATH=${PATH/$FSLDEVDIR\/bin/}
  fi

  clearenv FSL
}


function clearenv() {
  tkn=${1}
  eval $(env|sort|grep ${tkn}|cut -d '=' -f 1|xargs -n 1 echo "unset ")
}


function fslconf() {
  if [ "$#" -ne 1 ]; then
    echo "usage: fslconf version"
    return
  fi
  clearfsl
  export FSLDIR=~/fsl/fsl-${1}/
  export FSLDEVDIR=~/fsl/fsl-${1}-dev/
  export PATH=${FSLDEVDIR}/bin:${FSLDIR}/bin:$PATH
  source ${FSLDIR}/etc/fslconf/fsl.sh
  source ${FSLDIR}/etc/fslconf/fsl-devel.sh
}


function getword() {
  str=${1}
  idx=${2}
  word=$(echo "${str}"    |
         tr -s ' '        |
         sed 's/^ *//g'   |
         cut -d ' ' -f ${idx})
  echo ${word}
}


function k9() {

  pat=${1}
  hits=$(ps ax | grep ${pat})
  hits=(${(f)"${hits}"})

  for ((i=1; i<=${#hits[@]}; i++)); do
    name=$(getword ${hits[${i}]} 5-)
    pid=$( getword ${hits[${i}]} 1)
    echo -e "${i}: ${pid} [${name}]\n"
  done

  echo -n "Index of process to kill: "
  read selection

  hit=${hits[${selection}]}
  name=$(getword ${hit} 5-)
  pid=$( getword ${hit} 1)

  echo "Killing ${pid} [${name}]"
  kill -9 ${pid}
}

function memusage() {
  pat=${1}
  hits=$(ps ax | grep ${pat}|grep -v grep)
  hits=(${(f)"${hits}"})

  for ((i=1; i<=${#hits[@]}; i++)); do
    name=$(getword ${hits[${i}]} 5-)
    pid=$( getword ${hits[${i}]} 1)
    echo -e "${i}: ${pid} [${name}]\n"
  done

  echo -n "Index of process to monitor: "
  read selection

  hit=${hits[${selection}]}
  name=$(getword ${hit} 5-)
  pid=$( getword ${hit} 1)

  echo "Monitoring ${pid} [${name}]"
  for ((;;)); do
    if [ ! -d /proc/${pid} ]; then
      echo "" >&2
      break;
    fi

    kbytes=$(ps -p ${pid} -o rss | tail -n1)
    gbytes=$(echo "scale=3; ${kbytes} / 1048576" | bc -l)
    echo -en "\r${gbytes} GB " >&2
    echo " ${gbytes} GB max"
    sleep 1
  done | sort -n | tail -n1
}


function fsrc() {
  if [ "$#" -eq 0 ]; then
    echo "usage: fsrci [dir] suffix term"
    return
  fi
  if [ "$#" -eq 2 ]; then
    dir=$(pwd)
    suffix=${1}
    search=${2}
  else
    dir=${1}
    suffix=${2}
    search=${3}
  fi

  find ${dir} -name "*${suffix}" | xargs grep -in  ${search}
}


function fsrci() {
  if [ "$#" -eq 0 ]; then
    echo "usage: fsrci [dir] suffix term"
    return
  fi
  if [ "$#" -eq 2 ]; then
    dir=$(pwd)
    suffix=${1}
    search=${2}
  else
    dir=${1}
    suffix=${2}
    search=${3}
  fi

  find ${dir} -name "*${suffix}" | xargs grep -n  ${search}
}

function fipy() {
  if [ "$#" -eq 0 ]; then
    echo "usage: fipy [dir] term"
    return
  fi
  if [ "$#" -eq 1 ]; then
    dir=$(pwd)
    search=${1}
  else
    dir=${1}
    search=${2}
  fi

  find ${dir} -name "*.py"  |
    grep -v "flycheck"      |
    grep -v "site-packages" |
    xargs grep -in ${search}
}

function fipyi() {
  if [ "$#" -eq 0 ]; then
    echo "usage: fipyi [dir] term"
    return
  fi
  if [ "$#" -eq 1 ]; then
    dir=$(pwd)
    search=${1}
  else
    dir=${1}
    search=${2}
  fi

  find ${dir} -name "*.py" | xargs grep -n  ${search}
}

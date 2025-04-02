
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

function mkdcd() {
  mkdir -p $1
  cd       $1
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

  if [ -f ${FSLDIR}/bin/activate ]; then
    source ${FSLDIR}/bin/activate ${FSLDIR}
  elif [ -f ${FSLDIR}bin/micromamba ]; then
    export MAMBA_ROOT_PREFIX=${FSLDIR}
    eval "$(${FSLDIR}/bin/micromamba shell hook --shell $(basename ${SHELL}))"
    micromamba activate ${FSLDIR}
  else
    echo "No activate script or micromamba present - connot activate FSL conda environment"
  fi
  source ${FSLDIR}/etc/fslconf/fsl.sh
  source ${FSLDIR}/etc/fslconf/fsl-devel.sh
  # export FSLCONFDIR=${FSLDEVDIR}/config
  # export FSLCONFDIR=~/Projects/fsl/base/config
  export PATH=${FSLDEVDIR}/bin:${FSLDIR}/bin:$PATH
  export MAKEFLAGS="-j 16"
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

  # zsh-specific syntaax
  hits=(${(f)"${hits}"})
  # readarray -t hits <<<"${hits}"

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


function memusage2() {
  pat=${1}
  echo "Monitoring all processes with name matching [${pat}]"
  for ((;;)); do

    hits=$(ps ax | grep ${pat}|grep -v grep)
    # zsh-specific syntaax
    hits=(${(f)"${hits}"})
    # readarray -t hits <<<"${hits}"

    if [ ${#hits[@]} = "0" ]; then
      echo "" >&2
      break;
    fi

    kbytes="0"

    for ((i=1; i<=${#hits[@]}; i++)); do
      pid=$( getword ${hits[${i}]} 1)
      pkbytes=$(ps -p ${pid} -o rss | tail -n+2)
      if [ -z "${pkbytes}" ]; then
        pkbytes="0"
      fi
      kbytes=$(echo "${kbytes} + ${pkbytes}" | bc)
    done

    gbytes=$(echo "scale=3; ${kbytes} / 1048576" | bc -l)
    echo -en "\r[#${#hits[@]}] ${gbytes} GB " >&2
    echo " ${gbytes} GB max"
    sleep 1
  done | sort -n | tail -n1
}


function cpuusage() {
  command=${1}

  # assuming that there is only one matching process
  pid=$(pgrep ${command} | tail -n 1)

  for ((;;)); do
    if ! ps -p ${pid} > /dev/null; then
      break;
    fi

    if [[ $(uname) == "Darwin" ]]; then
      cpu=$(top -pid ${pid} -l2 -s1  -stats cpu | tail -n1)
    else
      cpu=$(top -p ${pid} -b -d 2 -n 1 -o "%CPU"|tail -n1|tr -s ' '|cut -d ' ' -f 9)
    fi

    echo ${cpu}
    sleep 1
  done
}

function fsrc() {
  if [ "$#" -eq 0 ]; then
    echo "usage: fsrc term"
    echo "       fsrc dir term"
    echo "       fsrc dir suffix term"
    return
  fi
  if [ "$#" -eq 1 ]; then
    dir=$(pwd)
    suffix=""
    search=${1}
  elif [ "$#" -eq 2 ]; then
    dir=${1}
    suffix=""
    search=${2}
  else
    dir=${1}
    suffix=${2}
    search=${3}
  fi
  find ${dir} -type f -name "*${suffix}" | \
    grep -v .git                         | \
    xargs grep -in ${search}             | \
    sort -t ":" -k 1,1 -k 2n,2
}


function fsrci() {
  if [ "$#" -eq 0 ]; then
    echo "usage: fsrci term"
    echo "       fsrci dir term"
    echo "       fsrci dir suffix term"
    return
  fi
  if [ "$#" -eq 1 ]; then
    dir=$(pwd)
    suffix=""
    search=${1}
  elif [ "$#" -eq 2 ]; then
    dir=${1}
    suffix=""
    search=${2}
  else
    dir=${1}
    suffix=${2}
    search=${3}
  fi
  find ${dir} -type f -name "*${suffix}" | \
    grep -v .git                         | \
    xargs grep -n ${search}              | \
    sort -t ":" -k 1,1 -k 2n,2
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

  find ${dir} -name "*.py"   |
    grep -v "flycheck"       |
    grep -v "site-packages"  |
    xargs grep -in ${search} |
    sort  -t ":" -k 1,1 -k 2n,2
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

  find ${dir} -name "*.py"   | \
    grep -v "flycheck"       | \
    grep -v "site-packages"  | \
    xargs grep -n  ${search} | \
    sort  -t ":" -k 1,1 -k 2n,2
}


# https://stackoverflow.com/a/44811468
function sanitise() {
  s="${1?need a string}"                      # receive input in first argument
  s="${s//[^[:alnum:]]/-}"                    # replace all non-alnum characters to -
  s="${s//+(-)/-}"                            # convert multiple - to single -
  s="${s/#-}"                                 # remove - from start
  s="${s/%-}"                                 # remove - from end
  s=$(echo "$s" | tr '[:upper:]' '[:lower:]') # convert to lowercase
  echo "${s}"

}


function actenv() {
  if [ -e ${1}/conda-meta ]; then
    conda=$(which conda)
    if [[ "${conda}" == "" ]] || [[ "${conda}" == *"not found" ]]; then
      echo 'Cannot find a base conda environment! Add <base>/bin to your $PATH'
      return
    fi
    basedir=$(dirname ${conda})
    source ${basedir}/activate ${1}

  elif [ -e ${1}/pyvenv.cfg ]; then
    source ${1}/bin/activate
  else
    echo "Cannot identify environment type of ${1}"
  fi
}

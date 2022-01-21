
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
  eval $(env|sort|grep FSL|cut -d '=' -f 1|xargs -n 1 echo "unset ")
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

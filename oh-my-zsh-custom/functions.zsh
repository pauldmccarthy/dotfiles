
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

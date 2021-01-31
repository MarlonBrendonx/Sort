#! /usr/bin/env bash


#-------------------------HEADER----------------------------------------------------|
# AUTOR             : Marlon Brendo <marlonbrendo2013@gmail.com>
# DATA-DE-CRIAÇÃO   : 2020-12-25
# PROGRAMA          : sort
# LICENÇA           : MIT
# DESCRIÇÃO 	    : Implementação dos algoritmos de ordenação Selection Sort,
#		      Insertion sort,Shellsort  em shell bash	
#

#----------------------Váriaveis----------------------------------------------------|

parameters=$(( "$#"-2 ))
list=("${@:3}")
red="\033[0;31m"
nc="\033[0m"

#-----------------------------------------------------------------------------------|


#----------------------Bibliotecas--------------------------------------------------|


source help.sh || { echo "Error loading the help.sh library"; exit 1;}
source methods.sh || { echo "Error loading the methods.sh"; exit 1;}

#-----------------------------------------------------------------------------------|

#-------------------------Testes----------------------------------------------------|
(( "$#" == 0 )) && { echo  "Empty parameters!"; exit 1 ;}
(( "$UID" ==   0 )) && { echo "No root required!"; exit 1;}

#-----------------------------------------------------------------------------------|


function fileToArray(){
		
		local p=0
	
		for i in ${file[@]}
		do
			
			list[$p]="$i"			
			let p++			
			
		done
		
}

function call(){
	
case "$1" in
			
	-d)
		
		[[ ! -e "${list[$i]}" ]] || { echo -e \
		"${red}[!]${nc} Concatenate with the -f option to sort a list. (Ex: sort -Is -af text)"; exit 1;}

		"$2" "$parameters" ">"
		((  "$?" == 0 )) && showList 
	;;
	-df)
		
		file=$(cat "${list[@]}" 2> /dev/null ) 
		fileToArray "$file"
		
		"$2" "${#list[@]}" ">"
		((  "$?" == 0 )) && showList  || ""	
		
		
	;;
	-a)
		
		[[ ! -e "${list[$i]}" ]] || { echo -e \
		"${red}[!]${nc} Concatenate with the -f option to sort a list. (Ex: sort -Is -af text)"; exit 1;}

		"$2" "$parameters" "<"
		((  "$?" == 0 )) && showList 	

	;;
	-af)
		file=$(cat "${list[@]}" 2> /dev/null)
		fileToArray "$file"
		
		"$2" "${#list[@]}" "<"
		((  "$?" == 0 )) && showList
		
	;;

esac
		
}

case "$1" in
	
	
	-Ss | --selectionsort) shift; call  "$1" "Selectionsort" ;;

	-Is | --insertionsort ) shift; call "$1" "Insertionsort" ;;

	-Shs | --shellsort)    shift; call  "$1" "Shellsort"     ;;

	-h|--help) Help ;;	

	*) Help ;;
esac




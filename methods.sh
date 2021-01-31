function Shellsort(){

	local jump=$(( "$1" / 2 ))
	local size="$1"
	local aux2=$(printf %d\\n \'"$2")

	[[ "$2" == ">" ]] && 
	{	
		aux2=$(( $aux2 - 2 ))
		aux2=$(printf "\x$(printf %x $aux2)")
	}\
	|| {	
		aux2=$(( $aux2 + 2 ))
		aux2=$(printf "\x$(printf %x $aux2)")
	}	
	
		 	
	

	while (( "$jump" > 0 )) 
	do
		for(( i="$jump"; i<"$size"; i++))
		do
			aux="${list[$i]}"
			j="$i"
		
			while (( j >= "$jump" && "${list[$j-$jump]}" "$aux2" "$aux"  ))
			do

				list[$j]="${list[$j-$jump]}"
				j=$(( "$j" - "$jump" ))

			done
			list[$j]="$aux"
		done
		jump=$(( $jump / 2 ))
		
	done


}

function Insertionsort(){


	local size="$1"
	
		 	
	for(( i=1; i<"$size"; i++ ))
	do
		
		current="${list[$i]}"
		
		for(( j=i; (( j>0 && "$current" "$2" "${list[j-1]}" )); j-- ))	
		do
			list[$j]="${list[$j-1]}"
		done

		list[$j]=$current
	done


}


function Selectionsort(){

	local size="$1"


	for(( i=0; i<"$size"; i++ ))
	do
			min="$i"		
			
			for(( j="$i"+1; j<"$size"; j++))
			do	

				if (( "${list[$j]}" "$2" "${list[$min]}" ))
				then
					min="$j"
				fi	

			done
			

			if (( "$i" != "$min" ))
			then

				aux="${list[$i]}"
				list[$i]="${list[$min]}"
				list[$min]="$aux" 
			fi

	 	
	done
		return 0
}


function showList(){

	for x in "${list[@]}"
	do
			printf "%d " $x
	done	
	printf "\n"

}

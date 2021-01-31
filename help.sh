#
#
#
#
#--------------------HELP--------------------------------------------|


function Help(){

cat << EOF

sort - Write an orderly list/file in standard output
sort - [ALGORITHM] [OPTIONS] [LIST/ARCHIVE]


MAIN ARGUMENTS

	ALGORITHM	 

	-h,--help
	 	Show this message in standard output and exit
	
	-Ss,--selectionsort
	 	Chooses the selection sort algorithm for sorting

	-Shs,--shellsort
		Chooses the Shell sort algorithm for sorting

	-Is,--insertionsort
	 	Chooses the Insertion sort algorithm for sorting
	
	OPTIONS

	-d,--descending
	 	Print in descending form

	-a,--ascending
	 	Print in ascending form

	-f,--file
		File as a parameter
	
EOF

}




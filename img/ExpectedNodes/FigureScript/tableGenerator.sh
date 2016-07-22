first=true
liste=`ls PartRes/resume*.txt |sort --version-sort -f `
for file in $liste
do
	run=`expr match "$file" 'PartRes/resume\([[:digit:]]*\)\.txt'`
	for fonct in {Modified,Ahn,Evans1,Evans2,Evans3,Modified2,Node,Node2,Complete} # ,Modified2,Node,Node2,Complete
		do 
		place=0
		fct="$fonct"
		case "$fct" in
		'Complete')
		    place=7
		    ;;
		'Modified')
		    place=8
		    ;;
		'Modified2')
		    place=9
		    ;;
		'Node')
		    place=10
		    ;;
		'Node2')
		    place=11
		    ;;
		'Ahn')
		    place=12
		    ;;
		'Evans1')
		    place=13
		    ;;
		'Evans2')
		    place=14
		    ;;
		'Evans3')
		    place=15
		    ;;
		esac
		output=PartRes/"$fct".fct
		if $first
			then
			touch $output
			rm $output
			awk -v pl=$place -v f=$fct '{print $1,$pl}' $file | sed 's/PartRes\/G_\|\.txt//g' | sort | sed "1iX $run" >|  $output			
		else
			tmp="$fct".tmp
			awk -v pl=$place -v f=$fct '{print $1,$pl}' $file | sed 's/PartRes\/G_\|\.txt//g' | sort | sed "1iX $run" | cut -f 2 -d" " | paste -d" " $output - >| $tmp 			
			rm $output
			mv $tmp $output
		fi
		done
	first=false
done

# python GraphiqueGenerator.py -fct `ls PartRes/*.fct`
# python GraphiqueGenerator.py -box `ls PartRes/*.fct`
# python GraphiqueGenerator.py -dist `ls PartRes/*.dist`
files=$*
regex="def match_(.*) :" # get inductive names
theory="Coq"
for f in $files
do
    md=${f##*/}
    md=${md%.*}
    while read line; do
	if [[ $line =~ $regex ]]
	then
	    ind=${BASH_REMATCH[1]}
	    echo "[] ${md}.match_$ind $theory.star --> ${md}.match_${ind}_star."
	    echo "[] ${md}.match_$ind $theory.box  --> ${md}.match_${ind}_box."
	    #echo "[] ${md}.match_$ind $theory.kind --> ${md}.match_${ind}_kind."
	    #echo "[] ${md}.filter_$ind $theory.prop --> ${md}.filter_${ind}_prop."
	    #echo "[] ${md}.filter_$ind $theory.type --> ${md}.filter_${ind}_type."
	    #echo "[] ${md}.filter_$ind $theory.kind --> ${md}.filter_${ind}_kind."
	fi
    done < $f
done

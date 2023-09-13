#1. Assign input file and output file
output_file=/Users/nanditapuri/abcxyz/demo_week2/find_perfect_matches/ERR430992_output.fna
query_file=/Users/nanditapuri/abcxyz/demo_week2/find_perfect_matches/CRISPR_1f.fna
subject_file=/Users/nanditapuri/abcxyz/demo_week2/find_perfect_matches/ERR430992.fna

#Perform blast search and filter perfect matches
blastn -query "$query_file" -subject "$subject_file" -outfmt "6 qseqid sseqid pident legnth" | \
    awk '$3 == 100 {print}' > "$output_file"

# Copy the number of perfect matches
perfect_match_count=$(wc -l < "$output_file")

# extract the file name, print the count and file name stdout
filename_without_extension="${subject_file##*/}"
filename_without_extension="${filename_without_extension%.*}"
echo "Matched File Name: $filename_without_extension"
echo "Number of perfect matches: $perfect_match_count"


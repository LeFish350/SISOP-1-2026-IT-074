awk -F'"' '
/id/ {id=$4}
/site_name/ {nama=$4}
/latitude/ {lat=$3; gsub(/[^0-9.-]/, "", lat)}
/longitude/ {lon=$3; gsub(/[^0-9.-]/, "", lon); print id "," nama "," lat "," lon}
' gsxtrack.json > titik-penting.txt

cat titik-penting.txt

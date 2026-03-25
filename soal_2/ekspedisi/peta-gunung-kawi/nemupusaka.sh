awk -F',' '
NR==1 {lat1=$3; lon1=$4}
NR==3 {lat2=$3; lon2=$4}
END {
    tengah_lat = (lat1 + lat2) / 2
    tengah_lon = (lon1 + lon2) / 2
    print "Koordinat pusat:"
    print tengah_lat ", " tengah_lon
}
' titik-penting.txt > posisipusaka.txt

cat posisipusaka.txt

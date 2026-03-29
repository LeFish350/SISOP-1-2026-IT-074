BEGIN {
    FS = ","
    pilihan = ARGV[2]
    delete ARGV[2]
    
    if (pilihan != "a" && pilihan != "b" && pilihan != "c" && pilihan != "d" && pilihan != "e") {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
        print "Contoh penggunaan: awk -f file.sh data.csv a"
        exit
    }
}
NR > 1 {
    total_penumpang = total_penumpang + 1
    gerbong[$4] = 1 # Revisi 1
    
    if ($2 > usia_maksimal) {
        usia_maksimal = $2
        nama_tertua = $1
    }
    
    total_usia = total_usia + $2
    
    if ($3 == "Business") # Revisi 2
    { 
        total_bisnis = total_bisnis + 1
    }
}
END {
    if (pilihan == "a") {
        print "Jumlah seluruh penumpang KANJ adalah " total_penumpang " orang"
    }
    if (pilihan == "b") {
        for (g in gerbong) jumlah_gerbong = jumlah_gerbong + 1
        print "Jumlah gerbong penumpang KANJ adalah " jumlah_gerbong
    }
    if (pilihan == "c") {
        print nama_tertua " adalah penumpang kereta tertua dengan usia " usia_maksimal " tahun"
    }
    if (pilihan == "d") {
        rata_rata = int(total_usia / total_penumpang) # Revisi 3
        printf "Rata-rata usia penumpang adalah %.0f tahun\n", rata_rata
    }
    if (pilihan == "e") {
        print "Jumlah penumpang business class ada " total_bisnis " orang"
    }
}


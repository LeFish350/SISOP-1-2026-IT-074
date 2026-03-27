# SISOP-1-2026-IT-074

## Member

| No | Nama | NRP |
|---|---|---|
| 1 | Mahrinza Redouane Zakariyah | 5027241074 |

---

## Reporting

### Soal 1

#### Penjelasan

**KANJ.sh**

Pada soal pertama ini, kita diminta untuk mengolah data `passenger.csv` menggunakan `awk`. Langkah pertama yang dilakukan adalah menginisialisasi pembatas kolom (koma) dan mengambil opsi inputan user (a, b, c, d, atau e) dari argumen terminal, sekaligus menangani jika inputan tidak valid.

```awk
BEGIN {
    FS = ","
    pilihan = ARGV[2]
    delete ARGV[2]
    if (pilihan != "a" && pilihan != "b" && pilihan != "c" && pilihan != "d" && pilihan != "e") {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
        exit
    }
}
```

Selanjutnya, program akan melompati baris pertama (header) dan mulai mengumpulkan data yang diperlukan: menghitung total penumpang, mencatat gerbong unik ke dalam array, mencari usia maksimal beserta namanya, menjumlahkan total usia untuk rata-rata, dan menghitung jumlah penumpang Business Class.

```awk
NR > 1 {
    total = total + 1
    gerbong[$4] = 1
    if ($2 > usia_maks) {
        usia_maks = $2
        nama = $1
    }
    total_usia = total_usia + $2
    if ($3 == "Business") {
        bisnis = bisnis + 1
    }
}
```
Terakhir, blok END akan mengeksekusi dan menampilkan output yang sesuai dengan opsi pilihan huruf yang dimasukkan oleh user saat menjalankan script.

```awk
END {
    if (pilihan == "a") print "Jumlah seluruh penumpang KANJ adalah " total " orang"
    if (pilihan == "b") {
        for (g in gerbong) total_gerbong = total_gerbong + 1
        print "Jumlah gerbong penumpang KANJ adalah " total_gerbong
    }
    if (pilihan == "c") print nama " adalah penumpang kereta tertua dengan usia " usia_maks " tahun"
    if (pilihan == "d") {
        rata = total_usia / total
        printf "Rata-rata usia penumpang adalah %.0f tahun\n", rata
    }
    if (pilihan == "e") print "Jumlah penumpang business class ada " bisnis " orang"
}
```

## Output

<img width="537" height="414" alt="output" src="https://github.com/user-attachments/assets/a2e66f78-2266-400a-9b9c-48573656b2fc" />

---

## Soal 2

#### Penjelasan

**parserkoordinat**
Langkah pertama pada penyelesaian ekspedisi ini adalah membersihkan dan mengekstrak data dari file gsxtrack.json. Script ini menggunakan perintah awk dengan memanfaatkan regex gsub untuk menghilangkan karakter yang tidak diperlukan selain angka dan tanda baca titik/minus, lalu menyimpannya dalam format id, site_name, latitude, longitude ke dalam file titik-penting.txt.

```
awk -F'"' '
/id/ {id=$4}
/site_name/ {nama=$4}
/latitude/ {lat=$3; gsub(/[^0-9.-]/, "", lat)}
/longitude/ {lon=$3; gsub(/[^0-9.-]/, "", lon); print id "," nama "," lat "," lon}
' gsxtrack.json > titik-penting.txt
```

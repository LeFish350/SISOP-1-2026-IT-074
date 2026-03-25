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

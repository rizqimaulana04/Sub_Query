-- Tampilkan data karyawan yang bekerja pada departemen yang sama
dengan karyawan yang bernama Dika
SELECT k.*
FROM karyawan k
WHERE k.id_dept = (SELECT id_dept FROM karyawan
WHERE nama = 'Dika'
);

-- Tampilkan data karyawan yang gajinya lebih besar dari rata-rata gaji semua
karyawan. urutkan menurun berdasarkan besaran gaji
SELECT k.*
FROM karyawan k
WHERE k.gaji_pokok > (SELECT AVG(gaji_pokok) FROM karyawan)
ORDER BY k.gaji_pokok DESC;

-- Tampilkan nik dan nama karyawan untuk semua karyawan yang bekerja di
department yang sama dengan karyawan dengan nama yang mengandung
huruf 'K'.
SELECT k.nik, k.nama
FROM karyawan k
WHERE k.id_dept IN (SELECT id_dept FROM karyawan
WHERE nama LIKE '%K%'
);

-- Tampilkan data karyawan yang bekerja pada departemen yang ada di
kantor pusat.
SELECT k.*
FROM karyawan k
JOIN departemen d ON k.id_dept = d.id_dept
WHERE d.id_p = (SELECT id_p FROM perusahaan
WHERE nama = 'Kantor Pusat'
);

-- Tampilkan nik dan nama karyawan untuk semua karyawan yang bekerja di
department yang sama dengan karyawan dengan nama yang mengandung
huruf 'K' dan yang gajinya lebih besar dari rata-rata gaji semua karyawan
SELECT k.nik, k.nama
FROM karyawan k
WHERE k.id_dept IN (SELECT id_dept FROM karyawan WHERE nama LIKE '%K%')
AND k.gaji_pokok > (SELECT AVG(gaji_pokok)
FROM karyawan
);
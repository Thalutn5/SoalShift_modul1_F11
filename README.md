# SoalShift_modul1_F11

M Thalut Nadhil Q (05111740000143)
 dan Ida Bagus Rai Widnyana (05111740000087)

# Nomor 1
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.Hint: Base64, Hexdump

Jawab :

Untuk penyelesaiannya, maka langkah-langkah yang kami gunkan adalah
- Membuka file nature.zip maka kita menggunakan syntax

  unzip /home/thalutn5/Documents/Soalshift1/nmr1/nature.zip

- Setelah itu kita membuat sebuah folder yang bertujuan untuk menyimpan foto hasil dari script kami. 

  mkdir /home/thalutn5/Documents/Soalshift1/nmr1/hasil1

- Setelah itu kami membuat 2 variabel, yang satu bertujuan untuk mengarahkan dimana foto itu berasal dan satu lagi bertujuan untuk 
mengarahkan dimana foto hasil dari script kami akan diletakkan. 

  fileasli=/home/thalutn5/Documents/Soalshift1/nmr1/nature/*
 
  fileakhir=/home/thalutn5/Documents/Soalshift1/nmr1/hasil1

- Lalu kita membuat 2 variabel lagi. Yang pertama bernama "foto", yang bertujuan nantinya untuk menamai foto dari hasil script kami serta dimulai dari angka 0. Dan yang satu lagi bernama i yang bertujuan untuk seperti iterasi dalam looping tersebut. 

- Didalam looping kami mengggunakan chmod 777 yang bertujuan untuk memberikan semua permission kepada semua jenis user. 

   chmod 777 $i

- Setelah itu kami menggunakan base64 untuk mendecode basis64 manjadi hex 

  base64 -d $i

- Kami juga menggunakan xxd -r yang berguna untuk mendecode hex menjadi file akhir(.jpg). 
	
   xxd -r > $fileakhir/$foto.jpg

- Setelah itu kita menaikkan nilai dari variabel foto agar memiliki nama file yang berbeda dari sebelumnya di looping selanjutnya. 

  let foto=$foto+1

- Untuk masalah crontab, kita akan menyetting cron tab dengan 14 14 14 2 5 sesuai dengan menit, jam, tanggal, bulan, hari

  14 14 14 2 5 /bin/bash /home/thalutn5/Documents/Soalshift1/nmr1/soal1.sh

# Nomor 2

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:

    (A) Tentukan negara dengan penjualan(quantity) terbanyak per tahun 2012
Data yang dibutuhkan : Nama negara, dan quantitynya per tahun 2012
Variabel yang dibutuhkan : 

    • “max=0”   	//untuk iterasi maksimum quantity
    
    • “negara=”a” 	// untuk iterasi negara

	
Kami menggunakan awk untuk mengsort data excel tersebut. Sebelumnya kami menggunakan “,” sebagai delimeter agar fungsi “$N” yang tadinya memanggil per kata (urut) menjadi memanggil semua data yang ada perkolomnya. Hal ini dilakukan karerna pada kolom pertama jumlah kata nama negara berbeda-beda. Jika tidak dilakukan akan terjadi pengambilan data yang berbeda karena urutan tak sama.
Yang dilakukan adalah menggabungkan quantity semua jenis barang per negara pada tahun 2012 dan mengeluarkan output negara dengan jumlah quantity terbanyak.



If($7 == “2012) {   		      # agar data yang disort hanya pada tahun 2012

Total [$1] = total [$1] + $10 	# array untuk mentotalkan jumlah quantity per negara

If (total[$1] > max) {		    # fungsi untuk mencari jumlah quantity paling banyak

max = total[$1]			# setelah itu max bernilai total[$1]

negara = $1			# setelah itu negara bernilai negara di kolom pertama yang memiliki quantity terbanyak.				
setelah mendapatkan isi “negara” dan “max” di outputkan dengan format :
	
	“print negara, max”

Lalu di bash no2.sh

    (B) Tentukan 3 product line yang memberikan penjualan(quantity) terbanyak pada poin A


Data yang dibutuhkan : Product line, dan quantitynya per tahun 2012. 
Variabel yang ada : 

Prod1=”a”			 # Nama productline dengan quantity tertinggi

Prod2=”b”			 # Nama productline dengan quantity tertinggi ke -2

Prod3= “c”			 # Nama productline dengan quantity tertinggi ke -3

Maxprod1=0		    	 # Quantity prod1

Maxprod2=0			 # Quantity prod2

Maxprod3=0			 # Quantity prod3

Dengan asumsi Poin A telah selesai, maka Product line hanya pada negara “United States” di tahun 2012

Fungsi If sama seperti 2A ditambah asumsi “United States” sebagai negara paling banyak quantity-nya. Seperti no 2A max quantity produksi dijumlahkan. 

Untuk pencarian 3 productline tertinggi dilakukan hal dibawah ini :

    1.   for(i in maxprod)     		
If pertama ( if (maxprod[i] . maxprod1){ ) untuk mencari productline tertinggi
Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod1.
    
    2. else if (maxprod[i] > maxprod2) 
Kondisi dimana data yang baru diproses lebih kecil dari maxprod1 namun lebih besar dari maxprod2. Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod2.

    3. else if (maxprod[i] > maxprod3) 
Kondisi dimana data yang baru diproses lebih kecil dari maxprod1 namun lebih besar dari maxprod3. Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod3.

Semua data sudah dapat dengan tepat, di outputkan dengan :

Print “1.”, prod1, “dengan total”, maxprod1

Print “2.”, prod1, “dengan total”, maxprod2

Print “3.”, prod1, “dengan total”, maxprod3

    (C) Tentukan 3 product yang memberikan penjualan(quantity) terbanyak berdasarkan 3 product line yang didapatkan pada poin B
Dengan asumsi 3 Productline tertinggi sudah ditemukan dari no 2B
Variabel yang dibutuhkan = 

Proda=”a”			# Nama produk dengan quantity tertinggi ke- 1

Prodb=”a”			# Nama produk dengan quantity tertinggi ke -2

Prodc= “a”			# Nama produk dengan quantity tertinggi ke -3

Maxproda=0		# Quantity prod1

Maxprodb=0		# Quantity prod2

Maxprodc=0		# Quantity prod3

Prinsip kerjanya sama seperti 2A.Perbedaannya di 2C ini product line yang di targetnya

Dengan output
print “2.C”, “Personal Accessories:”, proda, “dengan total”, maxproda

print “Camping Equipment:”, prodb, “dengan total”, maxprodb

print “Outdoor Protection:”, prodc, “dengan total”, maxprodc
 
# Nomor 3
Buatlah sebuah script bash yang dapat menghasilkan password secara acaksebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:

a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt

b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.

c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.

d. Password yang dihasilkan tidak boleh sama.

Jawab :

- Karena sebelum dibash belum ada file yang terbuat maka,agar dapat membuat file tersebut hal yang harus dilakukan pertama-tama adalah kami membuat 2 variabel. Yang pertama kami namai i, yang bertujuan untuk iterasi. dan yang kedua bernama fileke, yang bertujuan untuk memberi nilai angka pada penamaan file dalam looping. 

	  i=1
  
  	  fileke=1
	
- Didalam looping, kita memberikan syarat bahwa nilai i tidak boleh sama dengan 0, jika nilai i sama dengan 0 maka ia akan keluar dari looping tersebut. di dalam looping terdapat percabangan, ada if dan ada else. 

  	while [ $i -ne 0 ]

 		do

- if disini berguna untuk mengecek apakah ada file password1.txt atau belum. 

  	if [[ -f /home/thalutn5/Documents/Soalshift1/nmr3/password$fileke.txt ]];

		then
	
		fileke=$((fileke + 1))

- jika belum maka ia akan lari ke else dimana isi dari else tersebut adalah membuat sebuah file password1.txt yang berisikan string random dengan syarat huruf a-z, A-Z dan 0-9 sepanjang 12 huruf dan sebanyak 1 baris. serta di folder tertentu. 

		else
	
		cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/thalutn5/Documents/Soalshift1/nmr3/password$fileke.txt

- Setelah membuat file tersebut, kita menaikkan nilai dari i agar bisa keluar dari looping tersebut. 

		i=0

- Jika script ini dijalankan lagi maka, script ini akan mengecek apakah password1.txt itu ada? karena kita telah membuat sebelumnya maka nilai dari fileke akan ditambah 1 agar bisa membuat file password2.txt. setelah itu looping lagi dan masuk ke else dimana ia akan membuat file password2.txt . begitu juga selanjutnya. 

- Untuk file yang dihapus, misalnya kita telah membuat file password1.txt, password2.txt dan password3.txt lalu kita mendelete password2.txt .  setelah kita jalankan lagi scriptnya maka akan terbuat lagi file password2.txt hal ini terjadi karena script yang kami buat mengecek lagi dari iterasi pertama sehingga karena passworsd2.txt tidak ada maka dibuatlah password2.txt .

# Nomor 4 

Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”.  Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang 
memiliki urutan ke 12+2 = 14.

b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.

c. setelah huruf z akan kembali ke huruf a

d. Backup file syslog setiap jam.

e. dan buatkan juga bash script untuk dekripsinya.

Jawab :

Script untuk enkripsi :

Untuk enkripsinya, pertama-tama kita akan membuat 5 buah variabel. Yang pertama namanya "array" yang berisikan huruf alfabet kecil,
yang kedua namanya "array2" yang berisikan huruf alfabet besar, yang ketiga bernama "array3" berisikan campuran dari variabel "array2" 
dan "array". yang keempat bernama "array4" berisikan campuran dari variabel "array" dan "array" dan yang kelima bernama "array5" 
berisikan campuran dari variabel "array2" dan "array2". Setelah itu kita membuat variabel rotate yang berfungsi untuk menampung jam pada saat script dijalankan. kita juga akan memiliki 3 variabel yang digunakann untuk mentranslate variabel-variabel sebelumnya. variabel trans digunakan untuk mengubah variabel "array" menjadi variabel "array" yang telah ditambahkan jamnya. begitu juga dengan trans2 yang digunakan untuk mengubah variabel "array" menjadi variabel "array2" yang telah ditambahkan jamnya. Sedangkan variabel trans3 berisikan campuran dari variabel "trans" dan "trans2". setelah itu kita sebuah variabel yang bernama "hasil" dimana variabel tersebut mentranslate dari variabel array3 menjadi trans3 
untuk menyimpan hasil log terebut.

Script untuk dekripsi :  

Untuk mendekripsi hampir sama dengan enkripsinya, tetapi kita menambahkan variabel jam dimana akan kita gunakan di variabel rotate serta merubah translate pada hasil output dari variabel trans3 menjadi array3

# Nomor 5
Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive,
sehingga huruf kapital atau tidak, tidak menjadi masalah.

b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.

c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.

d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

Jawab :

Untuk menjawab soal ini, kita akan menggunakan awk. Dengan syarat 

awk '(/cron/ || /CRON/) && (!/sudo/) && (NF < 13) {print}' /var/log/syslog >> /home/thalutn5/Soalshift1/nmr5/nmr5.log

- Dengan menuliskan '(/cron/ || /CRON/) && (!/sudo/) {print}' kita hanya bisa menampilkan yang mengandung string "cron" dan "CRON" serta tidak mengandung string "sudo". 
- Lalu dengan menambahkan syarat (NF < 13), ini berarti memasukkan syarat number of field tidak boleh lebih dari 13.
-     >> /home/thalutn5/Soalshift1/nmr5/soal5.log   

	 Dengan menulis ini Kita memasukkan record tadi kedalam sebuah file log.

- Serta kita juga menambahkan sebuah line pada crontab -e agar hanya bisa di jalankan pada etiap 6 menit dari menit ke 2 hingga 30
dengan mengganti tanda * pertama dengan 2-30/6. (2-30/6 * * * *)



	

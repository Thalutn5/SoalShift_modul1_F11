# SoalShift_modul1_F11

No.2

    (A) Tentukan negara dengan penjualan(quantity) terbanyak per tahun 2012
Data yang dibutuhkan : Nama negara, dan quantitynya per tahun 2012
Variabel yang dibutuhkan : 
    • “max=0”   	//untuk iterasi maksimum quantity
    • “negara=”a” 	// untuk iterasi negara

	
	Kami menggunakan awk untuk mengsort data excel tersebut. Sebelumnya kami menggunakan “,” sebagai delimeter agar fungsi “$N” yang tadinya memanggil per kata (urut) menjadi memanggil semua data yang ada perkolomnya. Hal ini dilakukan karerna pada kolom pertama jumlah kata nama negara berbeda-beda. Jika tidak dilakukan akan terjadi pengambilan data yang berbeda karena urutan tak sama.
Yang dilakukan adalah menggabungkan quantity semua jenis barang per negara pada tahun 2012 dan mengeluarkan output negara dengan jumlah quantity terbanyak.



If($7 == “2012) {   		# agar data yang disort hanya pada tahun 2012
Total [$1] = total [$1] + $10 	# array untuk mentotalkan jumlah quantity per negara
If (total[$1] > max) {		# fungsi untuk mencari jumlah quantity paling banyak
max = total[$1]			# setelah itu max bernilai total[$1]
negara = $1			# setelah itu negara bernilai negara di kolom pertama yang memiliki				   quantity terbanyak.


 
setelah mendapatkan isi “negara” dan “max” di outputkan dengan format :
	“print negara, max”
Lalu di bash no2.sh




    (B) Tentukan 3 product line yang memberikan penjualan(quantity) terbanyak pada poin A


Data yang dibutuhkan : Product line, dan quantitynya per tahun 2012. 
Variabel yang ada : 
Prod1=”a”			# Nama productline dengan quantity tertinggi
Prod2=”b”			# Nama productline dengan quantity tertinggi ke -2
Prod3= “c”			# Nama productline dengan quantity tertinggi ke -3
Maxprod1=0		# Quantity prod1
Maxprod2=0		# Quantity prod2
Maxprod3=0		# Quantity prod3

Dengan asumsi Poin A telah selesai, maka Product line hanya pada negara “United States” di tahun 2012

Fungsi If sama seperti 2A ditambah asumsi “United States” sebagai negara paling banyak quantity-nya. Seperti no 2A max quantity produksi dijumlahkan. 

Untuk pencarian 3 productline tertinggi dilakukan hal dibawah ini :

    1.  “ for(i in maxprod) {     		#  i = $4
If pertama ( if (maxprod[i] . maxprod1){ ) untuk mencari productline tertinggi
Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod1.

    2. “else if (maxprod[i] > maxprod2) { 
Kondisi dimana data yang baru diproses lebih kecil dari maxprod1 namun lebih besar dari maxprod2. Dengan syntax diatas maka yang terisi terakhir dan terbesar adalah data prod2.
    3. “else if (maxprod[i] > maxprod3) {
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
 
	



	

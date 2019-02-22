unzip /home/thalutn5/Documents/Soalshift1/nmr1/nature.zip

mkdir /home/thalutn5/Documents/Soalshift1/nmr1/hasil1
fileasli=/home/thalutn5/Documents/Soalshift1/nmr1/nature/*
fileakhir=/home/thalutn5/Documents/Soalshift1/nmr1/hasil1

foto=0
for i in $fileasli
do
	chmod 777 $i ##ganti hak akses untuk mengedit mengcreate dan executr
	base64 -d $i | xxd -r > $fileakhir/$foto.jpg ##mengdekrip | mengubah  dump men jadi jpg
	let foto=$foto+1
done



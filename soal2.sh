
#!/bin/bash
awk -F ","  '
BEGIN {
	max=0
	negara="a"
	maxprod1=0
	maxprod2=0
	maxprod3=0
	prod1="b"
	prod2="b"
	prod3="b"

}
{
	if($7 == "2012") {
		total[$1] = total[$1] + $10
		if (total[$1] > max) {
			max = total[$1]
			negara = $1
		}

	}
	if ( $1 == "United States" && $7 == "2012") {
		maxprod[$4]= maxprod[$4] + $10
	}
	if ( $1 == "United States" &&  $7 == "2012" && $4 == "Personal Accessories"){
		product1[$6]= product1[$6] + $10
	}
	if ( $1 == "United States" && $7 == "2012" && $4 == "Camping Equipment") {
		product2[$6]= product2[$6] + $10 
	}
	if ( $1 == "United States" && $7 == "2012" && $4 == "Outdoor Protection") {
		product3[$6]= product3[$6] + $10
	}

#	if($7 == "2012" &&  $1 == "United States") {
#		banyak[$4] = banyak[$4] + $10
#		if (banyak[$4] > maxprod) {
#			maxprod1 = banyak[$4]
#			product = $4
#		}
#	} if (


}
END {




	print "2.A.",  negara, max
	print ""


	for (i in maxprod) {
	if (maxprod[i] > maxprod1){
		maxprod3 = maxprod2
		maxprod2 = maxprod1
		maxprod1 = maxprod[i]
		prod3 = prod2
		prod2 = prod1
		prod1 = i
	}
		else if (maxprod[i] > maxprod2) {
		maxprod3 = maxprod2
		maxprod2 =maxprod[i]
		prod3 = prod2
		prod2 = i
	}
	else if (maxprod[i] > maxprod3) {
		maxprod3 = maxprod[i]
		prod3 = i
	}
}	

	print"2.B."

	print "1.", prod1, "dengan total", maxprod1
	print "2.", prod2, "dengan total", maxprod2
	print "3.", prod3, "dengan total", maxprod3
	print ""
	proda="a"
	prodb="a"
	prodc="a"
	maxproda=0
	maxprodb=0
	maxprodc=0
	for (i in product1) {
		if (product1[i] > maxproda) {
			maxproda = product1[i]
			proda = i
		}
	}
	for (i in product2) {
		if (product2[i] > maxprodb) {
			maxprodb = product2[i]
			prodb = i
		}
	}
	for (i in product3) {
		if (product3[i] > maxprodc) {
			maxprodc = product3[i]
			prodc = i
		}
	}
	print "2.C",  "Personal Accessories:", proda, "dengan total", maxproda
	print "Camping Equipment:", prodb, "dengan total", maxprodb
	print "Outdoor Protection:", prodc, "dengan total", maxprodc
}
' /home/gusrai/Downloads/WA_Sales_Products_2012-14.csv 
#awk '
#{
#	split($0, arr, ",")
#	if (arr[7] == 2012) {
#		quantity[arr[1]] = (quantity[arr[1]] + arr[10])
#	}
#	if (arr[7] == 2012 && arr[1] == "United States") {
#		productline[arr[4]] = (productline[arr[4]] + arr[10])
#	}
#	if
#
#}
#END {
#	maxq=0
#	for(I in quantity) {
#		if (quantity[i] > maxq) {
#			maxq = quantity[i]
#			negara = i
#			}
#	}
#	print negara, "dengan total penjualan sebesar", maxq
#	print ""
#	maxp1=0
#	maxp2=0
#	maxp3=0
#	p1="a"
#	p2="a"
#	p3="a"
#	for(i in productline) {
#		if(productline[i] >maxp1) {
#			maxp3 = maxp2
#			maxp2 = maxp1
#			maxp1 = product[i]
#			p3 = p2
#			p2 = p1

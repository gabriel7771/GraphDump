# perl thwe.pl <archivo_de_traza.tr> <nodo> <intervalo de tiempo> > archivo_de_salida.txt
# ejemplo: "perl thwe.pl traza.txt 1 > th.txt"       

$archivo=$ARGV[0];
$intt=$ARGV[1];

$sum=0;
$Acum=0;
$t=0;
$a=0;
      open (DATA,"<$archivo")|| die "Can't open $archivo $!";

  
while (<DATA>) {
             
	@x = split(' '); 
	
	
	if ($x[0]-$Acum <= $intt-0.8)
	{
		
		$sum=($sum+$x[1]);
				
	}
	else
	{   
		if ($x[0]-$Acum > $intt+0.5)
		{
			while($x[0]-$Acum >= $intt)
			{	
				$th=0;
				
				print STDOUT "$Acum    $th\n";
				$Acum=$Acum+1;
			}
		}

		if ($sum ne 0)
		{
		
			
			$th=($sum/$intt)*8;
			print STDOUT "$x[0]    $th\n";
		
			$Acum=$Acum+$intt;
			$sum=0;
				
		}
		else
		{		

			$Acum=$Acum+$intt;			
		}

	}   
}
$th=$sum/$intt;
close DATA;
exit(0);

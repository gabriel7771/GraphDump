$archivo=$ARGV[0];
$intt=$ARGV[1];
$sum=0;
$Acum=0;
$paquetes=0;
$tiempo=0;
$pps=0;
$packet_size_B=0;
$avg_packet_size=0;
$avg_Bps=0;
$avg_bps=0;
$spaquetes="paquetes";
$stiempo="tiempo,_s";
$spps="pps_promedio";
$savg_packet_size="Tamaño_promedio_de_paquetes,_B";
$savg_Bps="Bytes/s_promedio";
$savg_bps="bits/s_promedio";
$sbytes="Bytes";

      open (DATA,"<$archivo")|| die "Can't open $archivo $!";

while (<DATA>) {
    @x = split(' ');
    $paquetes = $paquetes+1;
    $packet_size_B=$packet_size_B+$x[1];
}

$tiempo=$x[0];
$pps=$paquetes/$tiempo;
$avg_packet_size=$packet_size_B/$paquetes;
$avg_Bps=$packet_size_B/$tiempo;
$avg_bps=($packet_size_B*8)/$tiempo;

print STDOUT "$spaquetes                       $paquetes\n";
print STDOUT "$stiempo                      $tiempo\n";
print STDOUT "$spps                   $pps\n";
print STDOUT "$savg_packet_size $avg_packet_size\n";
print STDOUT "$sbytes                          $packet_size_B\n";
print STDOUT "$savg_Bps               $avg_Bps\n";
print STDOUT "$savg_bps                $avg_bps\n";

close DATA;
exit(0);

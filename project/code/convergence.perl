#!/usr/apps/bin/perl
#
# perl program to run convergence test for HERMITE
# run with : perl conv.p

# Here is the generic file
$cmdFile="./apa.f90.T";

for( $i = 1; $i <= 5; $i = 1+$i){
  printf "%d", $i;
  #for( $n = 0.1; $n <= 3; $n = 0.1+$n){
  for( $n = 20; $n <= 2000; $n = 2*$n){
    printf " %f ", $n;
    open(FILE,"$cmdFile") || die "cannot open file $cmdFile!" ;
    open(OUTFILE,">./apa.f90") || die "cannot open file $file!" ;
    # Setup the outfile
    
    while( <FILE> )
      {
        # \b = word boundary, s/PATTERN/REPLACEMENT/
        #$_ =~ s/NNNN/$n/;
        $_ =~ s/NNNN/$n/;
        print OUTFILE $_;
      }
    close( OUTFILE );
    close( FILE );

    system("gfortran apa.f90 -llapack -lblas; ./a.out"); 
  }
  printf "\n";
}
exit


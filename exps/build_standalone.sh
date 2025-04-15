if [ $(echo "$1" | awk '{print tolower($0)}') == 'qldb' ]
then
  qldbopt=ON
  ledgerdbopt=OFF
  sqlledgeropt=OFF
elseif [ $(echo "$1" | awk '{print tolower($0)}') == 'sqlledger' ]
  qldbopt=OFF
  ledgerdbopt=OFF
  sqlledgeropt=ON
else
  qldbopt=OFF
  ledgerdbopt=ON
  sqlledgeropt=OFF
fi


mkdir -p /Ledger/build; cd /Ledger/build; rm -rf *; cmake -DLEDGERDB=${ledgerdbopt} -DAMZQLDB=${qldbopt} -DSQLLEDGER=${sqlledgeropt} ..; make -j6;
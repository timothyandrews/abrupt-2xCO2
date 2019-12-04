PRO idl_create_data
 dir='/net/home/h04/hadta/CMIP6/HadGEM3/Processing/'
 nyrs=150
 ;abrupt-2xCO2 data
 suite='u-bm758'
 RESTORE,dir+'idlsave_global_'+suite+'_only.idl'
 tas=xtas(0:nyrs-1)
 NET=xNET(0:nyrs-1)
 LWcs=xLWcs(0:nyrs-1)
 SWcs=xSWcs(0:nyrs-1)
 LWcre=xLWcre(0:nyrs-1)
 SWcre=xSWcre(0:nyrs-1)
 yr=yr(0:nyrs-1)
 ; write data to csv file
 headers=['year','TAS','NET','LWcs','LWcre','SWcs','SWcre,']
 data_to_write=TRANSPOSE([[yr],[tas],[NET],[LWcs],[LWcre],[SWcs],[SWcre]])
 WRITE_CSV_DATA,data_to_write,headers,filename='HadGEM3-GC31-LL_abrupt-2xCO2_r1i1p1f3_gn_1850-1999_GlobalAnnualMean.csv'
 ;piControl data
 suite='u-ar766'
 RESTORE,dir+'idlsave_global_'+suite+'_only.idl'
 tas=xtas(0:nyrs-1)
 NET=xNET(0:nyrs-1)
 LWcs=xLWcs(0:nyrs-1)
 SWcs=xSWcs(0:nyrs-1)
 LWcre=xLWcre(0:nyrs-1)
 SWcre=xSWcre(0:nyrs-1)
 yr=yr(0:nyrs-1)
 ; write data to csv file
 headers=['year','TAS','NET','LWcs','LWcre','SWcs','SWcre,']
 data_to_write=TRANSPOSE([[yr],[tas],[NET],[LWcs],[LWcre],[SWcs],[SWcre]])
 WRITE_CSV_DATA,data_to_write,headers,filename='HadGEM3-GC31-LL_piControl_r1i1p1f1_gn_1850-1999_GlobalAnnualMean.csv'
END

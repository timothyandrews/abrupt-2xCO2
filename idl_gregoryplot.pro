PRO idl_gregoryplot
 x=READ_CSV('HadGEM3-GC31-LL_piControl_r1i1p1f1_gn_1850-1999_GlobalAnnualMean.csv')
 cntl_tas=x.FIELD2
 cntl_NET=x.FIELD3
 x=READ_CSV('HadGEM3-GC31-LL_abrupt-2xCO2_r1i1p1f3_gn_1850-1999_GlobalAnnualMean.csv')
 pert_tas=x.FIELD2
 pert_NET=x.FIELD3
 dT=pert_tas-cntl_tas
 dN=pert_NET-cntl_NET
 !P.FONT = 0
 !P.THICK = 5
 !X.THICK = 5
 !Y.THICK = 5
 !P.MULTI = [0,2,2]
 PR,file='Figure_GregoryPlot.ps', /cps, /landscape
  A=FindGen(16)*(!PI*2/16.)
  UserSym,COS(A),SIN(A),/fill
  xmaxmin=[0.0,5.0]
  ymaxmin =[0.0,4.0]
  PLOT,xmaxmin,ymaxmin,xrange=xmaxmin,yrange=ymaxmin,xstyle=9,ystyle=9,$
      xtitle='!9D!3T(K)',ytitle='!9D!3N (Wm!E-2!N)',CHARSIZE=1.1,/NODATA
      OPLOT,dT,dN,PSYM=8,SYMSIZE=0.7,COLOR=2
      coeff=LINFIT(dT,dN)
      EffCS=-1.*coeff[0]/coeff[1]
      linear_fit=coeff[0]+coeff[1]*[0.0,EffCS]
      OPLOT,[0.0,EffCS],linear_fit,linestyle=0,THICK=5
      leg=['F!D2x!N = '+STRING(number_formatter(coeff[0],decimals=2))+' W m-!E2!N',$
           '!9l!3 = '+STRING(number_formatter(coeff[1],decimals=2))+' W m!E-2!N K!E-1!N',$
           'EffCS = '+STRING(number_formatter(EffCS,decimals=1))+' K']
      LEGEND3,leg,CHARSIZE=1,box=0,SPACING=1.1,MARGIN=0.1,/BOTTOM,/LEFT
      LEGEND3,['HadGEM3-GC3.1-LL abrupt-2xCO2'],CHARSIZE=1,box=0,SPACING=1.1,MARGIN=0.1,/TOP,/RIGHT
 PREND, /keep, /noprint
 SPAWN,'ps2pdf Figure_GregoryPlot.ps'
END

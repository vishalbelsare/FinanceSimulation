!     -*- f90 -*-
!     This file is autogenerated with f2py (version:1.20.3)
!     It contains Fortran 90 wrappers to fortran functions.

      subroutine f2pywrap_fortranmetrics_f90_sharpe_ratio (f90_sharpe_ra&
     &tiof2pywrap, nbsymbols, weights, r, cov, rf)
      use fortranmetrics, only : f90_sharpe_ratio
      integer nbsymbols
      real rf
      real weights(nbsymbols)
      real r(nbsymbols)
      real cov(nbsymbols,nbsymbols)
      real f90_sharpe_ratiof2pywrap
      f90_sharpe_ratiof2pywrap = f90_sharpe_ratio(nbsymbols, weights, r,&
     & cov, rf)
      end subroutine f2pywrap_fortranmetrics_f90_sharpe_ratio
      subroutine f2pywrap_fortranmetrics_f90_mpt_costfunction (f90_mpt_c&
     &ostfunctionf2pywrap, nbsymbols, weights, r, cov, rf, lamb, v0)
      use fortranmetrics, only : f90_mpt_costfunction
      integer nbsymbols
      real rf
      real lamb
      real v0
      real weights(nbsymbols + 1)
      real r(nbsymbols)
      real cov(nbsymbols,nbsymbols)
      real f90_mpt_costfunctionf2pywrap
      f90_mpt_costfunctionf2pywrap = f90_mpt_costfunction(nbsymbols, wei&
     &ghts, r, cov, rf, lamb, v0)
      end subroutine f2pywrap_fortranmetrics_f90_mpt_costfunction
      subroutine f2pywrap_fortranmetrics_f90_mpt_entropy_costfunction (f&
     &90_mpt_entropy_costfunctionf2pywrap, nbsymbols, weights, r, cov, r&
     &f, lamb0, lamb1, v)
      use fortranmetrics, only : f90_mpt_entropy_costfunction
      integer nbsymbols
      real rf
      real lamb0
      real lamb1
      real v
      real weights(nbsymbols + 1)
      real r(nbsymbols)
      real cov(nbsymbols,nbsymbols)
      real f90_mpt_entropy_costfunctionf2pywrap
      f90_mpt_entropy_costfunctionf2pywrap = f90_mpt_entropy_costfunctio&
     &n(nbsymbols, weights, r, cov, rf, lamb0, lamb1, v)
      end subroutine f2pywrap_fortranmetrics_f90_mpt_entropy_costfunctio&
     &n
      
      subroutine f2pyinitfortranmetrics(f2pysetupfunc)
      interface 
      subroutine f2pywrap_fortranmetrics_f90_sharpe_ratio (f90_sharpe_ra&
     &tiof2pywrap, f90_sharpe_ratio, nbsymbols, weights, r, cov, rf)
      real f90_sharpe_ratio
      integer nbsymbols
      real rf
      real weights(nbsymbols)
      real r(nbsymbols)
      real cov(nbsymbols,nbsymbols)
      real f90_sharpe_ratiof2pywrap
      end subroutine f2pywrap_fortranmetrics_f90_sharpe_ratio 
      subroutine f2pywrap_fortranmetrics_f90_mpt_costfunction (f90_mpt_c&
     &ostfunctionf2pywrap, f90_mpt_costfunction, nbsymbols, weights, r, &
     &cov, rf, lamb, v0)
      real f90_mpt_costfunction
      integer nbsymbols
      real rf
      real lamb
      real v0
      real weights(nbsymbols + 1)
      real r(nbsymbols)
      real cov(nbsymbols,nbsymbols)
      real f90_mpt_costfunctionf2pywrap
      end subroutine f2pywrap_fortranmetrics_f90_mpt_costfunction 
      subroutine f2pywrap_fortranmetrics_f90_mpt_entropy_costfunction (f&
     &90_mpt_entropy_costfunctionf2pywrap, f90_mpt_entropy_costfunction,&
     & nbsymbols, weights, r, cov, rf, lamb0, lamb1, v)
      real f90_mpt_entropy_costfunction
      integer nbsymbols
      real rf
      real lamb0
      real lamb1
      real v
      real weights(nbsymbols + 1)
      real r(nbsymbols)
      real cov(nbsymbols,nbsymbols)
      real f90_mpt_entropy_costfunctionf2pywrap
      end subroutine f2pywrap_fortranmetrics_f90_mpt_entropy_costfunctio&
     &n
      end interface
      external f2pysetupfunc
      call f2pysetupfunc(f2pywrap_fortranmetrics_f90_sharpe_ratio,f2pywr&
     &ap_fortranmetrics_f90_mpt_costfunction,f2pywrap_fortranmetrics_f90&
     &_mpt_entropy_costfunction)
      end subroutine f2pyinitfortranmetrics


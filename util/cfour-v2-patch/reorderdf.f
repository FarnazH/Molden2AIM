      SUBROUTINE REORDERDF(VECIN,VECOUT,IANG,NBASX)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION VECIN(NBASX),VECOUT(NBASX),IANG(NBASX)
      CALL SCOPY(NBASX,VECIN,1,VECOUT,1)
      I=0
1     I=I+1
      IF(I.GT.NBASX)RETURN
      IF(IANG(I).LT.2.AND.I.LE.NBASX)GOTO 1
      IF(IANG(I).EQ.2)THEN
       CALL REORDERD(VECIN(I),VECOUT(I))
       I=I+5
       GOTO 1
      ELSEIF(IANG(I).EQ.3)THEN
       CALL REORDERF(VECIN(I),VECOUT(I))
       I=I+9
       GOTO 1
c<<<
      ELSEIF(IANG(I).EQ.4)THEN
       CALL REORDERG(VECIN(I),VECOUT(I))
       I=I+14
       GOTO 1
c>>>
      ENDIF
      RETURN
      END
c<<<
      SUBROUTINE REORDERG(DIN,DOUT)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION DIN(15),DOUT(15)
      DOUT(1) =DIN( 1)
      DOUT(2) =DIN(11)
      DOUT(3) =DIN(15)
      DOUT(4) =DIN( 2)
      DOUT(5) =DIN( 3)
      DOUT(6) =DIN( 7)
      DOUT(7) =DIN(12)
      DOUT(8) =DIN(10)
      DOUT(9) =DIN(14)
      DOUT(10)=DIN( 4)
      DOUT(11)=DIN( 6)
      DOUT(12)=DIN(13)
      DOUT(13)=DIN( 5)
      DOUT(14)=DIN( 8)
      DOUT(15)=DIN( 9)
      RETURN
      END
c>>>

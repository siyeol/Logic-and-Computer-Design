// 2016920059 최시열 project3

// 1. 선그리기
(VSCREEN)
    @SCREEN
    D=A
    @i
    M=D
    @Vcount
    M=1


(VERTILOOP)
    @Vcount
    D=M

    @8192 //8192
    D=D-A

    @HSCREEN
    D;JGT
    
    @1
    D=A
    @i
    A=M
    M=D // DRAW 하는 부분

    @1
    D=A
    @i
    M=D+M // 1씩 증가시키는 부분

    @Vcount
    M=M+1

    @VERTILOOP
    0;JMP

(HSCREEN)
    @SCREEN
    D=A
    @i
    M=D
    @Hcount
    M=1
    @Hcount2
    M=1

(HORILOOP)
    @Hcount
    D=M

    @32
    D=D-A

    @BIGHORILOOP
    D;JGT
    
    @1 
    D=-A
    @i
    A=M
    M=D

    @1
    D=A
    @i
    M=D+M // 1씩 증가시키는 부분

    @Hcount
    M=M+1

    @HORILOOP
    0;JMP

(BIGHORILOOP)
    @Hcount
    M=1
    
    @Hcount2
    D=M

    @15 // 원래 15!!
    D=D-A
    
    @CURSOR
    D;JGT

    @480
    D=A
    @i
    M=D+M // 1씩 증가시키는 부분

    @Hcount2
    M=M+1

    @HORILOOP
    0;JMP


// 2. 커서 설정하기
(CURSOR)
    @20528 // 커서의 주소 : 20528 
    D=A
    @j
    M=D
(COUNTDEFINE) 
    // key 반복회수 초기화
    @upcount
    M=0
    @downcount
    M=0
    @leftcount
    M=0
    @rightcount
    M=0

(RECURSOR)

    // M[j] 값 대입
    @8192
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @24576
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @8192
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @3120
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @7800
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @16380
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @7800
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @4080
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @2017
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @965
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @387
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    // M[j] 값 대입
    @399
    D=A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

//3. 키 입력받고 분류
(KEYINPUT)
    @KBD
    D=M
    @save
    M=D
    // count갯수 check

    @WAIT
    D;JNE
    @KEYINPUT
    D;JEQ

(WAIT)
    //대기
    @KBD
    D=M
    @WAIT
    D;JNE
    @MOVE
    D;JEQ

(MOVE)
    @save
    D=M
    @131 // up 131
    D=D-A
    @UPCHECK
    D;JEQ

    @save
    D=M
    @133 // down
    D=D-A
    @DOWNCHECK
    D;JEQ
    
    @save
    D=M
    @130 // left 130
    D=D-A
    @LEFTCHECK
    D;JEQ
    
    @save
    D=M
    @132 // right
    D=D-A
    @RIGHTCHECK
    D;JEQ

//4. 화면 범위를 벗어나는지 check
(UPCHECK)
    @downcount
    D=M
    @8
    D=D+A
    @upcount
    D=M-D
    @KEYINPUT//빠꾸
    D;JEQ

    @UP
    0;JMP

(DOWNCHECK)

    @upcount
    D=M
    
    //Down예외처리
    
    @7
    D=D+A
    @downcount
    D=M-D
    @KEYINPUT//빠꾸
    D;JEQ

    @DOWN
    0;JMP

(LEFTCHECK)

    @rightcount
    D=M
    @16
    D=D+A
    @leftcount
    D=M-D
    @KEYINPUT//빠꾸
    D;JEQ

    @LEFT
    0;JMP
(RIGHTCHECK)

    @leftcount
    D=M
    @15
    D=D+A
    @rightcount
    D=M-D
    @KEYINPUT//빠꾸
    D;JEQ

    @RIGHT
    0;JMP

//5. 커서 움직이기
(UP)
    //위 boundary 설정
    
    
    // j주소에 black blox 색칠 하기 추가
    @UBLACKBOX
    0;JMP

    (UPIN)

    // 옮기기
    @j
    D=M
    @896
    D=D-A
    @j
    M=D // 커서를 옮김

    @upcount
    M=M+1

    @RECURSOR
    0;JMP



(DOWN)
    @DBLACKBOX
    0;JMP

    (DOWNIN)
    @j
    D=M
    @128
    D=D+A

    @j
    M=D

    @downcount
    M=M+1

    @RECURSOR
    0;JMP

(LEFT)
    @LBLACKBOX
    0;JMP

    (LEFTIN)
    @j
    D=M
    @127
    D=D+A
    @j
    M=D

    @j
    D=M
    @512
    D=D-A
    @j
    M=D

    @leftcount
    M=M+1

    @RECURSOR
    0;JMP

(RIGHT)
    @RBLACKBOX
    0;JMP

    (RIGHTIN)
    @j
    D=M
    @129
    D=D+A
    @j
    M=D

    @j
    D=M
    @512
    D=D-A
    @j
    M=D
    
    @rightcount
    M=M+1

    @RECURSOR
    0;JMP

//6. 움직이는 경로 따라서 검은 박스 생성하기
(DBLACKBOX)
    //j값을 잠시 temp에 빼두기
    @j
    D=M
    @temp
    M=D

    //검은 박스로 칠하기
    @Bcount
    M=1
    @j
    D=M
    @384 //384
    D=D-A
    @j
    M=D
    (DBLACKLOOP)
    @Bcount
    D=M

    @16
    D=D-A

    @DBLACKEND
    D;JGT


    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @Bcount
    M=M+1


    @DBLACKLOOP
    0;JMP
    
    //원래의 j값 리턴
    (DBLACKEND)
    @temp
    D=M
    @j
    M=D

    @DOWNIN
    0;JMP




(UBLACKBOX)
    //j값을 잠시 temp에 빼두기
    @j
    D=M
    @temp2
    M=D

    // 맨 밑줄이면
    // 수동검은 칠하기
    @upcount
    D=M
    @7
    D=D+A
    @downcount
    D=M-D
    @NEWD
    D;JEQ
    (NEWD)
    //코드삽입

    @Bcount2
    M=1
    @j
    D=M
    @384
    D=D-A
    @j
    M=D

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
 
    @UBLACKEND
    0;JMP




    //맨밑줄 아니면
    //검은 박스로 칠하기
    @Bcount2
    M=1
    @j
    D=M
    @384
    D=D-A
    @j
    M=D
    (UBLACKLOOP)
    @Bcount2
    D=M

    @16
    D=D-A

    @UBLACKEND
    D;JGT


    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @Bcount2
    M=M+1
    @UBLACKLOOP
    0;JMP
    
    (UBLACKEND)
    //원래의 j값 리턴
    @temp2
    D=M
    @j
    M=D

    @UPIN
    0;JMP

(LBLACKBOX)
    //j값을 잠시 temp에 빼두기
    @j
    D=M
    @temp3
    M=D

    
    @upcount
    D=M
    @7
    D=D+A
    @downcount
    D=M-D
    @NEWL
    D;JEQ
    (NEWL)
    

    @Bcount2
    M=1
    @j
    D=M
    @384
    D=D-A
    @j
    M=D

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

 
    @LBLACKEND
    0;JMP



    //검은 박스로 칠하기
    @Bcount3
    M=1
    @j
    D=M
    @384
    D=D-A
    @j
    M=D
    (LBLACKLOOP)
    @Bcount3
    D=M

    @16
    D=D-A

    @LBLACKEND
    D;JGT


    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @Bcount3
    M=M+1
    @LBLACKLOOP
    0;JMP
    
    (LBLACKEND)
    //원래의 j값 리턴
    @temp3
    D=M
    @j
    M=D

    @LEFTIN
    0;JMP

(RBLACKBOX)
    //j값을 잠시 temp에 빼두기
    @j
    D=M
    @temp4
    M=D

    // 맨 밑줄이면
    // 수동검은 칠하기
    @upcount
    D=M
    @7
    D=D+A
    @downcount
    D=M-D
    @NEWR
    D;JEQ
    (NEWR)
    //코드삽입

    @Bcount2
    M=1
    @j
    D=M
    @384
    D=D-A
    @j
    M=D

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M
 
    @RBLACKEND
    0;JMP


    //검은 박스로 칠하기
    @Bcount4
    M=1
    @j
    D=M
    @384
    D=D-A
    @j
    M=D
    (RBLACKLOOP)
    @Bcount4
    D=M

    @16
    D=D-A

    @RBLACKEND
    D;JGT


    @1
    D=-A
    @j
    A=M
    M=D

    // M[j] += 32
    @32
    D=A
    @j
    M=D+M

    @Bcount4
    M=M+1
    @RBLACKLOOP
    0;JMP
    
    (RBLACKEND)
    //원래의 j값 리턴
    @temp4
    D=M
    @j
    M=D

    @RIGHTIN
    0;JMP


//7. 종료
(END)
    @END
    0;JMP





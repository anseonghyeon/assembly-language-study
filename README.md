# assembly-language-study
Toy프로세서 어셈블리어로 별 찍기 프로그램을 만들어 봤습니다.
## 이전
![before](https://github.com/anseonghyeon/assembly-language-study/assets/62938167/47f6437b-70c8-4573-9d93-249f30515209)
## 이후
![after](https://github.com/anseonghyeon/assembly-language-study/assets/62938167/fe43e412-5313-41ef-9c97-f023fe68e2d3)
## 출력결과
![result2](https://github.com/anseonghyeon/assembly-language-study/assets/62938167/fa41f643-71fa-4990-9375-e5d52918f8cc)


# 어셈블리어로 별 찍기를 해보자

**202112631**  
**안성현**  
**2023-09-30**

---

## 📌 프로그램 개요 설명

보통 어떠한 프로그래밍 언어의 반복문을 배우고 나면 처음으로 해보는 것이 별 찍기인데, 이것을 어셈블리어로도 해보면 재미있을 것 같아서 만들어 보았습니다.

---

## 🧾 프로그램 내용 및 설명 (.s 파일)

사용자의 입력 값을 높이로 하는 삼각형을 출력하는 어셈블리어 프로그램입니다.  
입력은 1부터 9까지의 수만 가능합니다.

```asm
.ORIGIN 0x2000 ; 프로그램 시작주소 설정
COPY R0, 0     ; 에코모드 끄기 위한 설정
SWI 4          ; 에코모드 비활성화
SWI 0          ; 사용자 입력 받기

COPY R1, R0    ; 입력값 백업
SUB R1, R1, 48 ; 문자 -> 정수 변환 (ASCII '0' = 48)
COPY R3, R1    ; 삼각형 높이 설정

outer_loop:
COPY R2, R1

inner_loop:
COPY R0, '*'   ; 별 문자 출력
SWI 1
SUB R2, R2, 1
CMP R2, R3
BR zp, inner_loop

COPY R0, 10    ; 개행
SWI 1
SUB R3, R3, 1
CMP R3, 0
BR p, outer_loop

SWI 255        ; 프로그램 종료
```

🧮 어셈블러 출력 및 설명 (.lst 파일)
프로그램 시작 주소: 0x002000

프로그램 종료 주소: 0x002011

심볼 테이블:

outer_loop: 0x002006

inner_loop: 0x002006

명령어 해석은 위의 .s 파일 설명과 동일합니다.

🖼 기계어 프로그램 간단 설명 (시뮬레이터 실행 초기 화면)
프로그램 이름: star

사용 레지스터: R0, R1, R2, R3

IR(Instruction Register): 아직 명령어 읽지 않아 0

PC(Program Counter): 첫 번째 명령어 주소

CCR(Condition Code Register): 초기값 0

🔄 프로그램 실행 과정 및 설명
문자 입력 → 숫자 변환 과정
사용자 입력값 '9'의 ASCII: 57

정수 변환을 위해 48을 빼서 9로 만듦

변환 후 R1 레지스터에 숫자 9 저장

✅ 실행 결과 검증
입력값 5 → 5층 삼각형 출력

입력값 9 → 9층 삼각형 출력

💡 요약 및 결론
어셈블리어로 프로그래밍을 해본 결과, 간단한 프로그램을 작성하는 데에도 많은 과정과 복잡함이 따르며, 선조들의 고급 언어 발명에 감사함을 느꼈습니다.

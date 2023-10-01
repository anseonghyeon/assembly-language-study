	.ORIGIN 0x2000		; 시작 주소 0x2000번지로 설정

	COPY R0, 0		; R0에 0을 저장
	SWI 4			; R0의 값으로 에코모드 끄기
	
	SWI 0			; 키보드로 입력한 문자 읽기
	COPY R1, R0		; 입력된 문자 옴겨두기
	SUB R1, R1, 48		; 입력된 문자를 숫자로 변환

	COPY R3, R1		; 행반복 횟수 초기화
outer_loop:
	COPY R2, R1		; 열반복 횟수 초기화

inner_loop:
	COPY R0, '*'		; R0의 값을 별모양으로 변경
	SWI 1			; R0의 값을 출력

	SUB R2, R2, 1		; R2값 1 감소
	CMP R2, R3		; R2와 R3를 비교
	BR zp, inner_loop		; R3가 더 크다면 분기
	
	COPY R0, 10		; 개행문자 R0에 저장
	SWI 1			; 개행문자 출력

	SUB R3, R3, 1		; R3값 1 감소
	CMP R3, 0		; R3와 0 비교
	BR p, outer_loop		; R3가 크면 분기
	
	SWI 255			; 운영체제 기능 호출로 프로그램 종료

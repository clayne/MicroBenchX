[BITS 64]

%include "parameters.inc"

extern exit

global zen_fpu_mix_21

section .text

zen_fpu_mix_21:
    push rbp
	mov rax, ITERATIONS_madd_avx256f
    lea rbx, [rel avx_iv]
	vmovdqa ymm0, [rbx]
	vmovdqa ymm1, [rbx]
	vmovdqa ymm2, [rbx]
	vmovdqa ymm3, [rbx]
	vmovdqa ymm4, [rbx]
	vmovdqa ymm5, [rbx]
	vmovdqa ymm6, [rbx]
	vmovdqa ymm7, [rbx]
	vmovdqa ymm8, [rbx]
	vmovdqa ymm9, [rbx]
	vmovdqa ymm10, [rbx]
	vmovdqa ymm11, [rbx]
	vmovdqa ymm12, [rbx]
	vmovdqa ymm13, [rbx]
	vmovdqa ymm14, [rbx]
	vmovdqa ymm15, [rbx]
.loop:
	vaddps ymm0, ymm0
	vfmadd132ps ymm1, ymm1, ymm1
	vfmadd132ps ymm2, ymm2, ymm2
	vaddps ymm3, ymm3
	vfmadd132ps ymm4, ymm4, ymm4
	vfmadd132ps ymm5, ymm5, ymm5
	vaddps ymm6, ymm6
	vfmadd132ps ymm7, ymm7, ymm7
	vfmadd132ps ymm8, ymm8, ymm8
	vaddps ymm9, ymm9
	vfmadd132ps ymm10, ymm10, ymm10
	vfmadd132ps ymm11, ymm11, ymm11
	vaddps ymm12, ymm12
	vfmadd132ps ymm13, ymm13, ymm13
	vfmadd132ps ymm14, ymm14, ymm14
	vaddps ymm15, ymm15
	dec rax
	jnz .loop
.exit:
    lea rdi, [rel format]
	pop rbp
	xor rax, rax
	mov rax, ITERATIONS_madd_avx256f
    mov rsi, 18 ; 10 vfmadd132ps + 6 vaddps + 1 dec + 1 loop
	mul rsi
    ret

section .data

format: db "%lu", 10, 0
align 32
avx_iv: dd 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0
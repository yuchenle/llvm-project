; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 4
; RUN: llc %s -o - -mtriple=aarch64 -mattr=+aes | FileCheck %s

declare <16 x i8> @llvm.aarch64.crypto.aese(<16 x i8> %d, <16 x i8> %k)
declare <16 x i8> @llvm.aarch64.crypto.aesd(<16 x i8> %d, <16 x i8> %k)

define <16 x i8> @aese(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: aese:
; CHECK:       // %bb.0:
; CHECK-NEXT:    aese v0.16b, v1.16b
; CHECK-NEXT:    ret
  %r = call <16 x i8> @llvm.aarch64.crypto.aese(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %r
}

define <16 x i8> @aese_c(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: aese_c:
; CHECK:       // %bb.0:
; CHECK-NEXT:    aese v1.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    ret
  %r = call <16 x i8> @llvm.aarch64.crypto.aese(<16 x i8> %b, <16 x i8> %a)
  ret <16 x i8> %r
}

define <16 x i8> @aesd(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: aesd:
; CHECK:       // %bb.0:
; CHECK-NEXT:    aesd v0.16b, v1.16b
; CHECK-NEXT:    ret
  %r = call <16 x i8> @llvm.aarch64.crypto.aesd(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %r
}

define <16 x i8> @aesd_c(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: aesd_c:
; CHECK:       // %bb.0:
; CHECK-NEXT:    aesd v1.16b, v0.16b
; CHECK-NEXT:    mov v0.16b, v1.16b
; CHECK-NEXT:    ret
  %r = call <16 x i8> @llvm.aarch64.crypto.aesd(<16 x i8> %b, <16 x i8> %a)
  ret <16 x i8> %r
}

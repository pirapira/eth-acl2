
(in-package "ACL2")

(include-book "../../env")
(include-book "../../exec")
(include-book "../helper")

(defun mk-initial-env-and3 ()

  (mk-env
    ;; pc
    0
    ;; rom
    (mk-rom "7f0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff16600055")
    ;; stack
    (mk-empty-stack)
    ;; mem
    (mk-empty-memory)
    ;; storage
    (mk-empty-storage)
    ;; halted
    nil
    ;; gas
    100000
    ;; context
  
    (mk-context
      ;; ia
      87579061662017136990230301793909925042452127430
      ;; io
      1170859069862169782511871033392474246841492526721
      ;; ip
      100000000000000
      ;; id
      nil
      ;; is
      1170859069862169782511871033392474246841492526721
      ;; iv
      1000000000000000000
      ;; ih
  
      (mk-block-header
        ;; ihc
        244687034288125203496486448490407391986876152250
        ;; ihs
        1
        ;; ihi
        0
        ;; ihd
        256
        ;; ihl
        1000000)
      ;; ie
       "<call/create stack height>"
      ;; iw
      "<permission>")
    ;; substate
  
    (mk-substate
      ;; suiside
      nil
      ;; log
      nil
      ;; touched
      nil
      ;; refund
      0)))

(defun env-with-pre-and3 ()
    (mk-initial-env-and3))

(defun env-with-post-and3 ()
    (env/set-halted 
  (env/storage/store   (mk-initial-env-and3)
                     0
                     514631507721405306298073637848375664226723355710112857507800679889911926255) (cons 'out-of-range "Halted: pc out of range.")))

(defthm expect-and3
  (expected-env-p (env/exec (env-with-pre-and3))
                  (env-with-post-and3)))
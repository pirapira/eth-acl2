(in-package "ACL2")

(include-book "env")
(include-book "op")
(include-book "op-exec")

(defund env/step (env)
  (if (env/halted env) env
      (if (env/has-nextop env)
          (let ((nextop (env/nextop env)))
            (cond ((op/stopp nextop) (exec-stop env))
                  ((op/addp nextop) (exec-add env))
                  ((op/mulp nextop) (exec-mul env))
                  ((op/subp nextop) (exec-sub env))
                  ((op/divp nextop) (exec-div env))
                  ((op/sdivp nextop) (exec-sdiv env))
                  ((op/modp nextop) (exec-mod env))
                  ((op/addmodp nextop) (exec-addmod env))
                  ((op/mulmodp nextop) (exec-mulmod env))
                  ((op/expp nextop) (exec-exp env))
                  ((op/ltp nextop) (exec-lt env))
                  ((op/gtp nextop) (exec-gt env))
                  ((op/eqp nextop) (exec-eq env))
                  ((op/iszerop nextop) (exec-iszero env))
                  ((op/andp nextop) (exec-and env))
                  ((op/orp nextop) (exec-or env))
                  ((op/xorp nextop) (exec-xor env))
                  ((op/notp nextop) (exec-not env))
                  ((op/callerp nextop) (exec-caller env))
                  ((op/callvaluep nextop) (exec-callvalue env))
                  ((op/calldataloadp nextop) (exec-calldataload env))
                  ((op/calldatasizep nextop) (exec-calldatasize env))
                  ((op/codecopyp nextop) (exec-codecopy env))
                  ((op/push1p nextop) (exec-push1 env))
                  ((op/push2p nextop) (exec-push2 env))
                  ((op/push3p nextop) (exec-push3 env))
                  ((op/push4p nextop) (exec-push4 env))
                  ((op/push5p nextop) (exec-push5 env))
                  ((op/push6p nextop) (exec-push6 env))
                  ((op/push7p nextop) (exec-push7 env))
                  ((op/push8p nextop) (exec-push8 env))
                  ((op/push9p nextop) (exec-push9 env))
                  ((op/push10p nextop) (exec-push10 env))
                  ((op/push11p nextop) (exec-push11 env))
                  ((op/push12p nextop) (exec-push12 env))
                  ((op/push13p nextop) (exec-push13 env))
                  ((op/push14p nextop) (exec-push14 env))
                  ((op/push15p nextop) (exec-push15 env))
                  ((op/push16p nextop) (exec-push16 env))
                  ((op/push17p nextop) (exec-push17 env))
                  ((op/push18p nextop) (exec-push18 env))
                  ((op/push19p nextop) (exec-push19 env))
                  ((op/push20p nextop) (exec-push20 env))
                  ((op/push21p nextop) (exec-push21 env))
                  ((op/push22p nextop) (exec-push22 env))
                  ((op/push23p nextop) (exec-push23 env))
                  ((op/push24p nextop) (exec-push24 env))
                  ((op/push25p nextop) (exec-push25 env))
                  ((op/push26p nextop) (exec-push26 env))
                  ((op/push27p nextop) (exec-push27 env))
                  ((op/push28p nextop) (exec-push28 env))
                  ((op/push29p nextop) (exec-push29 env))
                  ((op/push30p nextop) (exec-push30 env))
                  ((op/push31p nextop) (exec-push31 env))
                  ((op/push32p nextop) (exec-push32 env))
                  ((op/dup1p nextop) (exec-dup1 env))
                  ((op/dup2p nextop) (exec-dup2 env))
                  ((op/dup3p nextop) (exec-dup3 env))
                  ((op/dup4p nextop) (exec-dup4 env))
                  ((op/dup5p nextop) (exec-dup5 env))
                  ((op/dup6p nextop) (exec-dup6 env))
                  ((op/dup7p nextop) (exec-dup7 env))
                  ((op/dup8p nextop) (exec-dup8 env))
                  ((op/dup9p nextop) (exec-dup9 env))
                  ((op/dup10p nextop) (exec-dup10 env))
                  ((op/dup11p nextop) (exec-dup11 env))
                  ((op/dup12p nextop) (exec-dup12 env))
                  ((op/dup13p nextop) (exec-dup13 env))
                  ((op/dup14p nextop) (exec-dup14 env))
                  ((op/dup15p nextop) (exec-dup15 env))
                  ((op/dup16p nextop) (exec-dup16 env))
                  ((op/mloadp nextop) (exec-mload env))
                  ((op/mstorep nextop) (exec-mstore env))
                  ((op/mstore8p nextop) (exec-mstore8 env))
                  ((op/sloadp nextop) (exec-sload env))
                  ((op/sstorep nextop) (exec-sstore env))
                  ((op/jumpp nextop) (exec-jump env))
                  ((op/jumpip nextop) (exec-jumpi env))
                  ((op/jumpdestp nextop) (exec-jumpdest env))
                  ((op/swap1p nextop) (exec-swap1 env))
                  ((op/swap2p nextop) (exec-swap2 env))
                  ((op/swap3p nextop) (exec-swap3 env))
                  ((op/swap4p nextop) (exec-swap4 env))
                  ((op/swap5p nextop) (exec-swap5 env))
                  ((op/swap6p nextop) (exec-swap6 env))
                  ((op/swap7p nextop) (exec-swap7 env))
                  ((op/swap8p nextop) (exec-swap8 env))
                  ((op/swap9p nextop) (exec-swap9 env))
                  ((op/swap10p nextop) (exec-swap10 env))
                  ((op/swap11p nextop) (exec-swap11 env))
                  ((op/swap12p nextop) (exec-swap12 env))
                  ((op/swap13p nextop) (exec-swap13 env))
                  ((op/swap14p nextop) (exec-swap14 env))
                  ((op/swap15p nextop) (exec-swap15 env))
                  ((op/swap16p nextop) (exec-swap16 env))
                  ((op/log0p nextop) (exec-log0 env))
                  ((op/log1p nextop) (exec-log1 env))
                  ((op/log2p nextop) (exec-log2 env))
                  ((op/log3p nextop) (exec-log3 env))
                  ((op/log4p nextop) (exec-log4 env))
                  ((op/revertp nextop) (exec-revert env))
                  ((op/returnp nextop) (exec-return env))
                  (t (exec-unknown env))))
          (env/set-halted env (cons 'out-of-range "Halted: pc out of range.")))))

(defun env/exec-hacky (env max-steps)
  (if (zp max-steps) env
      (let* ((env1 (env/step env)))
        (env/exec-hacky env1 (- max-steps 1)))))

(defun env/exec (env) (env/exec-hacky env 100000))

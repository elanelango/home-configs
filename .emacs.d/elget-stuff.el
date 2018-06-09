;; Packages to include via el-get
(setq el-get-packages
      '(el-get
        ;; pymacs
        ;; ropemacs
        )
      )

;; getelget -- bootstrap el-get if necessary and load the specified packages
(load-file 
 (concat (file-name-as-directory user-emacs-directory) "getelget.el"))


(setq booksample-project
      (ede-cpp-root-project "booksamples"
                            :file "/mnt/sda6/alan/workspace/c++/pthread_srcs/booksamples/CMakeLists.txt"
                            :system-include-path '()
                            :local-variables (list
                                              (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                              )
                            ))
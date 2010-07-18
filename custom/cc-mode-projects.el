;; -------[RI MAIN project definition]------------------------------------------------------
(ede-cpp-root-project "RI MAIN"
                      :name "RI MAIN Project"
                      :file "~/workspace/ufmg/master/ri/ri-git/ri_main/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/opt/ri/include"
                                             "/opt/ri/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[RI SEARCH project definition]------------------------------------------------------
(ede-cpp-root-project "RI SEARCH"
                      :name "RI SEARCH Project"
                      :file "~/workspace/ufmg/master/ri/ri-git/ri_search/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/opt/ri/include/"
                                             "/opt/ri/include/thrift/"
                                             "/opt/ri/include/thrift/protocol/"
                                             "/opt/ri/include/thrift/processor/"
                                             "/opt/ri/include/thrift/concurrency/"
                                             "/opt/ri/include/thrift/server/"
                                             "/opt/ri/include/thrift/transport/"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[RI ANALYSIS project definition]------------------------------------------------------
(ede-cpp-root-project "RI ANALYSIS"
                      :name "RI ANALYSIS Project"
                      :file "~/workspace/ufmg/master/ri/ri-git/ri_analysis/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/opt/ri/include"
                                             "/opt/ri/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[RI INDEX project definition]------------------------------------------------------
(ede-cpp-root-project "RI INDEX"
                      :name "RI INDEX Project"
                      :file "~/workspace/ufmg/master/ri/ri-git/ri_index/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/opt/ri/include"
                                             "/opt/ri/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[RI COMMON project definition]------------------------------------------------------
(ede-cpp-root-project "RI COMMON"
                      :name "RI COMMON Project"
                      :file "~/workspace/ufmg/master/ri/ri-git/ri_common/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/opt/ri/include"
                                             "/opt/ri/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[RI UTILS project definition]------------------------------------------------------
(ede-cpp-root-project "RI UTILS"
                      :name "RI UTILS Project"
                      :file "~/workspace/ufmg/master/ri/ri-git/ri_utils/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/opt/ri/include"
                                             "/opt/ri/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[Qt Hello World project definition]------------------------------------------------------
(ede-cpp-root-project "Qt Hello World"
                      :name "Qt Hello World Project"
                      :file "~/workspace/c++/qt/helloworld/helloworld.cc"
                      :include-path '(".")
                      :system-include-path '("/usr/include/c++/4.4/"
                                             "/usr/include/qt4/"
                                             "/usr/include/qt4/Qt/"
                                             "/usr/include/qt4/QtCore/"
                                             "/usr/include/qt4/QtGui/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[Qt Hello World project definition]------------------------------------------------------
(ede-cpp-root-project "Qt Webkit"
                      :name "Qt Webkit"
                      :file "~/workspace/c++/qt/webkit/window.cc"
                      :include-path '(".")
                      :system-include-path '("/usr/include/c++/4.4/"
                                             "/usr/include/qt4/"
                                             "/usr/include/qt4/Qt/"
                                             "/usr/include/qt4/QtCore/"
                                             "/usr/include/qt4/QtGui/"
                                             "/usr/include/qt4/QtWebKit/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))


;; -------[CMPH Example]------------------------------------------------------
(ede-cpp-root-project "CMPH Example"
                      :name "CMPH Example"
                      :file "~/workspace/c++/cmph/CMakeLists.txt"
                      :include-path '(".")
                      :system-include-path '("/usr/include/c++/4.4/"
                                             "/opt/ri/include")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))


(setq booksample-project
      (ede-cpp-root-project "booksamples"
                            :file "~/workspace/c++/pthreads/booksamples/CMakeLists.txt"
                            :system-include-path '()
                            :local-variables (list
                                              (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                              )
                            ))
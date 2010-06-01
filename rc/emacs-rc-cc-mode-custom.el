;; -------[RI MAIN project definition]------------------------------------------------------
(ede-cpp-root-project "RI MAIN"
                      :name "RI MAIN Project"
                      :file "/mnt/sda6/alan/workspace/ufmg/master/ri/ri-git/ri_main/CMakeLists.txt"
                      :include-path '("/src")
                      :system-include-path '("/opt/ri/include"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))


;; -------[Zunnit ZExtractor project definition]------------------------------------------------------
(ede-cpp-root-project "zextractor"
                      :name "zextractor"
                      :file "/mnt/sda6/alan/workspace/zunnit/zextractor/CMakeLists.txt"
                      :include-path '("/src")
                      :system-include-path '("/zunnit/zlibs/include"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[Zunnit ZEngine project definition]------------------------------------------------------
(ede-cpp-root-project "zengine"
                      :name "zengine"
                      :file "/mnt/sda6/alan/workspace/zunnit/zengine/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/zunnit/zlibs/include"
                                             "/zunnit/zlibs/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[Zunnit ZFetcher project definition]------------------------------------------------------
(ede-cpp-root-project "zfetcher"
                      :name "zfetcher"
                      :file "/mnt/sda6/alan/workspace/zunnit/zfetcher/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/zunnit/zlibs/include"
                                             "/zunnit/zlibs/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))

;; -------[Zunnit ZContext project definition]------------------------------------------------------
(ede-cpp-root-project "zcontext"
                      :name "zcontext"
                      :file "/mnt/sda6/alan/workspace/zunnit/zcontext/CMakeLists.txt"
                      :include-path '("src")
                      :system-include-path '("/zunnit/zlibs/include"
                                             "/zunnit/zlibs/include/thrift"
                                             "/usr/include/c++/4.4/")
                      :local-variables (list
                                        (cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
                                        ))


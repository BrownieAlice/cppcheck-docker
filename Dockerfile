FROM browniealice/cpp_env
RUN apt update  && apt -y upgrade && apt -y install python-pip && \
    pip install Pygments && rm -r /var/lib/apt/lists/* &&\
    git clone --recursive https://github.com/danmar/cppcheck.git && \
    cd cppcheck && \
    make SRCDIR=build CFGDIR=/usr/share/cppcheck/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" -j5 && \
    mv cppcheck /usr/bin/ && mkdir /usr/share/cppcheck && mv cfg/ /usr/share/cppcheck/ && \
    mv htmlreport/cppcheck-htmlreport /usr/bin/ && \
    cd ../ && rm -r cppcheck

all:table.o table_wrap.o _table.so
 
table.o:table.cpp table.h 
	g++ -fPIC -c table.cpp

table_wrap.o:table.i table.o 
	swig -c++ -python table.i 
	g++ -O2 -fPIC -c table_wrap.cxx -I /home/users/jameswu/localbuild_other_tools/scmtools/usr/include/python2.7

_table.so:table_wrap.o 
	g++ -shared table.o table_wrap.o -o _table.so

clean:
	rm -rf *.o *.so *.cxx *~ *.pyc

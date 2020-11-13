
.PHONY: cpp

cpp: add_person_cpp list_people_cpp

clean:
	rm -f add_person_cpp list_person_cpp
	rm -f protoc_middleman addressbook.pb.cc addressbook.pb.h

protoc_middleman: addressbook.proto
	protoc -I=. --cpp_out=. addressbook.proto
	@touch protoc_middleman

add_person_cpp: add_person.cc protoc_middleman
	pkg-config --cflags protobuf
	c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cc `pkg-config --cflags --libs protobuf`

list_people_cpp: list_people.cc protoc_middleman
	pkg-config --cflags protobuf
	c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cc `pkg-config --cflags --libs protobuf`

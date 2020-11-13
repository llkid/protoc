#include <iostream>
#include <string>
#include "project.pb.h"

int main() 
{
    Account account;
    account.set_id(1000);
    account.set_name("name");
    account.set_password("1234");

    std::string s = account.SerializeAsString();
    if (!s.size()) {
        std::cerr << "error in serialize\n";
    }

    Account unserial;
    if (unserial.ParseFromString(s)) {
        std::cout << unserial.id() << '\n';
        std::cout << unserial.name() << '\n';
        std::cout << unserial.password() << '\n';
    } else {
        std::cerr << "unserialize something error!!!\n";
    }

    return 0;
}
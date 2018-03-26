#include <fstream>
#include <string>
#include <iostream>
#include <sstream>

int main()
{


    std::ifstream file("loglistener.txt");
    std::string line;
    std::string readStr = "READ_NEIGHBOR_LIST";

    while (std::getline(file, line)) // Saco linea por linea del archivo
    {
        if (line.find(readStr) != std::string::npos) //Si la linea contiene la string "READ_NEIGHBOR_LIST"
        {
            std::istringstream ss(line);

            //Variable para guardar los datos que vienen en el archivo
            std::string Time;
            std::string Mote;
            std::string READ_NEIGHBOR_LIST;
            std::string id;
            std::string neighbor;
            std::string avg_seqno_gap;

            //Sacar los todos los valores de la linea que estan separados por espacio
            ss >> Time >> Mote >> READ_NEIGHBOR_LIST >> id >> neighbor >> avg_seqno_gap;
            //Imprimir los valores guardados
            std::cout << id << " " << neighbor << " " << avg_seqno_gap  << " 0" << " 0" << "\n";

        }
    }
}

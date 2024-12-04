from model.interface import Interface
from model.vingador import Vingador
from model.database import Database

def main():
    
   Interface()
    # db = Database()
    # db.connect()

    # query = "select * from heroi"
    # herois = db.select(query)

    # for heroi in herois:
    #     Vingador(*heroi)

    # nome_encontrar = 'Thor'

    # for vingador in Vingador.lista_vingadores:
    #     print(nome_encontrar in vingador.nome_real)
        
if __name__ == '__main__':
    main()

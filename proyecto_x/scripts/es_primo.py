import argparse

parser = argparse.ArgumentParser()

parser.add_argument('numero',type=int)

args = parser.parse_args()

if args.numero < 1:
    print(f'El número {args.numero} no es valido por ser menor que 1')
elif args.numero == 1 or args.numero == 2:
    print(f'{args.numero} es primo')
else:
    primo = True
    for i in range(2,args.numero):
        if args.numero%i == 0:
            primo = False
            print(f'El número {args.numero} se puede escribir como {i}*{args.numero//i}. No es primo.')
            break
    if primo:
        print(f'El número {args.numero} es primo.') #Este script es de orden O(n)

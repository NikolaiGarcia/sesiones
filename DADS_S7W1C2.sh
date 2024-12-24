write_log() {
    date +"%H:%M Creación de $1">>textos/logs.txt
}

mkdir proyecto_x
cd proyecto_x
ls
touch logs.txt
mkdir scripts
mkdir textos
ls
echo ESTE ES UN REGISTRO DE ACTIVIDADES>logs.txt
echo ==================================>>logs.txt
echo Autor: Nikolai Garcia Chkourak>>logs.txt
echo Fecha: 12/12/2024>>logs.txt
echo >>logs.txt
echo Resultados:>>logs.txt
cat logs.txt
wc -m logs.txt
mv logs.txt textos
write_log log.txt
alias conteo_caracteres="wc -m"
conteo_caracteres textos/logs.txt
touch scripts/pares.py
echo "print('2, 4, 6, 8, 10')">scripts/pares.py
write_log pares.py
python3 scripts/pares.py
echo """import numpy as np 
import pandas as pd 

n = 100 
media = 5 
desv = 2 

datos = np.random.normal(size = n, loc = media, scale = desv) 
datos = datos.round(0).astype(int) 

datos_trim = [] 
for i in range(len(datos)): 
  if datos[i] <= abs(media) + 2*desv or datos[i] >= abs(media) - 2*desv: 
    datos_trim.append(datos[i]) 

datos_trim = pd.DataFrame(datos_trim) 
datos_trim.columns = ['Datos'] 
histograma = datos_trim.groupby('Datos').size() 

for i in range(len(histograma)): 
  if histograma.index[i]>=0: 
    s = \"+\" 
  else: 
    s = \"\" 
  print( 
    s, 
    histograma.index[i], 
    ' '*(1+len(str(np.max([np.max(histograma.index), 
                           abs(np.min(histograma.index))]))) - 
                           len(str(abs(histograma.index[i])))), 
    '*'*round(100*histograma.iloc[i]/len(datos_trim)), 
    sep = \"\" 
    )""">scripts/histograma.py
write_log histograma.py
python3 scripts/histograma.py
echo """import numpy as np
import pandas as pd
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('n')
parser.add_argument('media')
parser.add_argument('desv')

args = parser.parse_args()

n = int(args.n)
media = int(args.media)
desv = int(args.desv)

print(f\"n = {n}, media = {media}, desv = {desv}\")

datos = np.random.normal(size=n, loc=media, scale=desv)
datos = datos.round(0).astype(int)

datos_trim = []
for i in range(len(datos)):
    if datos[i] <= abs(media) + 2*desv or datos[i] >= abs(media) - 2*desv:
        datos_trim.append(datos[i])

datos_trim = pd.DataFrame(datos_trim)
datos_trim.columns = ['Datos']
histograma = datos_trim.groupby('Datos').size()

for i in range(len(histograma)):
    if histograma.index[i] >= 0:
        s = \"+\"
    else:
        s = \"\"
    print(
        s,
        histograma.index[i],
        ' '*(1+len(str(np.max([np.max(histograma.index),
                               abs(np.min(histograma.index))]))) -
             len(str(abs(histograma.index[i])))),
        '*'*round(100*histograma.iloc[i]/len(datos_trim)),
        sep=\"\"
    )"""
python3 scripts/histograma.py 200 5 2
write_log modificacion\ de\ histograma.py
echo """import pandas as pd
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('file')
# parser.add_argument('header')
args = parser.parse_args()

file = args.file
# if args.header == 'None':
#    header = None

datos = pd.read_csv(file, header=None)

serie = datos.iloc[:, 0]

n = serie.count()
prom = serie.mean()
med = serie.median()
q1 = serie.quantile(0.25)
q3 = serie.quantile(0.75)
iqr = q3 - q1

resumen = pd.DataFrame({
    'n': n,
    'Promedio': round(prom, 1),
    'Mediana': round(med, 1),
    'Cuartil_1': round(q1, 1),
    'Cuartil_3': round(q3, 1),
    'IQR': round(iqr, 1)
}, index=[''])

print(resumen)"""
python3 res_estadistico.py https://raw.githubusercontent.com/jsaraujott/datos/main/datos.csv
write_log res_estadistico.py
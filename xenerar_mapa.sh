#!/bin/bash
set -x
sudo apt install xml-twig-tools osmctools rename docker.io

wget http://download.openstreetmap.fr/extracts/europe/spain/asturias-latest.osm.pbf
osmconvert asturias-latest.osm.pbf -o=asturies1.osm
rm asturias-latest.osm.pbf

osmfilter asturies1.osm --drop-author --drop-version --drop-tags="source" --drop-tags="maxspeed"  --drop-tags="created_by" -o=asturies2.osm
rm asturies1.osm

mkdir mapa
mv asturies2.osm mapa
cd mapa
xml_split -s 20Mb asturies2.osm
rm asturies2.osm

for fichero in asturies2-??.osm; do ../render.py $fichero > $(basename $fichero).xml ; done
cp -f asturies2-00.osm asturies2-00.osm.xml
rm *.osm
rename 's/\.osm.xml/.osm/' *.xml
xml_merge -o asturies3.osm.xml $(ls *.osm)
rm *.osm
mv asturies3.osm.xml asturies3.osm

sed -i 's/&#39;/’/I' asturies3.osm

sed -i 's/\"Túmulo de /\"Túmulu /I' asturies3.osm
sed -i 's/\"Túmulo /\"Túmulu /I' asturies3.osm
sed -i 's/\"Centro Comercial de /\"Centru Comercial/I' asturies3.osm
sed -i 's/\"Centro Comercial/\"Centru Comercial/I' asturies3.osm
sed -i 's/\"Centro de Transporte de /\"Centru de Tresporte/I' asturies3.osm
sed -i 's/\"Centro de Transporte/\"Centru de Tresporte/I' asturies3.osm
sed -i 's/\"Centro Médico de /\"Centru Médicu/I' asturies3.osm
sed -i 's/\"Centro Médico/\"Centru Médicu/I' asturies3.osm
sed -i 's/\"Centro de Salud de /\"Centru de Salú/I' asturies3.osm
sed -i 's/\"Centro de Salud/\"Centru de Salú/I' asturies3.osm
sed -i 's/\"Acuartelamiento de /\"Acuartelamientu/I' asturies3.osm
sed -i 's/\"Acuartelamiento/\"Acuartelamientu/I' asturies3.osm
sed -i 's/\"Apeadero de /\"Apeaderu/I' asturies3.osm
sed -i 's/\"Apeadero/\"Apeaderu/I' asturies3.osm
sed -i 's/\"Salvamento de /\"Salvamentu/I' asturies3.osm
sed -i 's/\"Salvamento/\"Salvamentu/I' asturies3.osm
sed -i 's/\"Ayuntamiento de /\"Ayuntamientu/I' asturies3.osm
sed -i 's/\"Ayuntamiento/\"Ayuntamientu/I' asturies3.osm
sed -i 's/\"Garaje de /\"Garaxe/I' asturies3.osm
sed -i 's/\"Garaje/\"Garaxe/I' asturies3.osm
sed -i 's/\"Aparcamiento de /\"Aparcamientu/I' asturies3.osm
sed -i 's/\"Aparcamiento/\"Aparcamientu/I' asturies3.osm
sed -i 's/\"Antepuerto de /\"Entepuertu/I' asturies3.osm
sed -i 's/\"Antepuerto/\"Entepuertu/I' asturies3.osm
sed -i 's/\"Campo de fútbol de /\"Campu de fútbol/I' asturies3.osm
sed -i 's/\"Campo de fútbol/\"Campu de fútbol/I' asturies3.osm

sed -i 's/\"Lago de /\"Llagu /I' asturies3.osm
sed -i 's/\"Lago /\"Llagu /I' asturies3.osm
sed -i 's/\"Lagos de /\"Llagos /I' asturies3.osm
sed -i 's/\"Lagos /\"Llagos /I' asturies3.osm
sed -i 's/\"Laguna de /\"Llaguna /I' asturies3.osm
sed -i 's/\"Laguna /\"Llaguna /I' asturies3.osm
sed -i 's/\"Lagunas de /\"Llagunes /I' asturies3.osm
sed -i 's/\"Lagunas /\"Llagunes /I' asturies3.osm
sed -i 's/\"Dunas de /\"Dunes /I' asturies3.osm
sed -i 's/\"Dunas /\"Dunes /I' asturies3.osm
sed -i 's/\"Barrio de /\"Barriu /I' asturies3.osm
sed -i 's/\"Barrio /\"Barriu /I' asturies3.osm
sed -i 's/\"Paseo de /\"Paséu /I' asturies3.osm
sed -i 's/\"Paseo /\"Paséu /I' asturies3.osm
sed -i 's/\"Mercado de /\"Mercáu /I' asturies3.osm
sed -i 's/\"Mercado /\"Mercáu /I' asturies3.osm
sed -i 's/\"Camino de /\"Camín /I' asturies3.osm
sed -i 's/\"Camino /\"Camín /I' asturies3.osm
sed -i 's/\"Hayedo de /\"Fayéu /I' asturies3.osm
sed -i 's/\"Hayedo /\"Fayéu /I' asturies3.osm
sed -i 's/\"Cueto de /\"Cuetu /I' asturies3.osm
sed -i 's/\"Cueto /\"Cuetu /I' asturies3.osm
sed -i 's/\"Calleja de /\"Caleya /I' asturies3.osm
sed -i 's/\"Calleja /\"Caleya /I' asturies3.osm
sed -i 's/\"Callejón de /\"Callexón /I' asturies3.osm
sed -i 's/\"Callejón /\"Callexón /I' asturies3.osm
sed -i 's/\"Instituto de /\"Institutu /I' asturies3.osm
sed -i 's/\"Instituto /\"Institutu /I' asturies3.osm
sed -i 's/\"Recinto de /\"Recintu /I' asturies3.osm
sed -i 's/\"Recinto /\"Recintu /I' asturies3.osm
sed -i 's/\"Aeródromo de /\"Aeródromu /I' asturies3.osm
sed -i 's/\"Aeródromo /\"Aeródromu /I' asturies3.osm
sed -i 's/\"Distrito de /\"Distritu /I' asturies3.osm
sed -i 's/\"Distrito /\"Distritu /I' asturies3.osm
sed -i 's/\"Acuario de /\"Acuariu /I' asturies3.osm
sed -i 's/\"Acuario /\"Acuariu /I' asturies3.osm
sed -i 's/\"Archivo de /\"Archivu /I' asturies3.osm
sed -i 's/\"Archivo /\"Archivu /I' asturies3.osm
sed -i 's/\"Escuela de teatro de /\"Escuela de teatru/I' asturies3.osm
sed -i 's/\"Escuela de teatro/\"Escuela de teatru/I' asturies3.osm
sed -i 's/\"Museo de /\"Muséu /I' asturies3.osm
sed -i 's/\"Museo /\"Muséu /I' asturies3.osm
sed -i 's/\"Oficina pública de empleo de /\"Oficina pública d’emplegu /I' asturies3.osm
sed -i 's/\"Oficina pública de empleo/\"Oficina pública d’emplegu /I' asturies3.osm
sed -i 's/\"Enlace de /\"Enllaz /I' asturies3.osm
sed -i 's/\"Enlace /\"Enllaz /I' asturies3.osm
sed -i 's/\"Polígono de /\"Polígonu /I' asturies3.osm
sed -i 's/\"Polígono /\"Polígonu /I' asturies3.osm
sed -i 's/\"Aulas de /\"Aules /I' asturies3.osm
sed -i 's/\"Aulas /\"Aules /I' asturies3.osm
sed -i 's/\"Consultorio de /\"Consultoriu /I' asturies3.osm
sed -i 's/\"Consultorio /\"Consultoriu /I' asturies3.osm
sed -i 's/\"Colegio de /\"Colexu /I' asturies3.osm
sed -i 's/\"Colegio /\"Colexu /I' asturies3.osm
sed -i 's/\"Polideportivo de /\"Polideportivu /I' asturies3.osm
sed -i 's/\"Polideportivo /\"Polideportivu /I' asturies3.osm
sed -i 's/\"Polideportivo\"/\"Polideportivu\"/I' asturies3.osm
sed -i 's/\"Monumento de /\"Monumentu /I' asturies3.osm
sed -i 's/\"Monumento /\"Monumentu /I' asturies3.osm
sed -i 's/\"Covadonga /\"Cuadonga /I' asturies3.osm
sed -i 's/\"Jovellanos /\"Xovellanos /I' asturies3.osm
sed -i 's/\"Iglesia de /\"Ilesia /I' asturies3.osm
sed -i 's/\"Iglesia /\"Ilesia /I' asturies3.osm
sed -i 's/\"Cementerio de /\"Cementeriu /I' asturies3.osm
sed -i 's/\"Cementerio /\"Cementeriu /I' asturies3.osm
sed -i 's/\"Santuario de /\"Santuariu /I' asturies3.osm
sed -i 's/\"Santuario /\"Santuariu /I' asturies3.osm
sed -i 's/\"Matadero de /\"Mataderu /I' asturies3.osm
sed -i 's/\"Matadero /\"Mataderu /I' asturies3.osm
sed -i 's/\"Playa de /\"Sablera /I' asturies3.osm
sed -i 's/\"Playa /\"Sablera /I' asturies3.osm
sed -i 's/\"Praya de /\"Sablera /I' asturies3.osm
sed -i 's/\"Praya /\"Sablera /I' asturies3.osm
sed -i 's/\"Pico de /\"Picu /I' asturies3.osm
sed -i 's/\"Pico /\"Picu /I' asturies3.osm
sed -i 's/\"Río de /\"Ríu /I' asturies3.osm
sed -i 's/\"Río /\"Ríu /I' asturies3.osm
sed -i 's/\"Rio /\"Ríu /I' asturies3.osm
sed -i 's/\"Colegiata de /\"Colexata /I' asturies3.osm
sed -i 's/\"Colegiata /\"Colexata /I' asturies3.osm
sed -i 's/\"Auditorio de /\"Auditoriu /I' asturies3.osm
sed -i 's/\"Auditorio /\"Auditoriu /I' asturies3.osm
sed -i 's/\"Puerto de /\"Puertu /I' asturies3.osm
sed -i 's/\"Puerto /\"Puertu /I' asturies3.osm
sed -i 's/\"Escultura Homenaje de /\"Escultura Homenaxe /I' asturies3.osm
sed -i 's/\"Escultura Homenaje /\"Escultura Homenaxe /I' asturies3.osm
sed -i 's/\"Fuente de /\"Fonte /I' asturies3.osm
sed -i 's/\"Fuente /\"Fonte /I' asturies3.osm
sed -i 's/\"Jardín de /\"Xardín /I' asturies3.osm
sed -i 's/\"Jardín /\"Xardín /I' asturies3.osm
sed -i 's/\"Jardines de /\"Xardinos /I' asturies3.osm
sed -i 's/\"Jardines /\"Xardinos /I' asturies3.osm
sed -i 's/\"Ambulatorio de /\"Ambulatoriu /I' asturies3.osm
sed -i 's/\"Ambulatorio /\"Ambulatoriu /I' asturies3.osm
sed -i 's/\"Faro de /\"Faru /I' asturies3.osm
sed -i 's/\"Faro /\"Faru /I' asturies3.osm
sed -i 's/\"Palacio de /\"Palaciu /I' asturies3.osm
sed -i 's/\"Palacio /\"Palaciu /I' asturies3.osm
sed -i 's/\"Pozo de /\"Pozu /I' asturies3.osm
sed -i 's/\"Pozo /\"Pozu /I' asturies3.osm
sed -i 's/\"Cabo de /\"Cabu /I' asturies3.osm
sed -i 's/\"Cabo /\"Cabu /I' asturies3.osm
sed -i 's/\"Torreón de /\"Torrexón /I' asturies3.osm
sed -i 's/\"Torreón /\"Torrexón /I' asturies3.osm
sed -i 's/\"Arroyo de /\"Arroyu /I' asturies3.osm
sed -i 's/\"Arroyo /\"Arroyu /I' asturies3.osm
sed -i 's/\"Convento de /\"Conventu /I' asturies3.osm
sed -i 's/\"Convento /\"Conventu /I' asturies3.osm
sed -i 's/\"Isla de /\"Islla /I' asturies3.osm
sed -i 's/\"Isla /\"Islla /I' asturies3.osm
sed -i 's/\"Castro de /\"Castru /I' asturies3.osm
sed -i 's/\"Castro /\"Castru /I' asturies3.osm
sed -i 's/\"Tanatorio de /\"Tanatoriu /I' asturies3.osm
sed -i 's/\"Tanatorio /\"Tanatoriu /I' asturies3.osm
sed -i 's/\"Gimnasio de /\"Ximnasiu /I' asturies3.osm
sed -i 's/\"Gimnasio /\"Ximnasiu /I' asturies3.osm
sed -i 's/\"Viajes de /\"Viaxes /I' asturies3.osm
sed -i 's/\"Viajes /\"Viaxes /I' asturies3.osm
sed -i 's/\"Libreria de /\"Llibreria /I' asturies3.osm
sed -i 's/\"Libreria /\"Llibreria /I' asturies3.osm
sed -i 's/\"Kiosco de /\"Kioscu /I' asturies3.osm
sed -i 's/\"Kiosco /\"Kioscu /I' asturies3.osm
sed -i 's/\"Estadio de atletismo de /\"Estadiu d’atletismu /I' asturies3.osm
sed -i 's/\"Estadio de atletismo /\"Estadiu d’atletismu /I' asturies3.osm
sed -i 's/\"Estadio de El Molinón/\"Estadiu d’El Molinón/I' asturies3.osm
sed -i 's/\"Estadio de /\"Estadiu /I' asturies3.osm
sed -i 's/\"Estadio /\"Estadiu /I' asturies3.osm
sed -i 's/\"Grupo de /\"Grupu /I' asturies3.osm
sed -i 's/\"Grupo /\"Grupu /I' asturies3.osm
sed -i 's/\"Velódromo de /\"Velódromu /I' asturies3.osm
sed -i 's/\"Velódromo /\"Velódromu /I' asturies3.osm
sed -i 's/\"Hípico de /\"Hípicu /I' asturies3.osm
sed -i 's/\"Hípico /\"Hípicu /I' asturies3.osm
sed -i 's/\"Banco de /\"Bancu /I' asturies3.osm
sed -i 's/\"Banco /\"Bancu /I' asturies3.osm
sed -i 's/\"Supermercado de /\"Supermercáu /I' asturies3.osm
sed -i 's/\"Supermercado /\"Supermercáu /I' asturies3.osm
sed -i 's/\"Centro de Arte de /\"Centru d’Arte/I' asturies3.osm
sed -i 's/\"Centro de Arte/\"Centru d’Arte/I' asturies3.osm
sed -i 's/\"Cajero de /\"Caxeru /I' asturies3.osm
sed -i 's/\"Cajero /\"Caxeru /I' asturies3.osm
sed -i 's/\"Casino de /\"Casinu /I' asturies3.osm
sed -i 's/\"Casino /\"Casinu /I' asturies3.osm
sed -i 's/\"Punto limpio de /\"Puntu llimpiu /I' asturies3.osm
sed -i 's/\"Punto limpio /\"Puntu llimpiu /I' asturies3.osm
sed -i 's/\"Reciclaje de /\"Reciclaxe/I' asturies3.osm
sed -i 's/\"Reciclaje/\"Reciclaxe/I' asturies3.osm
sed -i 's/\"Complejo deportivo de /\"Centru deportivu /I' asturies3.osm
sed -i 's/\"Complejo deportivo /\"Centru deportivu /I' asturies3.osm
sed -i 's/\"Calle /\"Cai /I' asturies3.osm
sed -i 's/\"Teatro de /\"Teatru /I' asturies3.osm
sed -i 's/\"Teatro /\"Teatru /I' asturies3.osm
sed -i 's/\"Veterinario de /\"Veterinariu /I' asturies3.osm
sed -i 's/\"Veterinario /\"Veterinariu /I' asturies3.osm
sed -i 's/\"Paradas de /\"Paraes /I' asturies3.osm
sed -i 's/\"Paradas /\"Paraes /I' asturies3.osm
sed -i 's/\"Museo de /\"Muséu /I' asturies3.osm
sed -i 's/\"Museo /\"Muséu /I' asturies3.osm
sed -i 's/\"Edificio de /\"Edificiu /I' asturies3.osm
sed -i 's/\"Edificio /\"Edificiu /I' asturies3.osm
sed -i 's/\"Centro de /\"Centru /I' asturies3.osm
sed -i 's/\"Centro /\"Centru /I' asturies3.osm
sed -i 's/\"Piscinas de /\"Piscines /I' asturies3.osm
sed -i 's/\"Piscinas /\"Piscines /I' asturies3.osm

osmconvert asturies3.osm -o=asturies_final.pbf
rm asturies3.osm

sudo su -
# docker kill $(docker ps -q) ; docker rm $(docker ps -a -q) ; docker rmi $(docker images -q)
ps -ef | grep 'docker' | grep -v grep | awk '{print $2}' | xargs -r kill -9

docker pull pelias/openstreetmap
docker volume create openstreetmap-data
docker run -v /absolute/path/to/luxembourg.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/12/main overv/openstreetmap-tile-server import
docker run -p 80:80 -v openstreetmap-data:/var/lib/postgresql/12/main -d overv/openstreetmap-tile-server run
# Comprobar sale tile visitando: http://localhost:80/tile/13/3963/2995.png

echo "Abrir JTileDownloader con ficheros *.xml"
echo "Descargar"
echo "chmod 755 -R *"
echo "Xubir a sirvidor"



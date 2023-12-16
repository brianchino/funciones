 import Data.List
 {-
---------------------------------------------------------------------
CREAR LISTAS
iterate (*2) 1
[1,2,4,8,16....

repeat 'a'
"aaaaaaaaaaa...."

 replicate 3 "hola"
 ["hola","hola","hola"]

cycle [1,2,3]
[1,2,3,1,2,3,1,2,3,1,2,3.....]
--------------------------------------------------------------------------------
subtract 3 2     en vez de flip (-) 
-1
subtract 2 3
1
----------------------------------------------------------------
TIPO DE DATOS PROPIOS
import Text.Show.Functions
data Investigador = Investigador{
    nombre      :: String,
    experiencia :: Int, 
    companiero  :: Pokemon,
    mochila     :: [Item],
    pokemons    :: [Pokemon]
} deriving (Show)

data Rango = Cielo | Estrella | Constelacion | Galaxia deriving(Show,Eq)

data Pokemon = Pokemon {
    mote        :: String,
    descripcion :: String,
    nivel       :: Int,
    puntosBase  :: Int
} deriving (Show)
--------------------------------------------------------------------
EJEMPLO DE SUSTRAER UNA FUNCION GENERAL PARA VARIOS PUNTOS

nombreInvestigadoresConMasDe3Alfa :: Expedicion -> [Investigador] -> [String]
nombreInvestigadoresConMasDe3Alfa = reporte nombre ((>3) . length . filter esAlfa . pokemons)  


realizarExpedicion :: Expedicion -> Investigador -> Investigador
realizarExpedicion expedicion investigador = foldr ($) investigador expedicion 

experienciaInvestigadoresRangoGalaxia :: Expedicion -> [Investigador] -> [Int]
experienciaInvestigadoresRangoGalaxia = reporte experiencia ((== Galaxia) . rangoDe) 

FUNCION GENERAL
reporte :: (Investigador -> a) ->  (Investigador -> Bool) -> Expedicion -> [Investigador] -> [a] 
reporte rasgo condicion expedicion = map rasgo . filter condicion . map (realizarExpedicion expedicion) 

companierosInvestigadoresAlMenosNivel10 :: Expedicion -> [Investigador] -> [Pokemon]
companierosInvestigadoresAlMenosNivel10 = reporte companiero ((>=10) . nivel . companiero) 

ultimosPokemonsInvestigadoresNivelPar :: Expedicion -> [Investigador] -> [[Pokemon]]
ultimosPokemonsInvestigadoresNivelPar = reporte (take 3 . reverse . pokemons) (all (even . nivel) . pokemons) 
-------------------------------------------------------------------------------------------------
WARIO CON LLAVES FRANCESAS INFINITAS CON PRECIO SUBIENDO DE UNO A UNO
wario :: Plomero
wario = Plomero "Wario" (map (Herramienta "llave francesa" Hierro) [1..]) [] 0.5
-----------------------------------------------------------------------------------
USAR PATTERN MATCHING DE BUENA FORMA
esBuena :: Herramienta -> Bool
esBuena (Herramienta _ Hierro precio)         = precio > 10000
esBuena (Herramienta "martillo" material _ )  = elem material [Madera,Goma]
esBuena _                                     = False
-----------------------------------------------------------------------------
-- Funciones útiles
between n m x = elem x [n .. m]

maximoSegun f = foldl1 (mayorSegun f)

mayorSegun f a b
  | f a > f b = a
  | otherwise = b
 ---------------------------------------------------------------------------------- 
obstaculosSeguidos [] tiro = 0 
obstaculosSeguidos (x:xs) tiro  
    | puedeSuperar x tiro = 1 + obstaculosSeguidos xs (x tiro)
    | otherwise           = 0
    -------------------------------------------------------------------------------
    
deltaSegun :: (a -> Int) -> a -> a -> Int
deltaSegun f algo1 algo2 = f algo1 - f algo2
-----------------------------------------------------------------------------
USAR GIT

git config --global user.name "brian chino" 23132123
git config --global user.email bchinoyanarico@frba.utn.edu.ar
 
cd Desktop 
git clone
git commit -m "hola"
git add .
git pull
git push
--------------------------------------------------------------------------------
lazy evaluation
 -}

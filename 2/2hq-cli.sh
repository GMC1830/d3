#!/bin/bash

# Создание конфигурации sudoers для группы hq
cat <<'EOF' > /etc/sudoers.d/hq
%hq ALL=(ALL) NOPASSWD:/bin/cat, /bin/grep, /usr/bin/id
EOF

# Установка прав на файл sudoers
chmod 0400 /etc/sudoers.d/hq

# Проверка синтаксиса sudoers
visudo -c

# Переход к пользователю user1.hq
su - user1.hq << 'EOF'
sudo id
sudo ls /root
exit
EOF

# Создание пользователей и их домашних каталогов
bash << 'EOF'
USERS_TO_CREATE='
lucian.buck
jacob.schneider
britanney.smith
andrew.gillespie
kyra.odom
josephine.vinson
emmanuel.blankenship
wesley.gonzales
jescie.knox
abbot.blackwell
joshua.buchanan
angela.wilkinson
aspen.terrell
camille.roth
emily.schroeder
francesca.rowe
althea.rodgers
lisandra.rutledge
amber.roth
hayley.padilla
nissim.webb
charity.pacheco
gloria.nicholson
noah.house
alden.wright
alexander.valenzuela
rigel.velez
cyrus.talley
berk.vargas
jenna.myers
cyrus.gomez
nissim.blanchard
reuben.houston
lucas.gallagher
lamar.sweeney
eden.sawyer
mark.duke
raymond.hodges
eden.goff
margaret.hardy
tyrone.hewitt
brock.workman
gabriel.mcdowell
barbara.duncan
gray.foley
nadine.griffin
kevin.golden
hyatt.singleton
stone.stout
arthur.tran
dennis.pace
wesley.lawrence
quinn.park
oliver.castaneda
belle.small
raphael.gaines
hu.pena
hoyt.flynn
ralph.hawkins
brett.juarez
dylan.wheeler
barry.hopkins
libby.mcclure
kylee.orr
nathaniel.mullins
ignatius.watts
fay.bush
madeline.bonner
james.macias
alika.barron
ray.delacruz
keefe.becker
genevieve.vega
kaitlin.branch
carolyn.parsons
aubrey.dale
stephen.castro
tiger.copeland
giacomo.dunlap
althea.battle
caldwell.nielsen
maryam.guzman
zachary.dejesus
uriah.spencer
yolanda.ball
quinlan.velasquez
devin.price
cameron.evans
micah.ware
aidan.byrd
wesley.cain
rhea.bolton
hilel.dalton
maxine.carson
coby.gould
mark.blanchard
samantha.wilkins
cassidy.rivers
mira.woodard
helen.nichols
brody.evans
doris.williamson
rahim.grant
raja.dorsey
dean.hess
jason.cole
hop.fletcher
charity.clay
adam.kramer
diana.nelson
leroy.cameron
deirdre.stark
brielle.mccarty
dean.burton
lois.howell
camden.pickett
sophia.rivera
maggy.craig
ignatius.gilliam
rama.duffy
anastasia.silva
bruno.trujillo
risa.wiggins
angelica.mcgee
irma.mcclure
gemma.williams
florence.reynolds
asher.buckley
mary.singleton
cruz.payne
ramona.frye
maxwell.wilder
meredith.arnold
joseph.wise
lucas.holder
maite.griffin
mercedes.buckner
dale.lindsay
kasper.yates
pearl.davidson
drew.mcintyre
oleg.cannon
drew.trevino
kelsie.horton
mark.sutton
vladimir.rivers
armand.greene
malik.larsen
vivian.malone
anjolie.baldwin
armand.glenn
boris.morgan
liberty.mccarthy
gannon.santiago
simon.stevenson
raphael.bird
vivien.mcguire
fleur.wolfe
phoebe.koch
aladdin.hale
gray.randolph
orla.burton
knox.lopez
kay.tillman
hilary.jimenez
september.carroll
brynne.duffy
macey.waters
colt.wooten
wyatt.fleming
brianna.griffin
mia.mercer
karly.peterson
geoffrey.murray
summer.cooper
noelle.burke
nolan.barry
shellie.ruiz
wynne.ashley
comp.cloud storage
dean.hines
nelle.alford
amery.boyer
aiko.lindsey
roary.conley
patricia.lucas
alika.whitley
ashton.shields
maxwell.leblanc
daryl.ward
chloe.simon
justin.cash
chelsea.monroe
baker.christian
darryl.cherry
jermaine.simmons
hamish.gross
sheila.burt
shaine.simmons
isaac.christian
deirdre.bernard
herman.wright
lois.bruce
emi.mcmillan
timothy.reed
hayes.stokes
dorothy.cervantes
addison.wall
nash.hood
joshua.henderson
amal.clements
malachi.alexander
rinah.deleon
ebony.saunders
shafira.cox
rachel.blackburn
fay.gallegos
conan.odonnell
bernard.waller
britanney.campos
james.cummings
iliana.moreno
barry.schultz
kaye.haynes
colleen.butler
ulla.vaughan
rudyard.house
molly.gill
olivia.rasmussen
noah.buck
hasad.ashley
lydia.sears
rae.wiley
ifeoma.gomez
kaye.lott
hanae.morton
september.dotson
dennis.craig
keith.grant
claire.flores
tanisha.luna
bell.wiley
robert.blevins
nomlanga.randall
slade.rowland
xantha.dillard
william.dalton
brielle.floyd
sawyer.burns
hyatt.rosales
hunter.hopkins
cally.gordon
quinn.flynn
craig.gilbert
iris.gonzalez
adria.logan
dean.roy
kendall.ellison
beverly.carson
jessamine.hodge
emmanuel.bond
vielka.nelson
lucius.mendez
leigh.torres
alexa.bradshaw
malcolm.gilliam
mason.cross
illiana.joyner
brett.carr
carl.cohen
clementine.owen
ahmed.montgomery
flynn.ruiz
martina.watkins
colby.wilcox
reuben.sanford
riley.hansen
trevor.gonzalez
grace.davidson
zenia.berg
imelda.harmon
armand.knowles
rigel.tyson
isabelle.newman
drew.lott
octavia.brady
moana.macdonald
evelyn.calderon
donovan.griffith
alan.todd
tanisha.wiggins
stuart.york
amir.frazier
caesar.wagner
quamar.harrington
anastasia.faulkner
stephen.willis
prescott.gay
ashely.cunningham
karly.curry
'
BASE_HOMEDIR="/home/AU-TEAM.IRPO"
DOMAIN_REALM="au-team.irpo"
SKEL_DIR="/etc/skel"

# Создание базового каталога для пользователей
mkdir -p "${BASE_HOMEDIR}" && chmod 755 "${BASE_HOMEDIR}" || { echo "Ошибка создания базового каталога"; exit 1; }

echo ">>> Создание дополнительных домашних каталогов..."
echo "${USERS_TO_CREATE}" | while IFS= read -r user_name_mixed_case; do
  user_name_mixed_case=$(echo "${user_name_mixed_case}" | tr -d '\r')
  [[ -z "${user_name_mixed_case// }" ]] && continue
  
  lower_user_name=$(echo "${user_name_mixed_case}" | tr '[:upper:]' '[:lower:]')
  full_user_name="${user_name_mixed_case}@${DOMAIN_REALM}"
  user_home_dir="${BASE_HOMEDIR}/${lower_user_name}"
  
  echo -n "Обработка ${full_user_name}... "
  
  user_uid=$(id -u "${full_user_name}" 2>/dev/null)
  user_gid=$(id -g "${full_user_name}" 2>/dev/null)
  
  if [ -n "$user_uid" ] && [ -n "$user_gid" ]; then
    if [ ! -d "${user_home_dir}" ]; then
        install -d -o "${user_uid}" -g "${user_gid}" -m 700 "${user_home_dir}" || { echo "Ошибка install."; continue; }
        
        if [ $? -eq 0 ]; then # Проверяем код возврата install
            cp -aT "${SKEL_DIR}/" "${user_home_dir}/" && chown -R "${user_uid}:${user_gid}" "${user_home_dir}" && echo "Готово." || echo "Ошибка копирования/прав."
        fi
    else
        echo "Каталог уже существует."
    fi
  else
    echo "Ошибка: Не удалось получить UID/GID для '${full_user_name}'."
  fi
done

echo "<<< Создание дополнительных домашних каталогов завершено."
exit 0
EOF

# Настройка NFS монтирования 
mkdir /mnt/nfs

cat <<EOF >> /etc/fstab
192.168.1.10:/raid5/nfs /mnt/nfs nfs intr,soft,_netdev,x-systemd.automount 0 0
EOF

systemctl daemon-reload

# Монтирование всех файловых систем из fstab 
mount -a

# Проверка содержимого смонтированного NFS 
ls /mnt/nfs

VERSION=v6.5.1
PLATFORM=other

#Please run script in docker folder
cd ..
printf "\nAssembling java jar and lib into traccar TARGET folder...\n"
./gradlew assemble
cd traccar-web
printf "\nBuilding web assets into traccar-web BUILD folder...\n"
npm run build
cd ../setup
printf "\nArchiving assets for dockerized application into traccar DOCKER folder...\n"
./package.sh $VERSION $PLATFORM && mv traccar-$PLATFORM-$VERSION.zip ../docker/traccar-$PLATFORM-$VERSION.zip
read -p "Press any key to continue..." -n1 -s
ok "Done"
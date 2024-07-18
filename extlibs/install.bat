
:: ==INSTALL DAWN== ::
cd dawn-main
cmake -S . -B out/Debug -DDAWN_FETCH_DEPENDENCIES=ON -DDAWN_ENABLE_INSTALL=ON -DCMAKE_BUILD_TYPE=Debug
cmake --build out/Debug
cmake --install out/Debug --config Debug
cd ..

pause
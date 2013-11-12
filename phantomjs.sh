echo "************************************************************"
echo "Installing phantomjs - this may take a while (20+ min)"
echo "************************************************************"

git clone git://github.com/ariya/phantomjs.git
cd phantomjs
git checkout 1.9
sudo ./build.sh --confirm
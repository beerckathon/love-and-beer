heroku buildpacks:set https://github.com/heroku/heroku-buildpack-multi
heroku config:add LD_LIBRARY_PATH=/app/.linuxbrew/lib
heroku config:set MECAB_PATH=/app/.linuxbrew/lib/libmecab.so
git push heroku master
heroku run rake db:migrate
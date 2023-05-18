cp ../languages_yml/run.py run.py
chmod +x run.py
cp ../languages_yml/.codeclimate.yml .codeclimate.yml
chmod +x .codeclimate.yml
docker run -t --rm -v "$(pwd):/repo" crazymax/linguist:latest --json > languages_detect.json
python run.py
docker run \
  --interactive --tty --rm \
  --env CODECLIMATE_CODE="$PWD" \
  --volume "$PWD":/code \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /tmp/cc:/tmp/cc \
  codeclimate/codeclimate analyze -f html > codeclimate.html

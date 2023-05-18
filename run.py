import json
import subprocess

with open('languages_detect.json') as json_file:
	data = json.load(json_file)
languages_detect = data.keys()

with open('../languages_yml/languages_support.json') as json_file2:
	data2 = json.load(json_file2)

languages_support =  data2.keys()

for language in languages_detect:
	if language in languages_support:
		# subprocess.run(["cat", "../languages_yml/.codeclimate.yml", "../languages_yml/"+data2[language], ">", ".codeclimate.yml"], shell=True)
		subprocess.call("cat ../languages_yml/"+data2[language]+" >> .codeclimate.yml", shell=True)
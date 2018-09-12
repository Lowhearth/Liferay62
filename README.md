## Starting Liferay 6.2.5 ga 6 at localhost:6262
Create a folder with the Dockerfile from this repository.
Execute the following commands inside the folder:

* docker pull lowhearth/liferay62.
* docker run -d --name liferay62container -p 6262:8080 liferay62:latest .

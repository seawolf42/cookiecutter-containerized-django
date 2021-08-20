PROJECT ?= cookiecutter-containerized-django

.PHONY: test
test:
	cookiecutter .

.PHONY: cleanup
cleanup:
	rm -rf hammer
	# do docker cleanup steps

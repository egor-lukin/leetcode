build:
	docker build -t leetcode:latest .

run:
	docker run leetcode:latest sh -c "ruby test"
	docker run leetcode:latest sh -c "ruby test"
    # docker run -v $(pwd):/app leetcode:latest sh -c "ruby src/medium/5/source.rb "

bash:
	docker run -it -v $(pwd):/app leetcode:latest bash

run:
	@processing-java --sketch=SudokuSolver --run

build:
	@processing-java --sketch=SudokuSolver --output=build --export

install: build
	@mkdir -p /usr/share/SudokuSolver
	@cp -r build/* /usr/share/SudokuSolver
	@chmod 755 /usr/share/SudokuSolver -R
	@printf "#!/bin/bash\ncd /usr/share/SudokuSolver && ./SudokuSolver\n" > /usr/bin/SudokuSolver
	@chmod 755 /usr/bin/SudokuSolver

uninstall:
	@rm -fr /usr/share/SudokuSolver
	@rm /usr/bin/SudokuSolver

clean:
	@rm -fr build

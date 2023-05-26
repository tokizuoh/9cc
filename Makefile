ssh:
	./ssh.sh -x

run:
	swift 9cc.swift

test:
	./test.sh

clean:
	rm -f *.o *~ tmp*

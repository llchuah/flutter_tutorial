import 'dart:io';

void main() {
	stdout.writeln('Greet somebody');
	String? input = stdin.readLineSync();
	helloDart(input);
}

void helloDart(String? name) {
	print('Hello, $name');
}
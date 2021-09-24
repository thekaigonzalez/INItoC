import iconf; // Import the IConf API
import std.stdio;
import std.file;

/// Prints the usage
void usage() {
	writeln("usage: itc [-help] FILEIN FILEOUT ...");
}

/// Handles the infile "inf" and prints the outfile "of"
int handle_file(string inf, string of) {
	File oft =File(of, "a");
	INIFile f = new INIFile(inf);
	auto data = f.parse();
	TypeMeter tym = new TypeMeter(data);

	foreach (string k; data.byKey()) {
		if (tym.isint(k) != -1) {
			oft.writeln("int "~k~" = "~data[k]~";");
		} else if ( data[k] == "yes" || data[k] == "no" ) {

			oft.writeln("bool "~k~" = "~(data[k] == "no") ? "bool "~k~" = true;" : "bool "~k~" = false;" ~";");
		} else if ( tym.isfloat(k) != -1 && tym.isint(k) == -1) {
			oft.writeln("float "~k~" = "~data[k]~";");
		} else {
			oft.writeln("const char* "~k~" = \""~data[k]~"\";");
		}
	}
		
	return 0;
}

int main(string[] args) {
	string outfile = "a.h";
	string infile = "none";
	if (args.length == 1) { /* No arguments supplied (./itc) */
		usage();
		return 2;
	}
	if (args[1] == "-help") {
		usage();
		return 0;
		
	}
	else {
		infile = args[1];
		outfile = args[2];
	}
	if (!infile.exists()) {
		writeln("fatal: file not found, '"~infile~"'");
		return 2;
	}
	if (handle_file(infile, outfile) == -1) {
		return 2;
	} else {
		return 0;
	}
	return 0;
}

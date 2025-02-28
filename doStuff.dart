import 'dart:io';

void main() {
  Uri here = Uri.base.resolveUri(Platform.script).resolve(".");
  print("Will work in ${here}");

  Directory pkg = Directory.fromUri(here.resolve("pkg/"));
  pkg.createSync();
  Directory tmp = Directory.fromUri(here.resolve("tmp/"));
  if (!tmp.existsSync()) {
    tmp.createSync();

    // Checkout at the specific revision.
    ProcessResult processResult = Process.runSync(
        "git",
        [
          "clone",
          "--single-branch",
          "--depth=1",
          "https://dart.googlesource.com/sdk/",
          "tmp"
        ],
        workingDirectory: here.toFilePath());
    if (processResult.exitCode != 0) {
      throw "Failed checking out dart:\n"
          "stderr: ${processResult.stderr}\n"
          "stdout: ${processResult.stdout}";
    }
  } else {
    print("Dir 'tmp' already exists, will assume dart has been checked out "
        " and will update instead.");

    ProcessResult processResult = Process.runSync(
        "git",
        [
          "pull",
        ],
        workingDirectory: tmp.path);
    if (processResult.exitCode != 0) {
      throw "Failed to update dart:\n"
          "stderr: ${processResult.stderr}\n"
          "stdout: ${processResult.stdout}";
    }
  }

  
}

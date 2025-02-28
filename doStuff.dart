import 'dart:io';

const String dartPath = "tmp";

void main() {
  Uri here = Uri.base.resolveUri(Platform.script).resolve(".");
  print("Will work in ${here}");

  Directory pkg = Directory.fromUri(here.resolve("pkg/"));
  if (pkg.existsSync()) {
    pkg.deleteSync(recursive: true);
  }
  pkg.createSync();

  // Checkout everything needed.
  print("Checkout out...");
  gitCheckout(here, dartPath, "https://dart.googlesource.com/sdk/");
  gitCheckout(here, "$dartPath/core", "https://dart.googlesource.com/core/");
  gitCheckout(
      here, "$dartPath/toolsPkg", "https://dart.googlesource.com/tools/");
  gitCheckout(here, "$dartPath/http", "https://dart.googlesource.com/http/");
  gitCheckout(here, "$dartPath/leak_tracker",
      "https://dart.googlesource.com/leak_tracker/");
  gitCheckout(here, "$dartPath/dart_style",
      "https://dart.googlesource.com/dart_style/");
  gitCheckout(here, "$dartPath/web", "https://dart.googlesource.com/web/");

  // Copy everything over and create pubspecs.
  print("Copying data...");

  Directory.fromUri(here.resolve("tmp/pkg/analysis_server/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/analysis_server/lib")));
  Directory.fromUri(here.resolve("tmp/pkg/analysis_server/bin"))
      .copyTo(Directory.fromUri(here.resolve("pkg/analysis_server/bin")));
  writePubspec(here, "analysis_server", "^3.7.0");

  Directory.fromUri(
          here.resolve("tmp/third_party/pkg/language_server_protocol/lib"))
      .copyTo(
          Directory.fromUri(here.resolve("pkg/language_server_protocol/lib")));
  writePubspec(here, "language_server_protocol", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/core/pkgs/collection/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/collection/lib")));
  writePubspec(here, "collection", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/analyzer_plugin/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/analyzer_plugin/lib")));
  writePubspec(here, "analyzer_plugin", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/analysis_server_plugin/lib")).copyTo(
      Directory.fromUri(here.resolve("pkg/analysis_server_plugin/lib")));
  writePubspec(here, "analysis_server_plugin", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/analyzer/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/analyzer/lib")));
  writePubspec(here, "analyzer", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/meta/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/meta/lib")));
  writePubspec(here, "meta", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/_fe_analyzer_shared/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/_fe_analyzer_shared/lib")));
  writePubspec(here, "_fe_analyzer_shared", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/pub_semver/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/pub_semver/lib")));
  writePubspec(here, "pub_semver", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/yaml/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/yaml/lib")));
  writePubspec(here, "yaml", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/yaml_edit/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/yaml_edit/lib")));
  writePubspec(here, "yaml_edit", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/source_span/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/source_span/lib")));
  writePubspec(here, "source_span", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/core/pkgs/path/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/path/lib")));
  writePubspec(here, "path", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/unified_analytics/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/unified_analytics/lib")));
  writePubspec(here, "unified_analytics", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/glob/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/glob/lib")));
  writePubspec(here, "glob", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/watcher/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/watcher/lib")));
  writePubspec(here, "watcher", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/http/pkgs/http/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/http/lib")));
  writePubspec(here, "http", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/linter/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/linter/lib")));
  writePubspec(here, "linter", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/file/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/file/lib")));
  writePubspec(here, "file", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/leak_tracker/pkgs/memory_usage/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/memory_usage/lib")));
  writePubspec(here, "memory_usage", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/dart_style/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/dart_style/lib")));
  writePubspec(here, "dart_style", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/telemetry/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/telemetry/lib")));
  writePubspec(here, "telemetry", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/core/pkgs/convert/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/convert/lib")));
  writePubspec(here, "convert", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/core/pkgs/crypto/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/crypto/lib")));
  writePubspec(here, "crypto", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/core/pkgs/args/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/args/lib")));
  writePubspec(here, "args", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/stream_channel/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/stream_channel/lib")));
  writePubspec(here, "stream_channel", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/dtd/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/dtd/lib")));
  writePubspec(here, "dtd", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/json_rpc_2/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/json_rpc_2/lib")));
  writePubspec(here, "json_rpc_2", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/pkg/vm_service/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/vm_service/lib")));
  writePubspec(here, "vm_service", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/package_config/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/package_config/lib")));
  writePubspec(here, "package_config", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/core/pkgs/async/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/async/lib")));
  writePubspec(here, "async", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/core/pkgs/typed_data/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/typed_data/lib")));
  writePubspec(here, "typed_data", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/http/pkgs/web_socket_channel/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/web_socket_channel/lib")));
  writePubspec(here, "web_socket_channel", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/string_scanner/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/string_scanner/lib")));
  writePubspec(here, "string_scanner", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/http/pkgs/http_parser/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/http_parser/lib")));
  writePubspec(here, "http_parser", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/stack_trace/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/stack_trace/lib")));
  writePubspec(here, "stack_trace", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/clock/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/clock/lib")));
  writePubspec(here, "clock", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/toolsPkg/pkgs/term_glyph/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/term_glyph/lib")));
  writePubspec(here, "term_glyph", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/web/web/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/web/lib")));
  writePubspec(here, "web", "^3.6.0");

  Directory.fromUri(here.resolve("tmp/http/pkgs/web_socket/lib"))
      .copyTo(Directory.fromUri(here.resolve("pkg/web_socket/lib")));
  writePubspec(here, "web_socket", "^3.6.0");

  print("Running dart pub get...");
  dartPubGet(here);

  print("Done.");
  print("You should now be able to use the analysis server via");
  print(here.resolve("pkg/analysis_server/bin/server.dart").toFilePath());
  print("e.g. setting it in VSCode as \"dart.analyzerPath\"");
}

void writePubspec(Uri here, String package, String sdk) {
  new File.fromUri(here.resolve("pkg/$package/pubspec.yaml"))
      .writeAsStringSync("""
name: $package
publish_to: none
environment:
  sdk: '$sdk'
resolution: workspace
""");
}

void dartPubGet(Uri here) {
  ProcessResult processResult = Process.runSync("dart", ["pub", "get"],
      workingDirectory: here.toFilePath());
  if (processResult.exitCode != 0) {
    throw "Failed to run dart pub get:\n"
        "stderr: ${processResult.stderr}\n"
        "stdout: ${processResult.stdout}";
  }
}

void gitCheckout(Uri here, String path, String uri) {
  Directory dir = Directory.fromUri(here.resolve(path));
  if (!dir.existsSync()) {
    dir.createSync();
    ProcessResult processResult = Process.runSync(
        "git", ["clone", "--single-branch", "--depth=1", uri, path],
        workingDirectory: here.toFilePath());
    if (processResult.exitCode != 0) {
      throw "Failed checking out dart:\n"
          "stderr: ${processResult.stderr}\n"
          "stdout: ${processResult.stdout}";
    }
  } else {
    print("Dir '$path' already exists, will assume it has been checked out "
        " and will update instead.");

    ProcessResult processResult = Process.runSync(
        "git",
        [
          "pull",
        ],
        workingDirectory: dir.path);
    if (processResult.exitCode != 0) {
      throw "Failed to update dart:\n"
          "stderr: ${processResult.stderr}\n"
          "stdout: ${processResult.stdout}";
    }
  }
}

extension copyDir on Directory {
  void copyTo(Directory to) {
    to.createSync(recursive: true);
    String fromUriPath = this.uri.path;
    Uri toUri = to.uri;
    for (final file in this.listSync(recursive: true)) {
      Uri newUri = toUri.resolve(file.uri.path.substring(fromUriPath.length));
      if (file is Directory) {
        new Directory.fromUri(newUri).createSync(recursive: true);
      } else if (file is File) {
        file.copySync(newUri.toFilePath());
      } else {
        throw "Doesn't support copying ${file.runtimeType}";
      }
    }
  }
}

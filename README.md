Allows to try out analysis server from main on the dart repository.

Running `dart doStuff.dart` will clone various repositires, copy things around
and setup pubspecs so you should be able to use the newest analysis server by
setting a path in "dart.analyzerPath" in VSCode.

Do note that this will run the analysis server from code and startup will be
slower because it has to be compiled first etc.

Tested to work as of 2025-02-28 with Dart 3.7.1 on Linux.

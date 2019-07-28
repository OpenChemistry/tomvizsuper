![tomviz_logo]

This is a developer superbuild for the [Tomviz project][tomviz], designed to
replace most of the instructions in the BUILDING.md file there. It will build
ParaView, and then Tomviz linking to the built project. This may be extended in
the future for other dependencies.

Dependencies
------------

 * Qt 5.9+ (5.9 recommended)
 * CMake 3.3+
 * Python 3.7
 * NumPy 1.12
 * Git 2.1
 * C++ compiler with C++11 support (MSVC 2015 on Windows)

Initial Build
-------------

First clone the repository, and all of its submodules:

    git clone --recursive git://github.com/openchemistry/tomvizsuper

Next make a build directory, initialize the build, and build the project:

    mkdir tomvizsuperbuild
    cd tomvizsuperbuild
    cmake -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo ../tomvizsuper
    cmake --build .

Once compiled (it may take a while) you will have a source tree containing
ParaView and Tomviz along with a build tree that has corresponding build trees.
You can then change the source, and recompile in the corresponding build trees.

Updating Source
---------------

Go into the source directory and run the following command:

    git submodule update --init --recursive

Developing
----------

You will generally want to develop Tomviz code once the initial build is ready,
and will only need to occasionally update ParaVIew and other dependencies. To
get this working you would move into the Tomviz directory, checkout master, add
a remote to your fork, and then develop topic branches as per the Tomviz guide.

    cd tomvizsuper/tomviz
    git checkout master
    git pull --recurse-submodules
    git remote add devfork git@github.com:gh_user/tomviz

This is calling your fork on GitHub devfork, and substituting your user name for
gh_user. You can then create a topic, commit some code and push after building.

    git checkout master
    git pull --recurse-submodules
    git checkout -b my-feature-branch
    git add tomviz/modified.cxx tomviz/modified.h
    git commit -v -s

Now build and test the latest version.

    cd ../../tomvizsuperbuild/tomviz
    cmake --build .
    ./bin/tomviz

If Tomviz is working as expected when running you can push, create a pull
request, and go through the normal review process.

    git push devfork HEAD

Once complete, and merged you should go back to master and make sure everything
still works as expected.

    cd ../../tomvizsuper/tomviz
    git checkout master
    git pull --recurse-submodules
    cd ../../tomvizsuperbuild/tomviz
    cmake --build .
    ./bin/tomviz

You are then ready to start a new branch assuming everything works as expected.

Rough Timings for Fresh Build
-----------------------------

Very arbitrarily on my machine using ninja the rough timings on an eight core
machine with 32 GB of DDR4 memory and a solid state NVMe-based SSD drive are:

    $ time ninja paraview
    real    21m1.071s
    user    277m39.597s
    sys     21m48.348s

    $ time ninja tomviz
    real    0m55.340s
    user    8m49.975s
    sys     2m9.483s

![Kitware, Inc.][KitwareLogo]

  [tomviz]: https://tomviz.org/ "The Tomviz project"
  [tomviz_logo]: https://github.com/OpenChemistry/tomviz/blob/master/tomviz/icons/tomvizfull.png "tomviz"
  [Kitware]: http://kitware.com/ "Kitware, Inc."
  [KitwareLogo]: http://www.kitware.com/img/small_logo_over.png "Kitware"
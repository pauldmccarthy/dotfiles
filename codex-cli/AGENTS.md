You are working in a sandboxed Ubuntu 24.04 environment. Feel free to install any software you need - do not ask for permission:

 - At the system level with:

       sudo apt-get install ...

 - From conda-forge with:

       /micromamba/bin/install -p /micromamba ...

   There is a micromamba base environment at /micromamba/. This environment already contains a Python installation with the standard scientific stack. Feel free to install additional packages as needed. Feel free to create separate micromamba environments as needed.

 - Via pip with:

       /micromamba/bin/pip install ...

   But prefer conda-forge wherever possible - only fall back to pip for packages which are not available on conda-forge.

If you are working within a git repository, never interact with git - change files if instructed to do so, but never commit anything.

# MySample

An unofficial example of Julia package generated by PkgTemplates.jl

[![Build Status](https://travis-ci.org/terasakisatoshi/MySample.jl.svg?branch=master)](https://travis-ci.org/terasakisatoshi/MySample.jl)
[![Codecov](https://codecov.io/gh/terasakisatoshi/MySample.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/terasakisatoshi/MySample.jl)
[![Coveralls](https://coveralls.io/repos/github/terasakisatoshi/MySample.jl/badge.svg?branch=master)](https://coveralls.io/github/terasakisatoshi/MySample.jl?branch=master)

# How to create ?

## Generate package using `PkgTemplates.jl`

Make julia script to generate package as follow:

```julia
#initialize.jl
using PkgTemplates

t = Template(
        ssh=true,
        plugins=[
              TravisCI(),
              Codecov(),
              Coveralls(),
            ]
    )

generate(t, "MySample")

```

If you use git HTTPS protocol, set argument `ssh=false`.

- Run this script:

```
$ julia initialize.jl
```

`~/.julia/dev/MySample` will be generated.

- Note that, `MySample` will be added default julia environment which means you can use `using MySample` without doing `pkg>activate .`, `using .MySample` or something like that. Some says this feature is (in)convenient.

  - If you would like to move `MySample` to another directory, you shold do `pkg> rm MySample`

## manage repository on your GitHub

- Make your GitHub repository named `MySample.jl`. Do not `Initialize this repository with a README`. just push `Create repository` button.

- Push your repository `~/.julia/MySample`

```
$ cd ~/.julia/dev/MySample
$ git remote -v
origin	git@github.com:<your github account>/MySample.jl.git (fetch)
origin	git@github.com:<your github account>/MySample.jl.git (push)
$ git push -u origin master
```


## Add some script

That's all. What you have to do is enjoy julia.

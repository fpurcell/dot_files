# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# stuff
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=2000
export EDITOR=${EDITOR:="emacs"}
export TERM=${TERM:="vt100"}
export PATH="$PATH:.:/bin:/home/geoserve/htdocs/tilecache/seed:/home/geoserve/MapConfig/unix"
export GDAL_DATA=/home/geoserve/install/gdal/share/gdal
export LD_LIBRARY_PATH=~/install/libgeotiff/lib:~/install/proj/lib

# User specific aliases and functions
alias l='ls -l'
alias ll='ls -alh'
alias c=clear
alias 'more=less'
alias DEV='cd c:/java/DEV'
#alias mcount="for x in `grep -i mobilitymap l*/h*/a*07 | awk '{print $1}' | sort -u`; do echo $x; grep $x l*/h*/a*07 | wc; echo; nslookup $x; done"


alias CONDA=conda_func
function conda_func
{
    CONDA_HOME="/cygdrive/c/ProgramData/Miniconda3"
    export PATH=$CONDA_HOME:$CONDA_HOME/Scripts:.:$PATH
}

function conda_paths
{
    PENV=$1

    export PATH="$PENV:$PENV/Library/bin:$PENV/Scripts:.:$PATH"
    alias python='python -i'

    # windows path
    echo "set PATH=$PENV;$PENV/Library/bin;$PYTHONHOME/Scripts;.;%PATH%;"
}


alias PY36=conda_py_36
function conda_py_36
{
    conda_paths "/cygdrive/c/ProgramData/Miniconda3/envs/py36"
}

alias PY27=conda_py_27
function conda_py_27
{
    conda_paths "/cygdrive/c/ProgramData/Miniconda3/envs/py27"
}


alias 'SVNU=svn update --ignore-externals'
alias 'SVNC=svn status -u | grep ^M'

alias svnc=SVNC
alias svnu=SVNU
alias SVNUU=svnuu_func
function svnuu_func
{
    for x in `ls */.svn/props`; do dir=${x%%.svn/props:}; cd $dir; echo $PWD; svn update --ignore-externals; cd -; done
}

alias logTime=lt_func
function lt_func
{
  log=mobility.log
  for x in `awk '{ print $1 $4}' log  | sort -u`; do echo $x; done
}

alias logIP=lIP_func
function lIP_func
{
  log=mobility.log
  for x in `awk '{ print $1}' log  | sort -u`; do echo $x; done
}

### Java
export JAVA_HOME="/cygdrive/c/java/jdk1.8.0_92"
export ANT_HOME="/cygdrive/c/java/buildTools/apache-ant-1.7.1"
export PATH="$JAVA_HOME/bin:$ANT_HOME/bin:.:$PATH"
export JAVA_OPTS="-Xms1536m -XX:MaxPermSize=3072m -Xmx5120m -Dsolr.solr.home=/home/geoserve/solr"
export MALLOC_CHECK_=0
export MALLOC_ARENA_MAX=4   

### JAI
# export JAI=$HOME/install/jai/lib
# export JAI_IO=$HOME/install/jaiio/lib
# export CP=$JAI_IO/jai_imageio.jar:$JAI_IO/clibwrapper_jiio.jar:$JAI/jai_codec.jar:$JAI/jai_core.jar:$JAI/mlibwrapper_jai.jar:$JAI_IO:$JAI:.

export CLASSPATH=$CP

### Groovy
export GROOVY_HOME=~/install/groovy
export PATH=$GROOVY_HOME/bin:$PATH

### PostgreSQL
export PGPORT=5432
export POSTGRES_HOME=$HOME/postgres
export PATH=$POSTGRES_HOME/bin:$PATH
export PGDBNAME=trimet
export PGPROJ=2913

### libtiff
export TIFF=$HOME/install/libtiff
export GEOTIFF=$HOME/install/libgeotiff

export PATH=$PATH:$TIFF/bin:$GEOTIFF/bin:$HOME/install/gdal/bin:$HOME/install/geos/bin:$HOME/install/proj/bin:$HOME/install/postgis/bin:$HOME:$HOME/install:.

# export LD_LIBRARY_PATH=$JAI_IO:$JAI:$TIFF/lib:$GEOTIFF/lib:$HOME/postgres/lib:$HOME/install/gdal/lib:$HOME/install/geos/lib:$HOME/install/proj/lib
export LD_LIBRARY_PATH=$HOME/postgres/lib:$HOME/install/gdal/lib:$HOME/install/geos/lib:$HOME/install/proj/lib

alias ME='ps -ef | grep $USER'
export EDITOR="emacs"
alias "SRC=export CLASSPATH=.;. $HOME/.bashrc"

alias TOM="cd /cygdrive/c/java/serverTools/apache-tomcat-6.0.32"

alias CPP=CPP_func
function CPP_func
{
    cd "$1"
    CP="."
    xPWD=${PWD//\/cygdrive\/c/c:}
    for x in `ls *.jar`; do CP="$xPWD/$x:$CP"; done
    for x in `ls *.zip`; do CP="$xPWD/$x:$CP"; done
    export CLASSPATH="$xPWD:$CP:$CLASSPATH"
    echo $CLASSPATH
    cd -
}

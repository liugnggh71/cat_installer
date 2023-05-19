mkdir -p $HOME/dba_code/bin
cd $HOME/dba_code/bin

cat << 'EOC' > b1f
#!/bin/sh
################################################################################
# b1f
<<COMMENT
Make a local backup of a single file
COMMENT
################################################################################
if [ ${#} -lt $((1)) ]
then

  echo "####################"
  echo "USAGE: b1f file_name"
  echo "####################"

  #XXXXXXXXXX
  exit 11
  #XXXXXXXXXX

fi

mkdir -p bk
cp -p ${1} bk/${1}.$(date +%Y_%m_%d_%H_%M_%S)
ls -ltr bk | tail -n 10
EOC


cat << 'EOC' > lld
#!/bin/sh
################################################################################
# lld
<<COMMENT
List sub-directory under current directory
COMMENT
################################################################################
  #List sub-directory
  #RRRRRRRRRRRRRRRRRR
  echo "List sub-directory"

  ls -l ${1:-.} | grep ^d
EOC

cat << 'EOC' > llf
#!/bin/sh
################################################################################
# llf
<<COMMENT
List files under current directory
COMMENT
################################################################################
  #List files
  #RRRRRRRRRR
  echo "List files"

  ls -l ${1:-.} | grep ^-
EOC

cat << 'EOC' > lll
#!/bin/sh
################################################################################
# lll
<<COMMENT
List sub-directory under current directory
COMMENT
################################################################################
  #List symbolic link
  #RRRRRRRRRRRRRRRRRR
  echo "List symbolic link"

  ls -l ${1:-.} | grep ^l
EOC

cat << 'EOC' > lnc
#!/bin/sh
################################################################################
# lnc
<<COMMENT
Generate symbolic creation code
COMMENT
################################################################################

echo "" > ln_s.sh
while IFS= read -r line
do
  ## Debugging lines
#  echo "$line"
  full_file=$(echo "$line" | cut -d '>' -f 2)
#  echo $full_file
  short_cut=$(echo "$line" | cut -d '-' -f 1 | rev | cut -d ' ' -f 2 | rev)
#  echo $short_cut
  echo ln -s $full_file $short_cut
  echo ln -s $full_file $short_cut >> ln_s.sh
#  ln -s $full_file $short_cut
done << ( ls -l | grep ^l )
EOC

cat << 'EOC' > profile.txt
export PATH=${HOME}/dba_code/bin:$PATH
export CLASSPATH=$HOME/dba_code/bin/saxon_he_stable.jar
export PATH=${HOME}/dba_code/bin/sqlcl/bin:$PATH
EOC

cat << 'EOC' > SAX
#!/bin/sh
################################################################################
# SAX
<<COMMENT
Run Saxon XSLT transformer with 2 parameter
COMMENT
################################################################################

cat << 'EOF'
======================================================
java net.sf.saxon.Transform  -s:${1} -a:on -o:${2} -xi:on
======================================================
EOF
echo java net.sf.saxon.Transform  -s:${1} -a:on -o:${2} -xi:on
java net.sf.saxon.Transform  -s:${1} -a:on -xi:on -o:${2}
EOC

cat << 'EOC' > SAXON
#!/bin/sh
################################################################################
# SAXON
<<COMMENT
Run Saxon XSLT transformer with 3 parameters
COMMENT
################################################################################

cat << 'EOF'
======================================================
java net.sf.saxon.Transform  -s:${1} -xsl:${2} -o:${3} -xi:on
======================================================
EOF
echo java net.sf.saxon.Transform  -s:${1} -xsl:${2} -o:${3} -xi:on
java net.sf.saxon.Transform  -s:${1} -xsl:${2} -o:${3} -xi:on
EOC

cat << 'EOC' > SAX1
#!/bin/sh
################################################################################
# SAX1
<<COMMENT
Run Saxon XSLT transformer with 1 parameter
COMMENT
################################################################################

cat << 'EOF'
======================================================
java net.sf.saxon.Transform  -s:${1} -a:on -o:/dev/null -xi:on
======================================================
EOF
echo java net.sf.saxon.Transform  -s:${1} -a:on -o:/dev/null -xi:on
java net.sf.saxon.Transform -s:${1} -a:on -o:/dev/null -xi:on
EOC

cat << 'EOC' > cd_dba_code_bin.sh
cd $HOME/dba_code/bin
EOC

ln -s lll L
ln -s lld D
ln -s llf F
ln -s SAX1 X
ln -s SAX XX
ln -s SAXON X3
ln -s cd_dba_code_bin.sh BN

chmod u+x b1f
chmod u+x ll?
chmod u+x lnc
chmod u+x SAX
chmod u+x SAX1
chmod u+x SAXON

echo SaxonJ 12 is built and tested using Java 11, but is supported with Java 8 or later
echo https://www.saxonica.com/download/download_page.xml
wget https://github.com/Saxonica/Saxon-HE/blob/main/10/Java/SaxonHE10-9J.zip
wget https://github.com/Saxonica/Saxon-HE/tree/main/11/Java/SaxonHE11-5J.zip
wget https://github.com/Saxonica/Saxon-HE/tree/main/12/Java/SaxonHE12-2J.zip

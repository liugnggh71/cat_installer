mkdir -p $HOME/dba_code/bin
cd $HOME/dba_code/bin

echo Creating b1f
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

echo Creating lld
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

echo Creating llf
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

echo Creating lll
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

echo Creating lnc
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

echo Creating profile.txt
cat << 'EOC' > profile.txt
export PATH=${HOME}/dba_code/bin:$PATH
export CLASSPATH=$HOME/dba_code/bin/saxon_he_stable.jar
export PATH=${HOME}/dba_code/bin/sqlcl/bin:$PATH
EOC

echo Creating SAX
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

echo Creating SAXON
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

echo Creating SAX1
cat << 'EOC' > SAX1
#!/bin/sh
################################################################################
# SAX1
<<COMMENT
Run Saxon XSLT transformer with 1 parameter
COMMENT
################################################################################

cat << 'EOF'
==============================================================
java net.sf.saxon.Transform  -s:${1} -a:on -xi:on -o:${1}out
==============================================================
EOF
echo java net.sf.saxon.Transform -t -s:${1} -a:on -xi:on -o:${1}out
java net.sf.saxon.Transform -t -s:"${1}" -a:on -xi:on -o:"${1}out"
EOC

echo Creating cd_dba_code_bin.sh
cat << 'EOC' > cd_dba_code_bin.sh
cd $HOME/dba_code/bin
EOC

echo Link L
ln -sf lll L
echo Link D
ln -sf lld D
echo Link F
ln -sf llf F
echo Link X
ln -sf SAX1 X
echo Link XX
ln -sf SAX XX
echo Link X3
ln -sf SAXON X3
echo Link BN
ln -sf cd_dba_code_bin.sh BN

chmod u+x b1f
chmod u+x ll?
chmod u+x lnc
chmod u+x SAX
chmod u+x SAX1
chmod u+x SAXON

echo SaxonJ 12 is built and tested using Java 11, but is supported with Java 8 or later
echo https://www.saxonica.com/download/download_page.xml
echo wget https://github.com/Saxonica/Saxon-HE/blob/main/10/Java/SaxonHE10-9J.zip
echo wget https://github.com/Saxonica/Saxon-HE/tree/main/11/Java/SaxonHE11-5J.zip
echo wget https://github.com/Saxonica/Saxon-HE/tree/main/12/Java/SaxonHE12-2J.zip

echo Downloading SaxonHE10-9J.zip
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
tIyxJ3YFGuJ2zDKsSHkaUul5fEv3-7sIm0TgW_7akQppEDgqQe9w0wVuNgBJtzs8\
/n/bswhealth/b/RMAN_PSFT_NP/o/SaxonHE10-9J.zip -o SaxonHE10-9J.zip

echo Downloading SaxonHE11-5J.zip
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
gSL_FyqKUGLE1oy3U4rPOSA66-tlcTWsFaDhvtbLd-PrU7jdH-h-ZoWya2MyWSq4\
/n/bswhealth/b/RMAN_PSFT_NP/o/SaxonHE11-5J.zip -o SaxonHE11-5J.zip

rm *.jar
rm -Rf doc
rm -Rf notices
rm -Rf lib

unzip SaxonHE11-5J.zip
ln saxon-he-11.5.jar saxon_he_stable.jar

echo Downloading SaxonHE12-2J.zip
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
TgiIRxnSOupcf6O_41JEbbEFJLt8Vz0JMR5LaVklD1SNyeq_KMXQVtsBPs0OI8Sc\
/n/bswhealth/b/RMAN_PSFT_NP/o/SaxonHE12-2J.zip -o SaxonHE12-2J.zip

cat << 'EOF' > cd_catalog.xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="cd_catalog.xsl"?>

<catalog xmlns:xi="http://www.w3.org/2001/XInclude">
    <cd>
        <title>Empire Burlesque</title>
        <artist>Bob Dylan</artist>
        <country>USA</country>
        <company>Columbia</company>
        <price>10.90</price>
        <year>1985</year>
    </cd>
    <cd>
        <title>Hide your heart</title>
        <artist>Bonnie Tyler</artist>
        <country>UK</country>
        <company>CBS Records</company>
        <price>9.90</price>
        <year>1988</year>
    </cd>
    <cd>
        <title>Greatest Hits</title>
        <artist>Dolly Parton</artist>
        <country>USA</country>
        <company>RCA</company>
        <price>9.90</price>
        <year>1982</year>
    </cd>
    <cd>
        <title>Still got the blues</title>
        <artist>Gary Moore</artist>
        <country>UK</country>
        <company>Virgin records</company>
        <price>10.20</price>
        <year>1990</year>
    </cd>
    <cd>
        <title>Eros</title>
        <artist>Eros Ramazzotti</artist>
        <country>EU</country>
        <company>BMG</company>
        <price>9.90</price>
        <year>1997</year>
    </cd>
    <cd>
        <title>One night only</title>
        <artist>Bee Gees</artist>
        <country>UK</country>
        <company>Polydor</company>
        <price>10.90</price>
        <year>1998</year>
    </cd>
    <cd>
        <title>Sylvias Mother</title>
        <artist>Dr.Hook</artist>
        <country>UK</country>
        <company>CBS</company>
        <price>8.10</price>
        <year>1973</year>
    </cd>
    <cd>
        <title>Maggie May</title>
        <artist>Rod Stewart</artist>
        <country>UK</country>
        <company>Pickwick</company>
        <price>8.50</price>
        <year>1990</year>
    </cd>
    <cd>
        <title>Romanza</title>
        <artist>Andrea Bocelli</artist>
        <country>EU</country>
        <company>Polydor</company>
        <price>10.80</price>
        <year>1996</year>
    </cd>
    <cd>
        <title>When a man loves a woman</title>
        <artist>Percy Sledge</artist>
        <country>USA</country>
        <company>Atlantic</company>
        <price>8.70</price>
        <year>1987</year>
    </cd>
    <cd>
        <title>Black angel</title>
        <artist>Savage Rose</artist>
        <country>EU</country>
        <company>Mega</company>
        <price>10.90</price>
        <year>1995</year>
    </cd>
    <cd>
        <title>1999 Grammy Nominees</title>
        <artist>Many</artist>
        <country>USA</country>
        <company>Grammy</company>
        <price>10.20</price>
        <year>1999</year>
    </cd>
    <cd>
        <title>For the good times</title>
        <artist>Kenny Rogers</artist>
        <country>UK</country>
        <company>Mucik Master</company>
        <price>8.70</price>
        <year>1995</year>
    </cd>
    <cd>
        <title>Big Willie style</title>
        <artist>Will Smith</artist>
        <country>USA</country>
        <company>Columbia</company>
        <price>9.90</price>
        <year>1997</year>
    </cd>
    <cd>
        <title>Tupelo Honey</title>
        <artist>Van Morrison</artist>
        <country>UK</country>
        <company>Polydor</company>
        <price>8.20</price>
        <year>1971</year>
    </cd>
    <cd>
        <title>Soulsville</title>
        <artist>Jorn Hoel</artist>
        <country>Norway</country>
        <company>WEA</company>
        <price>7.90</price>
        <year>1996</year>
    </cd>
    <cd>
        <title>The very best of</title>
        <artist>Cat Stevens</artist>
        <country>UK</country>
        <company>Island</company>
        <price>8.90</price>
        <year>1990</year>
    </cd>
    <cd>
        <title>Stop</title>
        <artist>Sam Brown</artist>
        <country>UK</country>
        <company>A and M</company>
        <price>8.90</price>
        <year>1988</year>
    </cd>
    <cd>
        <title>Bridge of Spies</title>
        <artist>T`Pau</artist>
        <country>UK</country>
        <company>Siren</company>
        <price>7.90</price>
        <year>1987</year>
    </cd>
    <cd>
        <title>Private Dancer</title>
        <artist>Tina Turner</artist>
        <country>UK</country>
        <company>Capitol</company>
        <price>8.90</price>
        <year>1983</year>
    </cd>
    <cd>
        <title>Midt om natten</title>
        <artist>Kim Larsen</artist>
        <country>EU</country>
        <company>Medley</company>
        <price>7.80</price>
        <year>1983</year>
    </cd>
    <cd>
        <title>Pavarotti Gala Concert</title>
        <artist>Luciano Pavarotti</artist>
        <country>UK</country>
        <company>DECCA</company>
        <price>9.90</price>
        <year>1991</year>
    </cd>
    <cd>
        <title>The dock of the bay</title>
        <artist>Otis Redding</artist>
        <country>USA</country>
        <company>Stax Records</company>
        <price>7.90</price>
        <year>1968</year>
    </cd>
    <cd>
        <title>Picture book</title>
        <artist>Simply Red</artist>
        <country>EU</country>
        <company>Elektra</company>
        <price>7.20</price>
        <year>1985</year>
    </cd>
    <cd>
        <title>Red</title>
        <artist>The Communards</artist>
        <country>UK</country>
        <company>London</company>
        <price>7.80</price>
        <year>1987</year>
    </cd>
    <xi:include href="cd_Joe_Cocker.xml"/>
</catalog>
EOF


cat << 'EOF' > cd_Joe_Cocker.xml
<?xml version="1.0" encoding="UTF-8"?>
<cd>
        <title>Unchain my heart</title>
        <artist>Joe Cocker</artist>
        <country>USA</country>
        <company>EMI</company>
        <price>8.20</price>
        <year>1987</year>
</cd>
EOF


cat << 'EOF' > cd_catalog.xsl
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Title</th>
      <th style="text-align:left">Artist</th>
    </tr>
    <xsl:for-each select="catalog/cd">
    <tr>
      <td><xsl:value-of select="title"/></td>
      <td><xsl:value-of select="artist"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
EOF

./X cd_catalog.xml

cat << 'EOC' 
export CLASSPATH="C:\Users\liugn\Documents\MobaXterm\home\dba_code\bin\saxon_he_stable.jar"
EOC

echo CLASSPATH: ${CLASSPATH}

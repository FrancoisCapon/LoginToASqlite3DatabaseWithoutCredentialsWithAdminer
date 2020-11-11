translationsFile="warning-translations.csv"
rm $translationsFile
touch $translationsFile
for file in adminer/adminer/lang/*
do
    if [ -f $file ]; then
        language="$(echo $(basename "$file") | cut -d'.' -f 1)"
        if [ "$language" != "xx" ] && [ "$language" != "en" ]
        then
            echo $language',' >> $translationsFile
        fi
    fi
done

#!/bin/sh
if [ -d "../shared/settings" ];
then
        cp -Rf ../shared/settings/* ./
else
        samples=$(find ./ -name "*.sample")
        for sam in $samples
        do
                mv ${sam} ${sam%.sample}
        done
fi

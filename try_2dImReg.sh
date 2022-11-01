#!/bin/bash
export PATH=$PATH:/usr/pubsw/packages/AFNI/21.0.21
export FREESURFER_HOME=/usr/local/freesurfer/7.3.3; source $FREESURFER_HOME/SetUpFreeSurfer.sh

rd=/space/takoyaki/1/users/proulxs/vasomo/raw
wd=`pwd`
wd=`readlink -f "$0"`; wd=`dirname "$wd"`

# Copy example data from raw dir to here
rm $wd/vol.nii.gz
cp $rd/mitra_pilot01__old/0004.BOLD_64mat_TR180ms_fa90_40slc.nii.gz $wd/vol.nii.gz
rm $wd/slc.nii.gz
cp $rd/mitra_pilot01__old/0005.BOLD_64mat_TR200ms_fa24_1slc.nii.gz $wd/slc.nii.gz
# Try 2dImReg
freeview $wd/vol.nii.gz $wd/slc.nii.gz
2dImReg -prefix $wd/slc_reg.nii.gz \
	-input $wd/slc.nii.gz \
	-basefile $wd/vol.nii.gz \
	-base 0 \
	-rprefix $wd/slc_rms.nii.gz

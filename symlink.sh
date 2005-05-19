#!/bin/bash

#
# A script that symlinks source files from monolithic to modular
#
# Author: Soren Sandmann (sandmann@redhat.com)
# 

#
# Things we would like to do
#
#	- Check that all the relevant files exist
#		- AUTHORS, autogen.sh, configure.ac, ...
#	- Check that we have actually linked everything
#		- if a file doesn't need to be linked, then it needs
#		  to be listed as "not-linked"
#	- Compute diffs between all the files (shouldn't be necessary)
#	- possibly check that files are listet in Makefile.am's
#	- Clean target directory of irrelevant files
#

function check_destinations () {
    # don't do anything - we are relying on the side
    # effect of dst_dir
    true
}

function check_exist() {
    # Check whether $1 exists

    if [ ! -e $1 ] ; then
	error "$1 not found"
    fi
}

function delete_existing() {
    # Delete $2

    rm -f $2
}

function link_files() {
    # Link $1 to $2

    if [ ! -e $2 ] ; then
	ln -s $1 $2
    fi
}

function main() {
    check_args $1 $2

    run check_destinations "Creating destination directories"
    run check_exist "Checking that the source files exist"
    run delete_existing "Deleting existing files"
    run link_files "Linking files"
}


#########
#
#	The proto module
#
#########

# Core protocol

function symlink_proto_core() {
    src_dir include
    dst_dir proto/X11

    action	ap_keysym.h	# not used anywhere
    action	DECkeysym.h
    action	HPkeysym.h	# not used anywhere
    action	keysymdef.h
    action	keysym.h
    action	Sunkeysym.h
    action	Xalloca.h
    action	Xarch.h
    action	Xatom.h
    action	Xdefs.h
    action	XF86keysym.h	# only used in server
    action	Xfuncproto.h
    action	Xfuncs.h
    action	X.h
    action	Xmd.h
    action	Xosdefs.h
    action	Xos.h
    action	Xos_r.h
    action	Xpoll.h
    action	Xproto.h
    action	Xprotostr.h
    action	Xthreads.h	# not used in server
    action	Xw32defs.h
    action	XWDFile.h
    action	Xwindows.h
    action	Xwinsock.h
}

# Extension protocols

function symlink_proto_bigreq() {
    src_dir include/extensions
    dst_dir proto/BigReqs

    action	bigreqstr.h
}

function symlink_proto_composite() {
    src_dir include/extensions
    dst_dir proto/Composite

    action	composite.h
    action	compositeproto.h
}

function symlink_proto_damage() {
    src_dir include/extensions
    dst_dir proto/Damage

    action	damageproto.h
    action	damagewire.h
}

function symlink_proto_dmx() {
    src_dir include/extensions
    dst_dir proto/DMX

    action	dmxext.h
    action	dmxproto.h
}

function symlink_proto_evie() {
    src_dir include/extensions
    dst_dir proto/EvIE

    action	Xevie.h
    action	Xeviestr.h
}

function symlink_proto_fixes() {
    src_dir include/extensions
    dst_dir proto/Fixes

    action	xfixesproto.h
    action	xfixeswire.h
}

function symlink_proto_fontcache() {
    src_dir include/extensions
    dst_dir proto/Fontcache

    action	fontcache.h
    action	fontcacheP.h
    action	fontcachstr.h
}

function symlink_proto_input() {
    src_dir include/extensions
    dst_dir proto/Input

    action	XI.h
    action	XInput.h
    action	XIproto.h
}

function symlink_proto_kb() {
    src_dir include/extensions
    dst_dir proto/KB

    action	XKBgeom.h
    action	XKB.h
    action	XKBproto.h
    action	XKBsrv.h
    action	XKBstr.h
}

function symlink_proto_panoramix() {
    src_dir include/extensions
    dst_dir proto/Panoramix

    action	panoramiXext.h
    action	panoramiXproto.h
    action	Xinerama.h	# not used in server
}

function symlink_proto_print() {
    src_dir include/extensions
    dst_dir proto/Print

    action	Print.h
    action	Printstr.h
}

function symlink_proto_randr() {
    src_dir include/extensions
    dst_dir proto/Randr

    action	randr.h
    action	randrproto.h
}

function symlink_proto_record() {
    src_dir include/extensions
    dst_dir proto/Record

    action	record.h
    action	recordstr.h
}

function symlink_proto_render() {
    src_dir include/extensions
    dst_dir proto/Render

    action	render.h
    action	renderproto.h
}

function symlink_proto_resource() {
    src_dir include/extensions
    dst_dir proto/Resource

    action	XRes.h		# only used by DMX example program in server
    action	XResproto.h
}

function symlink_proto_saver() {
    src_dir include/extensions
    dst_dir proto/ScrnSaver

    action	saver.h
    action	saverproto.h
    action	scrnsaver.h	# not used in server
}

function symlink_proto_trap() {
    src_dir include/extensions
    dst_dir proto/Trap

    action	xtrapbits.h
    action	xtrapddmi.h	# only used in server
    action	xtrapdi.h
    action	xtrapemacros.h	# not used in server
    action	xtraplib.h	# not used in server
    action	xtraplibp.h	# not used in server
    action	xtrapproto.h	# only used in server
}

function symlink_proto_video() {
    src_dir include/extensions
    dst_dir proto/Video

    action	vldXvMC.h	# not used in server
    action	Xv.h
    action	Xvlib.h		# not used in server
    action	XvMC.h
    action	XvMClib.h	# not used in server
    action	XvMCproto.h
    action	Xvproto.h
}

function symlink_proto_xcmisc() {
    src_dir include/extensions
    dst_dir proto/XCMisc

    action	xcmiscstr.h
}

# should these be exploded into individual extension components?
function symlink_proto_xext() {
    src_dir include/extensions
    dst_dir proto/XExt

    action	dpms.h
    action	dpmsstr.h
    action	extutil.h
    action	lbxbuf.h	# not used in server
    action	lbxbufstr.h	# not used in server
    action	lbxdeltastr.h
    action	lbximage.h
    action	lbxopts.h
    action	lbxstr.h
    action	lbxzlib.h
    action	MITMisc.h
    action	mitmiscstr.h
    action	multibuf.h
    action	multibufst.h
    action	security.h
    action	securstr.h
    action	shape.h
    action	shapestr.h
    action	shmstr.h
    action	sync.h
    action	syncstr.h
    action	Xag.h
    action	Xagsrv.h	# only used in server
    action	Xagstr.h
    action	Xcup.h
    action	Xcupstr.h
    action	Xdbe.h		# not used in server
    action	Xdbeproto.h
    action	XEVI.h
    action	XEVIstr.h
    action	Xext.h
    action	XLbx.h
    action	XShm.h
    action	xtestext1.h
    action	XTest.h
    action	xteststr.h
}

function symlink_proto_xf86bigfont() {
    src_dir include/extensions
    dst_dir proto/XF86BigFont

    action	xf86bigfont.h
    action	xf86bigfstr.h
}

function symlink_proto_xf86dga() {
    src_dir include/extensions
    dst_dir proto/XF86DGA

    action	xf86dga1.h
    action	xf86dga1str.h
    action	xf86dga.h
    action	xf86dgastr.h
}

function symlink_proto_xf86misc() {
    src_dir include/extensions
    dst_dir proto/XF86Misc

    action	xf86misc.h
    action	xf86mscstr.h
}

function symlink_proto_xf86rush() {
    src_dir include/extensions
    dst_dir proto/XF86Rush

    action	xf86rush.h
    action	xf86rushstr.h
}

function symlink_proto_xf86vidmode() {
    src_dir include/extensions
    dst_dir proto/XF86VidMode

    action	xf86vmode.h
    action	xf86vmstr.h
}

function symlink_proto_fonts() {
    src_dir include/fonts
    dst_dir proto/Fonts

    action	font.h
    action	fontproto.h
    action	fontstruct.h
    action	FS.h		# not used in server
    action	fsmasks.h
    action	FSproto.h	# not used in server
}

function symlink_proto_gl() {
    src_dir include/GL
    dst_dir proto/GL

    action	glu.h		# not used in server
    action	glx.h
    action	glxint.h
    action	glxmd.h
    action	glxproto.h
    action	glxtokens.h
}

function symlink_proto() {
    # Core protocol
    symlink_proto_core

    # Extension protocols
    symlink_proto_bigreq
    symlink_proto_composite
    symlink_proto_damage
    symlink_proto_dmx
    symlink_proto_evie
    symlink_proto_fixes
    symlink_proto_fontcache
    symlink_proto_input
    symlink_proto_kb
    symlink_proto_panoramix
    symlink_proto_print
    symlink_proto_randr
    symlink_proto_record
    symlink_proto_render
    symlink_proto_resource
    symlink_proto_saver
    symlink_proto_trap
    symlink_proto_video
    symlink_proto_xcmisc
    symlink_proto_xext
    symlink_proto_xf86bigfont
    symlink_proto_xf86dga
    symlink_proto_xf86misc
    symlink_proto_xf86rush
    symlink_proto_xf86vidmode

    # Font protocols
    symlink_proto_fonts

    # GL protocols
    symlink_proto_gl
}

#########
#
#	The lib module
#
#########

function symlink_lib_dmx() {
    src_dir lib/dmx
    dst_dir lib/dmx/src

    action	dmx.c

    src_dir doc/man/DMX
    dst_dir lib/dmx/man

    action	DMXAddInput.man
    action	DMXAddScreen.man
    action	DMXChangeDesktopAttributes.man
    action	DMXChangeScreensAttributes.man
    action	DMXForceWindowCreation.man
    action	DMXGetDesktopAttributes.man
    action	DMXGetInputAttributes.man
    action	DMXGetInputCount.man
    action	DMXGetScreenAttributes.man
    action	DMXGetScreenCount.man
    action	DMXGetWindowAttributes.man
    action	DMX.man
    action	DMXQueryExtension.man
    action	DMXQueryVersion.man
    action	DMXRemoveInput.man
    action	DMXRemoveScreen.man
    action	DMXSync.man
}

function symlink_lib_composite() {
    src_dir lib/Xcomposite
    dst_dir lib/Xcomposite

    dst_dir lib/Xcomposite/include

    action	Xcomposite.h
    action	xcompositeint.h

    dst_dir lib/Xcomposite/src

    action	Xcomposite.c
}

function symlink_lib_damage() {
    src_dir lib/Xdamage
    dst_dir lib/Xdamage

    dst_dir	lib/Xdamage/include/X11/extensions

    action	Xdamage.h

    dst_dir	lib/Xdamage/src

    action	xdamageint.h
    action	Xdamage.c
}

function symlink_lib_fixes() {
    src_dir lib/Xfixes
    dst_dir lib/Xfixes

    dst_dir lib/Xfixes/src

    action	Cursor.c
    action	Region.c
    action	SaveSet.c
    action	Selection.c
    action	Xfixes.c
    action	Xfixesint.h

    dst_dir lib/Xfixes/include/X11/extensions
    
    action	Xfixes.h

    dst_dir lib/Xfixes/man

    action	Xfixes.man	Xfixes.3
}

function symlink_lib_xau() {
    src_dir	lib/Xau
    dst_dir	lib/Xau

    action	README

    action	AuDispose.c
    action	AuFileName.c
    action	AuGetAddr.c
    action	AuGetBest.c
    action	AuLock.c
    action	AuRead.c
    action	Autest.c
    action	AuUnlock.c
    action	AuWrite.c
    action	k5encode.c

    dst_dir	lib/Xau/include/X11
    action	Xauth.h

    src_dir	doc/man/Xau
    dst_dir	lib/Xau

    action	Xau.man		Xau.3
}

function symlink_lib_xtrans() {
    src_dir lib/xtrans
    dst_dir lib/xtrans

    action	transport.c
    action	Xtrans.c
    action	Xtransdnet.c
    action	Xtrans.h
    action	Xtransint.h
    action	Xtranslcl.c
    action	Xtransos2.c
    action	Xtranssock.c
    action	Xtranstli.c
    action	Xtransutil.c
}

function symlink_lib_xdmcp() {
    src_dir lib/Xdmcp
    dst_dir lib/Xdmcp

    action	Wrap.h

    action	A8Eq.c
    action	AA16.c
    action	AA32.c
    action	AA8.c
    action	Alloc.c
    action	AofA8.c
    action	CA8.c
    action	CmpKey.c
    action	DA16.c
    action	DA32.c
    action	DA8.c
    action	DAofA8.c
    action	DecKey.c
    action	Fill.c
    action	Flush.c
    action	GenKey.c
    action	IncKey.c
    action	RA16.c
    action	RA32.c
    action	RA8.c
    action	RaA16.c
    action	RaA32.c
    action	RaA8.c
    action	RaAoA8.c
    action	RAofA8.c
    action	RC16.c
    action	RC32.c
    action	RC8.c
    action	RHead.c
    action	RR.c
    action	Unwrap.c
    action	WA16.c
    action	WA32.c
    action	WA8.c
    action	WAofA8.c
    action	WC16.c
    action	WC32.c
    action	WC8.c
    action	Whead.c
    action	Wrap.c
    action	Wraphelp.c

    action	Wraphelp.README.crypto

    dst_dir	lib/Xdmcp/include/X11
    action	Xdmcp.h
}

function symlink_lib_xext() {
    src_dir lib/Xext
    dst_dir lib/Xext/src

    action	DPMS.c
    action	extutil.c
    action	globals.c
    action	MITMisc.c
    action	XAppgroup.c
    action	Xcup.c
    action	Xdbe.c
    action	XEVI.c
    action	XLbx.c
    action	XMultibuf.c
    action	XSecurity.c
    action	XShape.c
    action	XShm.c
    action	XSync.c
    action	XTestExt1.c

    src_dir doc/man/Xext
    dst_dir lib/Xext/man

    action	XcupGetReservedColormapEntries.man	XcupGetReservedColormapEntries.3
    action	XcupQueryVersion.man			XcupQueryVersion.3
    action	XcupStoreColors.man			XcupStoreColors.3
    action	Xevi.man				Xevi.3
    action	Xmbuf.man				Xmbuf.3
    action	XShape.man				XShape.3

    src_dir doc/man/Xext/dbe

    action	DBE.man					DBE.3
    action	XdbeAllo.man				XdbeAllo.3
    action	XdbeBegi.man				XdbeBegi.3
    action	XdbeDeal.man				XdbeDeal.3
    action	XdbeEndI.man				XdbeEndI.3
    action	XdbeFree.man				XdbeFree.3
    action	XdbeGetB.man				XdbeGetB.3
    action	XdbeGetV.man				XdbeGetV.3
    action	XdbeQuer.man				XdbeQuer.3
    action	XdbeSwap.man				XdbeSwap.3
} 

function symlink_lib_x11() {
    src_dir lib/X11

    # public .h files
    dst_dir lib/X11/include/X11

    action	cursorfont.h
    action	region.h
    action	Xcms.h
    action	XKBlib.h
    action	Xlib.h
    action	Xlibint.h
    action	Xlocale.h
    action	Xresource.h
    action	Xutil.h

    # internal .h files
    dst_dir lib/X11/src

    action	Cmap.h
    action	Cr.h
    action	Cv.h
    action	ImUtil.h
    action	Key.h
    action	locking.h
    action	poly.h
    action	Xaixlcint.h
    action	Xatomtype.h
    action	Xcmsint.h
    action	XimImSw.h
    action	Ximint.h
    action	XimintL.h
    action	XimintP.h
    action	XimProto.h
    action	XimThai.h
    action	XimTrans.h
    action	XimTrInt.h
    action	XimTrX.h
    action	Xintatom.h
    action	Xintconn.h
    action	XKBlibint.h
    action	XlcGeneric.h
    action	Xlcint.h
    action	XlcPubI.h
    action	XlcPublic.h
    action	XomGeneric.h
    action	Xresinternal.h
    action	XrmI.h

    # Misc
   
    action	XKeysymDB
    action	XErrorDB
    

    # source .c files

    action	AddDIC.c
    action	AddSF.c
    action	AllCells.c
    action	AllowEv.c
    action	AllPlanes.c
    action	AutoRep.c
    action	Backgnd.c
    action	BdrWidth.c
    action	Bell.c
    action	Border.c
    action	CCC.c
    action	ChAccCon.c
    action	ChActPGb.c
    action	ChClMode.c
    action	ChCmap.c
    action	ChGC.c
    action	ChKeyCon.c
    action	ChkIfEv.c
    action	ChkMaskEv.c
    action	ChkTypEv.c
    action	ChkTypWEv.c
    action	ChkWinEv.c
    action	ChPntCon.c
    action	ChProp.c
    action	ChSaveSet.c
    action	ChWAttrs.c
    action	ChWindow.c
    action	CirWin.c
    action	CirWinDn.c
    action	CirWinUp.c
    action	ClDisplay.c
    action	ClearArea.c
    action	Clear.c
    action	cmsAllCol.c
    action	cmsAllNCol.c
    action	cmsCmap.c
    action	cmsColNm.c
    action	cmsGlobls.c
    action	cmsInt.c
    action	cmsLkCol.c
    action	cmsMath.c
    action	cmsProp.c
    action	cmsTrig.c
    action	ConfWind.c
    action	ConnDis.c
    action	Context.c
    action	ConvSel.c
    action	CopyArea.c
    action	CopyCmap.c
    action	CopyGC.c
    action	CopyPlane.c
    action	CrBFData.c
    action	CrCmap.c
    action	CrCursor.c
    action	CrGC.c
    action	CrGlCur.c
    action	CrPFBData.c
    action	CrPixmap.c
    action	CrWindow.c
    action	Cursor.c
    action	CvCols.c
    action	CvColW.c
    action	DefCursor.c
    action	DelProp.c
    action	Depths.c
    action	DestSubs.c
    action	DestWind.c
    action	DisName.c
    action	DrArc.c
    action	DrArcs.c
    action	DrLine.c
    action	DrLines.c
    action	DrPoint.c
    action	DrPoints.c
    action	DrRect.c
    action	DrRects.c
    action	DrSegs.c
    action	ErrDes.c
    action	ErrHndlr.c
    action	evtomask.c
    action	EvToWire.c
    action	FetchName.c
    action	FillArc.c
    action	FillArcs.c
    action	FillPoly.c
    action	FillRct.c
    action	FillRcts.c
    action	FilterEv.c
    action	Flush.c
    action	Font.c
    action	FontInfo.c
    action	FontNames.c
    action	FreeCmap.c
    action	FreeCols.c
    action	FreeCurs.c
    action	FreeEData.c
    action	FreeGC.c
    action	FreePix.c
    action	FSSaver.c
    action	FSWrap.c
    action	GCMisc.c
    action	Geom.c
    action	GetAtomNm.c
    action	GetColor.c
    action	GetDflt.c
    action	GetFPath.c
    action	GetFProp.c
    action	GetGCVals.c
    action	GetGeom.c
    action	GetHColor.c
    action	GetHints.c
    action	GetIFocus.c
    action	GetImage.c
    action	GetKCnt.c
    action	GetMoEv.c
    action	GetNrmHint.c
    action	GetPCnt.c
    action	GetPntMap.c
    action	GetProp.c
    action	GetRGBCMap.c
    action	GetSOwner.c
    action	GetSSaver.c
    action	GetStCmap.c
    action	GetTxtProp.c
    action	GetWAttrs.c
    action	GetWMCMapW.c
    action	GetWMProto.c
    action	globals.c
    action	GrButton.c
    action	GrKeybd.c
    action	GrKey.c
    action	GrPointer.c
    action	GrServer.c
    action	Host.c
    action	HVC.c
    action	HVCGcC.c
    action	HVCGcV.c
    action	HVCGcVC.c
    action	HVCMnV.c
    action	HVCMxC.c
    action	HVCMxV.c
    action	HVCMxVC.c
    action	HVCMxVs.c
    action	HVCWpAj.c
    action	Iconify.c
    action	ICWrap.c
    action	IdOfPr.c
    action	IfEvent.c
    action	imCallbk.c
    action	imConv.c
    action	imDefFlt.c
    action	imDefIc.c
    action	imDefIm.c
    action	imDefLkup.c
    action	imDispch.c
    action	imEvToWire.c
    action	imExten.c
    action	imImSw.c
    action	imInsClbk.c
    action	imInt.c
    action	imKStoUCS.c
    action	imLcFlt.c
    action	imLcGIc.c
    action	imLcIc.c
    action	imLcIm.c
    action	imLcLkup.c
    action	imLcPrs.c
    action	imLcSIc.c
    action	imRmAttr.c
    action	imRm.c
    action	ImText16.c
    action	ImText.c
    action	imThaiFlt.c
    action	imThaiIc.c
    action	imThaiIm.c
    action	imTrans.c
    action	imTransR.c
    action	imTrX.c
    action	ImUtil.c
    action	IMWrap.c
    action	InitExt.c
    action	InsCmap.c
    action	IntAtom.c
    action	KeyBind.c
    action	KeysymStr.c
    action	KillCl.c
    action	Lab.c
    action	LabGcC.c
    action	LabGcL.c
    action	LabGcLC.c
    action	LabMnL.c
    action	LabMxC.c
    action	LabMxL.c
    action	LabMxLC.c
    action	LabWpAj.c
    action	lcCharSet.c
    action	lcConv.c
    action	lcCT.c
    action	lcDB.c
    action	lcDefConv.c
    action	lcDynamic.c
    action	lcEuc.c
    action	lcFile.c
    action	lcGenConv.c
    action	lcGeneric.c
    action	lcInit.c
    action	lcJis.c
    action	lcPrTxt.c
    action	lcPublic.c
    action	lcPubWrap.c
    action	lcRM.c
    action	lcSjis.c
    action	lcStd.c
    action	lcTxtPr.c
    action	lcUTF8.c
    action	lcUTF8Load.c
    action	lcUtil.c
    action	lcWrap.c
    action	LiHosts.c
    action	LiICmaps.c
    action	LiProps.c
    action	ListExt.c
    action	LoadFont.c
    action	LockDis.c
    action	locking.c
    action	LookupCol.c
    action	LowerWin.c
    action	LRGB.c
    action	Luv.c
    action	LuvGcC.c
    action	LuvGcL.c
    action	LuvGcLC.c
    action	LuvMnL.c
    action	LuvMxC.c
    action	LuvMxL.c
    action	LuvMxLC.c
    action	LuvWpAj.c
    action	Macros.c
    action	MapRaised.c
    action	MapSubs.c
    action	MapWindow.c
    action	MaskEvent.c
    action	mbWMProps.c
    action	mbWrap.c
    action	Misc.c
    action	ModMap.c
    action	MoveWin.c
    action	NextEvent.c
    action	OCWrap.c
    action	OfCCC.c
    action	omDefault.c
    action	omGeneric.c
    action	omImText.c
    action	omText.c
    action	omTextEsc.c
    action	omTextExt.c
    action	omTextPer.c
    action	OMWrap.c
    action	omXChar.c
    action	OpenDis.c
    action	os2Stubs.c
    action	ParseCmd.c
    action	ParseCol.c
    action	ParseGeom.c
    action	PeekEvent.c
    action	PeekIfEv.c
    action	Pending.c
    action	PixFormats.c
    action	PmapBgnd.c
    action	PmapBord.c
    action	PolyReg.c
    action	PolyTxt16.c
    action	PolyTxt.c
    action	PrOfId.c
    action	PropAlloc.c
    action	PutBEvent.c
    action	PutImage.c
    action	QBlack.c
    action	QBlue.c
    action	QGreen.c
    action	QRed.c
    action	Quarks.c
    action	QuBest.c
    action	QuCol.c
    action	QuColor.c
    action	QuColors.c
    action	QuCols.c
    action	QuCurShp.c
    action	QuExt.c
    action	QuKeybd.c
    action	QuPntr.c
    action	QuStipShp.c
    action	QuTextE16.c
    action	QuTextExt.c
    action	QuTileShp.c
    action	QuTree.c
    action	QWhite.c
    action	RaiseWin.c
    action	RdBitF.c
    action	RecolorC.c
    action	ReconfWin.c
    action	ReconfWM.c
    action	Region.c
    action	RegstFlt.c
    action	RepWindow.c
    action	RestackWs.c
    action	RotProp.c
    action	ScrResStr.c
    action	SelInput.c
    action	SendEvent.c
    action	SetBack.c
    action	SetCCC.c
    action	SetClMask.c
    action	SetClOrig.c
    action	SetCRects.c
    action	SetDashes.c
    action	SetFont.c
    action	SetFore.c
    action	SetFPath.c
    action	SetFunc.c
    action	SetGetCols.c
    action	SetHints.c
    action	SetIFocus.c
    action	SetLocale.c
    action	SetLStyle.c
    action	SetNrmHint.c
    action	SetPMask.c
    action	SetPntMap.c
    action	SetRGBCMap.c
    action	SetSOwner.c
    action	SetSSaver.c
    action	SetState.c
    action	SetStCmap.c
    action	SetStip.c
    action	SetTile.c
    action	SetTSOrig.c
    action	SetTxtProp.c
    action	SetWMCMapW.c
    action	SetWMProto.c
    action	StBytes.c
    action	StCol.c
    action	StColor.c
    action	StColors.c
    action	StCols.c
    action	StName.c
    action	StNColor.c
    action	StrKeysym.c
    action	StrToText.c
    action	Sync.c
    action	Synchro.c
    action	Text16.c
    action	Text.c
    action	TextExt16.c
    action	TextExt.c
    action	TextToStr.c
    action	TrCoords.c
    action	udcInf.c
    action	UIThrStubs.c
    action	UndefCurs.c
    action	UNDEFINED.c
    action	UngrabBut.c
    action	UngrabKbd.c
    action	UngrabKey.c
    action	UngrabPtr.c
    action	UngrabSvr.c
    action	UninsCmap.c
    action	UnldFont.c
    action	UnmapSubs.c
    action	UnmapWin.c
    action	utf8WMProps.c
    action	utf8Wrap.c
    action	uvY.c
    action	VisUtil.c
    action	WarpPtr.c
    action	wcWrap.c
    action	Window.c
    action	WinEvent.c
    action	Withdraw.c
    action	WMGeom.c
    action	WMProps.c
    action	WrBitF.c
    action	XDefaultIMIF.c
    action	XDefaultOMIF.c
    action	XKBAlloc.c
    action	XKBBell.c
    action	XKBBind.c
    action	XKB.c
    action	XKBCompat.c
    action	XKBCtrls.c
    action	XKBCvt.c
    action	XKBExtDev.c
    action	XKBGAlloc.c
    action	XKBGeom.c
    action	XKBGetByName.c
    action	XKBGetMap.c
    action	XKBleds.c
    action	XKBList.c
    action	XKBMAlloc.c
    action	XKBMisc.c
    action	XKBNames.c
    action	XKBRdBuf.c
    action	XKBSetGeom.c
    action	XKBSetMap.c
    action	XKBUse.c
    action	XlcDL.c
    action	XlcSL.c
    action	XlibAsync.c
    action	XlibInt.c
    action	XRGB.c
    action	Xrm.c
    action	xyY.c
    action	XYZ.c

    # man pages

    src_dir doc/man/X11/
    dst_dir lib/X11/man

    action	AllPlanes.man	AllPlanes.3
    action	BlkPScrn.man	BlkPScrn.3
    action	Dis3C.man	Dis3C.3
    action	ImageOrd.man	ImageOrd.3
    action	IsCKey.man	IsCKey.3
    action	XACHints.man	XACHints.3
    action	XAddHost.man	XAddHost.3
    action	XAIcSize.man	XAIcSize.3
    action	XAllColor.man	XAllColor.3
    action	XAllEvnt.man	XAllEvnt.3
    action	XAnyEvent.man	XAnyEvent.3
    action	XASCmap.man	XASCmap.3
    action	XASHints.man	XASHints.3
    action	XAWMHints.man	XAWMHints.3
    action	XButEvent.man	XButEvent.3
    action	XCirEvent.man	XCirEvent.3
    action	XCirREven.man	XCirREven.3
    action	XCKCntrl.man	XCKCntrl.3
    action	XCKMping.man	XCKMping.3
    action	XClrArea.man	XClrArea.3
    action	XCMEvent.man	XCMEvent.3
    action	XCmpEvent.man	XCmpEvent.3
    action	Xcms3CoC.man	Xcms3CoC.3
    action	XcmsAClr.man	XcmsAClr.3
    action	XcmsCClrs.man	XcmsCClrs.3
    action	XcmsClr.man	XcmsClr.3
    action	XcmsCre3C.man	XcmsCre3C.3
    action	XcmsD3C.man	XcmsD3C.3
    action	XcmsLaQMC.man	XcmsLaQMC.3
    action	XcmsLuQMC.man	XcmsLuQMC.3
    action	XcmsQBlk.man	XcmsQBlk.3
    action	XcmsQClr.man	XcmsQClr.3
    action	XcmsSClr.man	XcmsSClr.3
    action	XcmsSWP.man	XcmsSWP.3
    action	XcmsTQMC.man	XcmsTQMC.3
    action	XConEvent.man	XConEvent.3
    action	XConfWin.man	XConfWin.3
    action	XConREven.man	XConREven.3
    action	XCopyArea.man	XCopyArea.3
    action	XCPCntrl.man	XCPCntrl.3
    action	XCreCmap.man	XCreCmap.3
    action	XCreFCur.man	XCreFCur.3
    action	XCreFSet.man	XCreFSet.3
    action	XCreGC.man	XCreGC.3
    action	XCreIC.man	XCreIC.3
    action	XCreImage.man	XCreImage.3
    action	XCreOC.man	XCreOC.3
    action	XCrePmap.man	XCrePmap.3
    action	XCreReg.man	XCreReg.3
    action	XCreWin.man	XCreWin.3
    action	XCroEvent.man	XCroEvent.3
    action	XCSSet.man	XCSSet.3
    action	XCWAttrib.man	XCWAttrib.3
    action	XCWEvent.man	XCWEvent.3
    action	XDefCur.man	XDefCur.3
    action	XDesWin.man	XDesWin.3
    action	XDrArc.man	XDrArc.3
    action	XDrIStr.man	XDrIStr.3
    action	XDrLine.man	XDrLine.3
    action	XDrPoint.man	XDrPoint.3
    action	XDrRect.man	XDrRect.3
    action	XDrString.man	XDrString.3
    action	XDrText.man	XDrText.3
    action	XDWEvent.man	XDWEvent.3
    action	XEnumDB.man	XEnumDB.3
    action	XEofFSet.man	XEofFSet.3
    action	XERegion.man	XERegion.3
    action	XErrEvent.man	XErrEvent.3
    action	XExpEvent.man	XExpEvent.3
    action	XFCEvent.man	XFCEvent.3
    action	XFEvent.man	XFEvent.3
    action	XFillRect.man	XFillRect.3
    action	XFlush.man	XFlush.3
    action	XFofFSet.man	XFofFSet.3
    action	XFree.man	XFree.3
    action	XFSExt.man	XFSExt.3
    action	XGEEvent.man	XGEEvent.3
    action	XGetRes.man	XGetRes.3
    action	XGetVInfo.man	XGetVInfo.3
    action	XGetWAttr.man	XGetWAttr.3
    action	XGetWProp.man	XGetWProp.3
    action	XGEvent.man	XGEvent.3
    action	XGFDBase.man	XGFDBase.3
    action	XGrButton.man	XGrButton.3
    action	XGrKey.man	XGrKey.3
    action	XGrKeybrd.man	XGrKeybrd.3
    action	XGrPntr.man	XGrPntr.3
    action	XGrServer.man	XGrServer.3
    action	XIcWin.man	XIcWin.3
    action	XIfEvent.man	XIfEvent.3
    action	XInitial.man	XInitial.3
    action	XInstCmap.man	XInstCmap.3
    action	XIntConn.man	XIntConn.3
    action	XInternA.man	XInternA.3
    action	XInterReg.man	XInterReg.3
    action	XKMapEven.man	XKMapEven.3
    action	XListFont.man	XListFont.3
    action	XLoadFont.man	XLoadFont.3
    action	XLookKsym.man	XLookKsym.3
    action	XMapWin.man	XMapWin.3
    action	XmbDIStr.man	XmbDIStr.3
    action	XmbDStr.man	XmbDStr.3
    action	XmbDTxt.man	XmbDTxt.3
    action	XmbLStr.man	XmbLStr.3
    action	XmbRIC.man	XmbRIC.3
    action	XmbTEsc.man	XmbTEsc.3
    action	XmbTExt.man	XmbTExt.3
    action	XmbTPCEx.man	XmbTPCEx.3
    action	XMDBases.man	XMDBases.3
    action	XMEvent.man	XMEvent.3
    action	XMREvent.man	XMREvent.3
    action	XNEvent.man	XNEvent.3
    action	XNoOp.man	XNoOp.3
    action	XOpDsply.man	XOpDsply.3
    action	XOpenIM.man	XOpenIM.3
    action	XOpenOM.man	XOpenOM.3
    action	XParGeom.man	XParGeom.3
    action	XPEvent.man	XPEvent.3
    action	XPolyReg.man	XPolyReg.3
    action	XPutBEvnt.man	XPutBEvnt.3
    action	XPutImage.man	XPutImage.3
    action	XPutRes.man	XPutRes.3
    action	XQBSize.man	XQBSize.3
    action	XQColor.man	XQColor.3
    action	XQPointer.man	XQPointer.3
    action	XQTree.man	XQTree.3
    action	XRaiseWin.man	XRaiseWin.3
    action	XReadBF.man	XReadBF.3
    action	XRecCur.man	XRecCur.3
    action	XReparWin.man	XReparWin.3
    action	XREvent.man	XREvent.3
    action	XRMStr.man	XRMStr.3
    action	XRREvent.man	XRREvent.3
    action	XSCEvent.man	XSCEvent.3
    action	XSContext.man	XSContext.3
    action	XSeArcMod.man	XSeArcMod.3
    action	XSeClipO.man	XSeClipO.3
    action	XSeClosDM.man	XSeClosDM.3
    action	XSeCmd.man	XSeCmd.3
    action	XSeErrHan.man	XSeErrHan.3
    action	XSeEvent.man	XSeEvent.3
    action	XSeFillS.man	XSeFillS.3
    action	XSeFont.man	XSeFont.3
    action	XSeFontP.man	XSeFontP.3
    action	XSeInFoc.man	XSeInFoc.3
    action	XSeLAttr.man	XSeLAttr.3
    action	XSePMap.man	XSePMap.3
    action	XSeScSav.man	XSeScSav.3
    action	XSeSelOwn.man	XSeSelOwn.3
    action	XSeState.man	XSeState.3
    action	XSeTFHint.man	XSeTFHint.3
    action	XSeTile.man	XSeTile.3
    action	XSeTProp.man	XSeTProp.3
    action	XSEvent.man	XSEvent.3
    action	XSeWMCMac.man	XSeWMCMac.3
    action	XSeWMCWin.man	XSeWMCWin.3
    action	XSeWMINam.man	XSeWMINam.3
    action	XSeWMName.man	XSeWMName.3
    action	XSeWMProp.man	XSeWMProp.3
    action	XSeWMProt.man	XSeWMProt.3
    action	XSICFoc.man	XSICFoc.3
    action	XSICVals.man	XSICVals.3
    action	XSInput.man	XSInput.3
    action	XSLTTProp.man	XSLTTProp.3
    action	XSREvent.man	XSREvent.3
    action	XStBytes.man	XStBytes.3
    action	XStColors.man	XStColors.3
    action	XStTKsym.man	XStTKsym.3
    action	XSupLoc.man	XSupLoc.3
    action	XSync.man	XSync.3
    action	XTextExt.man	XTextExt.3
    action	XTextWid.man	XTextWid.3
    action	XThreads.man	XThreads.3
    action	XTLTTProp.man	XTLTTProp.3
    action	XTranWCo.man	XTranWCo.3
    action	XUmapEven.man	XUmapEven.3
    action	XUnmapWin.man	XUnmapWin.3
    action	XUQuark.man	XUQuark.3
    action	XVCNList.man	XVCNList.3
    action	XVEvent.man	XVEvent.3
    action	XWarpPntr.man	XWarpPntr.3

    # src/util

    src_dir lib/X11/util
    dst_dir lib/X11/src/util

    action	makekeys.c
    action	mkks.sh

    #---------------------
    #
    #  NLS
    #
    #---------------------

    src_dir nls
    dst_dir lib/X11/nls/

    action	compose.dir	compose.dir.pre
    action	locale.dir	locale.dir
    action	locale.alias	locale.alias.pre

    # armscii-8
    dst_dir lib/X11/nls/armscii-8
    src_dir nls/XLC_LOCALE
    action		armscii-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		armscii-8		XI18N_OBJS
    src_dir nls/Compose
    action		armscii-8		Compose.pre

    # C
    dst_dir lib/X11/nls/C
    src_dir nls/XLC_LOCALE
    action		C			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		C			XI18N_OBJS
    #src_dir nls/Compose
    #action		C			Compose.pre

    # en_US.UTF-8
    dst_dir lib/X11/nls/en_US.UTF-8
    src_dir nls/XLC_LOCALE
    action		en_US.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		en_US.UTF-8		XI18N_OBJS
    src_dir nls/Compose
    action		en_US.UTF-8		Compose.pre

    # georgian-academy
    dst_dir lib/X11/nls/georgian-academy
    src_dir nls/XLC_LOCALE
    action		georgian-academy	XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		georgian-academy	XI18N_OBJS
    src_dir nls/Compose
    action		georgian-academy	Compose.pre

    # georgian-ps
    dst_dir lib/X11/nls/georgian-ps
    src_dir nls/XLC_LOCALE
    action		georgian-ps		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		georgian-ps		XI18N_OBJS
    src_dir nls/Compose
    action		georgian-ps		Compose.pre

    # ibm-cp1133
    dst_dir lib/X11/nls/ibm-cp1133
    src_dir nls/XLC_LOCALE
    action		ibm-cp1133		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ibm-cp1133		XI18N_OBJS
    src_dir nls/Compose
    action		ibm-cp1133		Compose.pre

    # iscii-dev
    dst_dir lib/X11/nls/iscii-dev
    src_dir nls/XLC_LOCALE
    action		iscii-dev		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iscii-dev		XI18N_OBJS
    #src_dir nls/Compose
    #action		iscii-dev		Compose.pre

    # isiri-3342
    dst_dir lib/X11/nls/isiri-3342
    src_dir nls/XLC_LOCALE
    action		isiri-3342		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		isiri-3342		XI18N_OBJS
    #src_dir nls/Compose
    #action		isiri-3342		Compose.pre

    # iso8859-1
    dst_dir lib/X11/nls/iso8859-1
    src_dir nls/XLC_LOCALE
    action		iso8859-1		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-1		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-1		Compose.pre

    # iso8859-10
    dst_dir lib/X11/nls/iso8859-10
    src_dir nls/XLC_LOCALE
    action		iso8859-10		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-10		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-10		Compose.pre

    # iso8859-11
    dst_dir lib/X11/nls/iso8859-11
    src_dir nls/XLC_LOCALE
    action		iso8859-11		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-11		XI18N_OBJS
    #src_dir nls/Compose
    #action		iso8859-11		Compose.pre

    # iso8859-13
    dst_dir lib/X11/nls/iso8859-13
    src_dir nls/XLC_LOCALE
    action		iso8859-13		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-13		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-13		Compose.pre

    # iso8859-14
    dst_dir lib/X11/nls/iso8859-14
    src_dir nls/XLC_LOCALE
    action		iso8859-14		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-14		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-14		Compose.pre

    # iso8859-15
    dst_dir lib/X11/nls/iso8859-15
    src_dir nls/XLC_LOCALE
    action		iso8859-15		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-15		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-15		Compose.pre

    # iso8859-2
    dst_dir lib/X11/nls/iso8859-2
    src_dir nls/XLC_LOCALE
    action		iso8859-2		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-2		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-2		Compose.pre

    # iso8859-3
    dst_dir lib/X11/nls/iso8859-3
    src_dir nls/XLC_LOCALE
    action		iso8859-3		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-3		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-3		Compose.pre

    # iso8859-4
    dst_dir lib/X11/nls/iso8859-4
    src_dir nls/XLC_LOCALE
    action		iso8859-4		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-4		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-4		Compose.pre

    # iso8859-5
    dst_dir lib/X11/nls/iso8859-5
    src_dir nls/XLC_LOCALE
    action		iso8859-5		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-5		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-5		Compose.pre

    # iso8859-6
    dst_dir lib/X11/nls/iso8859-6
    src_dir nls/XLC_LOCALE
    action		iso8859-6		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-6		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-6		Compose.pre

    # iso8859-7
    dst_dir lib/X11/nls/iso8859-7
    src_dir nls/XLC_LOCALE
    action		iso8859-7		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-7		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-7		Compose.pre

    # iso8859-8
    dst_dir lib/X11/nls/iso8859-8
    src_dir nls/XLC_LOCALE
    action		iso8859-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-8		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-8		Compose.pre

    # iso8859-9
    dst_dir lib/X11/nls/iso8859-9
    src_dir nls/XLC_LOCALE
    action		iso8859-9		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-9		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-9		Compose.pre

    # iso8859-9e
    dst_dir lib/X11/nls/iso8859-9e
    src_dir nls/XLC_LOCALE
    action		iso8859-9e		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		iso8859-9e		XI18N_OBJS
    src_dir nls/Compose
    action		iso8859-9e		Compose.pre

    # ja
    dst_dir lib/X11/nls/ja
    src_dir nls/XLC_LOCALE
    action		ja			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ja			XI18N_OBJS
    src_dir nls/Compose
    action		ja			Compose.pre

    # ja.JIS
    dst_dir lib/X11/nls/ja.JIS
    src_dir nls/XLC_LOCALE
    action		ja.JIS			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ja.JIS			XI18N_OBJS
    src_dir nls/Compose
    action		ja.JIS			Compose.pre

    # ja_JP.UTF-8
    dst_dir lib/X11/nls/ja_JP.UTF-8
    src_dir nls/XLC_LOCALE
    action		ja_JP.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ja_JP.UTF-8		XI18N_OBJS
    #src_dir nls/Compose
    #action		ja_JP.UTF-8		Compose.pre

    # ja.S90
    dst_dir lib/X11/nls/ja.S90
    src_dir nls/XLC_LOCALE
    action		ja.S90			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ja.S90			XI18N_OBJS
    #src_dir nls/Compose
    #action		ja.S90			Compose.pre

    # ja.SJIS
    dst_dir lib/X11/nls/ja.SJIS
    src_dir nls/XLC_LOCALE
    action		ja.SJIS			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ja.SJIS			XI18N_OBJS
    src_dir nls/Compose
    action		ja.SJIS			Compose.pre

    # ja.U90
    dst_dir lib/X11/nls/ja.U90
    src_dir nls/XLC_LOCALE
    action		ja.U90			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ja.U90			XI18N_OBJS
    #src_dir nls/Compose
    #action		ja.U90			Compose.pre

    # ko
    dst_dir lib/X11/nls/ko
    src_dir nls/XLC_LOCALE
    action		ko			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ko			XI18N_OBJS
    src_dir nls/Compose
    action		ko			Compose.pre

    # koi8-c
    dst_dir lib/X11/nls/koi8-c
    src_dir nls/XLC_LOCALE
    action		koi8-c			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		koi8-c			XI18N_OBJS
    src_dir nls/Compose
    action		koi8-c			Compose.pre

    # koi8-r
    dst_dir lib/X11/nls/koi8-r
    src_dir nls/XLC_LOCALE
    action		koi8-r			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		koi8-r			XI18N_OBJS
    src_dir nls/Compose
    action		koi8-r			Compose.pre

    # koi8-u
    dst_dir lib/X11/nls/koi8-u
    src_dir nls/XLC_LOCALE
    action		koi8-u			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		koi8-u			XI18N_OBJS
    src_dir nls/Compose
    action		koi8-u			Compose.pre

    # ko_KR.UTF-8
    dst_dir lib/X11/nls/ko_KR.UTF-8
    src_dir nls/XLC_LOCALE
    action		ko_KR.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		ko_KR.UTF-8		XI18N_OBJS
    #src_dir nls/Compose
    #action		ko_KR.UTF-8		Compose.pre

    # microsoft-cp1251
    dst_dir lib/X11/nls/microsoft-cp1251
    src_dir nls/XLC_LOCALE
    action		microsoft-cp1251	XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		microsoft-cp1251	XI18N_OBJS
    #src_dir nls/Compose
    #action		microsoft-cp1251	Compose.pre

    # microsoft-cp1255
    dst_dir lib/X11/nls/microsoft-cp1255
    src_dir nls/XLC_LOCALE
    action		microsoft-cp1255	XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		microsoft-cp1255	XI18N_OBJS
    #src_dir nls/Compose
    #action		microsoft-cp1255	Compose.pre

    # microsoft-cp1256
    dst_dir lib/X11/nls/microsoft-cp1256
    src_dir nls/XLC_LOCALE
    action		microsoft-cp1256	XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		microsoft-cp1256	XI18N_OBJS
    #src_dir nls/Compose
    #action		microsoft-cp1256	Compose.pre

    # mulelao-1
    dst_dir lib/X11/nls/mulelao-1
    src_dir nls/XLC_LOCALE
    action		mulelao-1		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		mulelao-1		XI18N_OBJS
    src_dir nls/Compose
    action		mulelao-1		Compose.pre

    # nokhchi-1
    dst_dir lib/X11/nls/nokhchi-1
    src_dir nls/XLC_LOCALE
    action		nokhchi-1		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		nokhchi-1		XI18N_OBJS
    #src_dir nls/Compose
    #action		nokhchi-1		Compose.pre

    # pt_BR.UTF-8
    dst_dir lib/X11/nls/pt_BR.UTF-8
    src_dir nls/XLC_LOCALE
    action		pt_BR.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		pt_BR.UTF-8		XI18N_OBJS
    src_dir nls/Compose
    action		pt_BR.UTF-8		Compose.pre

    # tatar-cyr
    dst_dir lib/X11/nls/tatar-cyr
    src_dir nls/XLC_LOCALE
    action		tatar-cyr		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		tatar-cyr		XI18N_OBJS
    #src_dir nls/Compose
    #action		tatar-cyr		Compose.pre

    # th_TH
    dst_dir lib/X11/nls/th_TH
    src_dir nls/XLC_LOCALE
    action		th_TH			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		th_TH			XI18N_OBJS
    #src_dir nls/Compose
    #action		th_TH			Compose.pre

    # th_TH.UTF-8
    dst_dir lib/X11/nls/th_TH.UTF-8
    src_dir nls/XLC_LOCALE
    action		th_TH.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		th_TH.UTF-8		XI18N_OBJS
    #src_dir nls/Compose
    #action		th_TH.UTF-8		Compose.pre

    # tscii-0
    dst_dir lib/X11/nls/tscii-0
    src_dir nls/XLC_LOCALE
    action		tscii-0			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		tscii-0			XI18N_OBJS
    #src_dir nls/Compose
    #action		tscii-0			Compose.pre

    # vi_VN.tcvn
    dst_dir lib/X11/nls/vi_VN.tcvn
    src_dir nls/XLC_LOCALE
    action		vi_VN.tcvn		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		vi_VN.tcvn		XI18N_OBJS
    src_dir nls/Compose
    action		vi_VN.tcvn		Compose.pre

    # vi_VN.viscii
    dst_dir lib/X11/nls/vi_VN.viscii
    src_dir nls/XLC_LOCALE
    action		vi_VN.viscii		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		vi_VN.viscii		XI18N_OBJS
    src_dir nls/Compose
    action		vi_VN.viscii		Compose.pre

    # zh_CN
    dst_dir lib/X11/nls/zh_CN
    src_dir nls/XLC_LOCALE
    action		zh_CN			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_CN			XI18N_OBJS
    #src_dir nls/Compose
    #action		zh_CN			Compose.pre

    # zh_CN.gb18030
    dst_dir lib/X11/nls/zh_CN.gb18030
    src_dir nls/XLC_LOCALE
    action		zh_CN.gb18030		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_CN.gb18030		XI18N_OBJS
    src_dir nls/Compose
    action		zh_CN.gb18030		Compose.pre

    # zh_CN.gbk
    dst_dir lib/X11/nls/zh_CN.gbk
    src_dir nls/XLC_LOCALE
    action		zh_CN.gbk		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_CN.gbk		XI18N_OBJS
    src_dir nls/Compose
    action		zh_CN.gbk		Compose.pre

    # zh_CN.UTF-8
    dst_dir lib/X11/nls/zh_CN.UTF-8
    src_dir nls/XLC_LOCALE
    action		zh_CN.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_CN.UTF-8		XI18N_OBJS
    #src_dir nls/Compose
    #action		zh_CN.UTF-8		Compose.pre

    # zh_HK.big5
    dst_dir lib/X11/nls/zh_HK.big5
    src_dir nls/XLC_LOCALE
    action		zh_HK.big5		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_HK.big5		XI18N_OBJS
    src_dir nls/Compose
    action		zh_HK.big5		Compose.pre

    # zh_HK.big5hkscs
    dst_dir lib/X11/nls/zh_HK.big5hkscs
    src_dir nls/XLC_LOCALE
    action		zh_HK.big5hkscs		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_HK.big5hkscs		XI18N_OBJS
    src_dir nls/Compose
    action		zh_HK.big5hkscs		Compose.pre

    # zh_HK.UTF-8
    dst_dir lib/X11/nls/zh_HK.UTF-8
    src_dir nls/XLC_LOCALE
    action		zh_HK.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_HK.UTF-8		XI18N_OBJS
    #src_dir nls/Compose
    #action		zh_HK.UTF-8		Compose.pre

    # zh_TW
    dst_dir lib/X11/nls/zh_TW
    src_dir nls/XLC_LOCALE
    action		zh_TW			XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_TW			XI18N_OBJS
    src_dir nls/Compose
    action		zh_TW			Compose.pre

    # zh_TW.big5
    dst_dir lib/X11/nls/zh_TW.big5
    src_dir nls/XLC_LOCALE
    action		zh_TW.big5		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_TW.big5		XI18N_OBJS
    src_dir nls/Compose
    action		zh_TW.big5		Compose.pre

    # zh_TW.UTF-8
    dst_dir lib/X11/nls/zh_TW.UTF-8
    src_dir nls/XLC_LOCALE
    action		zh_TW.UTF-8		XLC_LOCALE.pre
    src_dir nls/XI18N_OBJS
    action		zh_TW.UTF-8		XI18N_OBJS
    #src_dir nls/Compose
    #action		zh_TW.UTF-8		Compose.pre


    # lcuniconv

    src_dir lib/X11/lcUniConv
    dst_dir lib/X11/src/lcUniConv

    action	README

    action	8bit_tab_to_h.c
    action	armscii_8.h
    action	ascii.h
    action	big5_emacs.h
    action	big5.h
    action	cjk_tab_to_h.c
    action	COPYRIGHT
    action	cp1133.h
    action	cp1251.h
    action	cp1255.h
    action	cp1256.h
    action	gb2312.h
    action	georgian_academy.h
    action	georgian_ps.h
    action	iso8859_10.h
    action	iso8859_11.h
    action	iso8859_13.h
    action	iso8859_14.h
    action	iso8859_15.h
    action	iso8859_16.h
    action	iso8859_1.h
    action	iso8859_2.h
    action	iso8859_3.h
    action	iso8859_4.h
    action	iso8859_5.h
    action	iso8859_6.h
    action	iso8859_7.h
    action	iso8859_8.h
    action	iso8859_9e.h
    action	iso8859_9.h
    action	jisx0201.h
    action	jisx0208.h
    action	jisx0212.h
    action	koi8_c.h
    action	koi8_r.h
    action	koi8_u.h
    action	ksc5601.h
    action	mulelao.h
    action	tatar_cyr.h
    action	tcvn.h
    action	tis620.h
    action	ucs2be.h
    action	utf8.h
    action	viscii.h
}

function symlink_lib_ice() {
    src_dir lib/ICE
    dst_dir lib/ICE/src
    
    action	accept.c
    action	authutil.c
    action	connect.c
    action	error.c
    action	getauth.c
    action	iceauth.c
    action	listen.c
    action	listenwk.c
    action	locking.c
    action	misc.c
    action	ping.c
    action	process.c
    action	protosetup.c
    action	register.c
    action	replywait.c
    action	setauth.c
    action	shutdown.c
    action	watch.c

    action	globals.h
    action	ICElibint.h

    dst_dir lib/ICE/include/X11/ICE

    action	ICEconn.h
    action	ICE.h
    action	ICElib.h
    action	ICEmsg.h
    action	ICEproto.h
    action	ICEutil.h
}

function symlink_lib_sm() {
    src_dir lib/SM
    dst_dir lib/SM/src

    action	sm_auth.c
    action	sm_client.c
    action	sm_error.c
    action	sm_genid.c
    action	sm_manager.c
    action	sm_misc.c
    action	sm_process.c

    action	globals.h
    action	SMlibint.h

    dst_dir lib/SM/include/X11/SM
    
    action	SM.h
    action	SMlib.h
    action	SMproto.h
}

function symlink_lib_xt() {
    src_dir lib/Xt
    
    # Public headers

    dst_dir lib/Xt/include/X11/

    action	Composite.h
    action	CompositeP.h
    action	Constraint.h
    action	ConstrainP.h
    action	Core.h
    action	CoreP.h
    action	Intrinsic.h
    action	IntrinsicP.h
    action	Object.h
    action	ObjectP.h
    action	RectObj.h
    action	RectObjP.h
    action	ShellP.h
    action	Vendor.h
    action	VendorP.h

    # Private headers

    dst_dir lib/Xt/src

    action	CallbackI.h
    action	ConvertI.h
    action	CreateI.h
    action	EventI.h
    action	HookObjI.h
    action	InitialI.h
    action	IntrinsicI.h
    action	PassivGraI.h
    action	ResConfigP.h
    action	ResourceI.h
    action	SelectionI.h
    action	ShellI.h
    action	ThreadsI.h
    action	TranslateI.h
    action	VarargsI.h
    action	Xtos.h

    # Source

    dst_dir lib/Xt/src

    action	ActionHook.c
    action	Alloc.c
    action	ArgList.c
    action	Callback.c
    action	ClickTime.c
    action	Composite.c
    action	Constraint.c
    action	Convert.c
    action	Converters.c
    action	Core.c
    action	Create.c
    action	Destroy.c
    action	Display.c
    action	Error.c
    action	Event.c
    action	EventUtil.c
    action	Functions.c
    action	GCManager.c
    action	Geometry.c
    action	GetActKey.c
    action	GetResList.c
    action	GetValues.c
    action	HookObj.c
    action	Hooks.c
    action	Initialize.c
    action	Intrinsic.c
    action	Keyboard.c
    action	Manage.c
    action	NextEvent.c
    action	Object.c
    action	PassivGrab.c
    action	Pointer.c
    action	Popup.c
    action	PopupCB.c
    action	RectObj.c
    action	ResConfig.c
    action	Resources.c
    action	Selection.c
    action	SetSens.c
    action	SetValues.c
    action	SetWMCW.c
    action	sharedlib.c
    action	Shell.c
    action	Threads.c
    action	TMaction.c
    action	TMgrab.c
    action	TMkey.c
    action	TMparse.c
    action	TMprint.c
    action	TMstate.c
    action	Varargs.c
    action	VarCreate.c
    action	VarGet.c
    action	Vendor.c

    # utils

    src_dir lib/Xt/util
    dst_dir lib/Xt/util

    action	Shell.ht
    action	StrDefs.ct
    action	StrDefs.ht
    action	string.list

    src_dir config/util/

    action	makestrs.c

    # man pages

    src_dir doc/man/Xt
    dst_dir lib/Xt/man

    action	XtActHook.man	XtActHook.3
    action	XtAddAct.man	XtAddAct.3
    action	XtAddCbk.man	XtAddCbk.3
    action	XtAddEHand.man	XtAddEHand.3
    action	XtAddETReg.man	XtAddETReg.3
    action	XtAddGrab.man	XtAddGrab.3
    action	XtAddIn.man	XtAddIn.3
    action	XtAllocGC.man	XtAllocGC.3
    action	XtAppAAct.man	XtAppAAct.3
    action	XtAppAC.man	XtAppAC.3
    action	XtAppAI.man	XtAppAI.3
    action	XtAppASig.man	XtAppASig.3
    action	XtAppATO.man	XtAppATO.3
    action	XtAppAWP.man	XtAppAWP.3
    action	XtAppCSh.man	XtAppCSh.3
    action	XtAppE.man	XtAppE.3
    action	XtAppEM.man	XtAppEM.3
    action	XtAppGEDB.man	XtAppGEDB.3
    action	XtAppGSTO.man	XtAppGSTO.3
    action	XtAppInit.man	XtAppInit.3
    action	XtAppLock.man	XtAppLock.3
    action	XtAppNEv.man	XtAppNEv.3
    action	XtAppRCR.man	XtAppRCR.3
    action	XtAppSEF.man	XtAppSEF.3
    action	XtAppSetFR.man	XtAppSetFR.3
    action	XtAppSTC.man	XtAppSTC.3
    action	XtBEMask.man	XtBEMask.3
    action	XtBlockH.man	XtBlockH.3
    action	XtCallActP.man	XtCallActP.3
    action	XtCallAFoc.man	XtCallAFoc.3
    action	XtCallCbks.man	XtCallCbks.3
    action	XtClass.man	XtClass.3
    action	XtClickT.man	XtClickT.3
    action	XtConfWid.man	XtConfWid.3
    action	XtConvert.man	XtConvert.3
    action	XtConvSt.man	XtConvSt.3
    action	XtCreACon.man	XtCreACon.3
    action	XtCreASh.man	XtCreASh.3
    action	XtCreateSR.man	XtCreateSR.3
    action	XtCrePSh.man	XtCrePSh.3
    action	XtCreWid.man	XtCreWid.3
    action	XtCreWin.man	XtCreWin.3
    action	XtDisACon.man	XtDisACon.3
    action	XtDisplayI.man	XtDisplayI.3
    action	XtDisplay.man	XtDisplay.3
    action	XtDStrCW.man	XtDStrCW.3
    action	XtErr.man	XtErr.3
    action	XtErrM.man	XtErrM.3
    action	XtExtEvDis.man	XtExtEvDis.3
    action	XtFindF.man	XtFindF.3
    action	XtGEDB.man	XtGEDB.3
    action	XtGetActK.man	XtGetActK.3
    action	XtGetActL.man	XtGetActL.3
    action	XtGetANC.man	XtGetANC.3
    action	XtGetAres.man	XtGetAres.3
    action	XtGetClExt.man	XtGetClExt.3
    action	XtGetDisp.man	XtGetDisp.3
    action	XtGetGC.man	XtGetGC.3
    action	XtGetKFoc.man	XtGetKFoc.3
    action	XtGetRList.man	XtGetRList.3
    action	XtGetSP.man	XtGetSP.3
    action	XtGetSres.man	XtGetSres.3
    action	XtGetSR.man	XtGetSR.3
    action	XtGetSTO.man	XtGetSTO.3
    action	XtGetSValI.man	XtGetSValI.3
    action	XtGetSVal.man	XtGetSVal.3
    action	XtGrabKey.man	XtGrabKey.3
    action	XtHookOD.man	XtHookOD.3
    action	XtInit.man	XtInit.3
    action	XtInitWC.man	XtInitWC.3
    action	XtKeysym.man	XtKeysym.3
    action	XtLastProc.man	XtLastProc.3
    action	XtMakGReq.man	XtMakGReq.3
    action	XtMalloc.man	XtMalloc.3
    action	XtManChild.man	XtManChild.3
    action	XtMapWid.man	XtMapWid.3
    action	XtName.man	XtName.3
    action	XtNameTWid.man	XtNameTWid.3
    action	XtNextEv.man	XtNextEv.3
    action	XtOffset.man	XtOffset.3
    action	XtOpenApp.man	XtOpenApp.3
    action	XtOwnSel.man	XtOwnSel.3
    action	XtParATab.man	XtParATab.3
    action	XtParent.man	XtParent.3
    action	XtParTTab.man	XtParTTab.3
    action	XtPopdown.man	XtPopdown.3
    action	XtPopup.man	XtPopup.3
    action	XtProcLock.man	XtProcLock.3
    action	XtQueryGeo.man	XtQueryGeo.3
    action	XtRealize.man	XtRealize.3
    action	XtRegDraw.man	XtRegDraw.3
    action	XtRegGA.man	XtRegGA.3
    action	XtResPA.man	XtResPA.3
    action	XtResPath.man	XtResPath.3
    action	XtSession.man	XtSession.3
    action	XtSetArg.man	XtSetArg.3
    action	XtSetKFoc.man	XtSetKFoc.3
    action	XtSetKTr.man	XtSetKTr.3
    action	XtSetLangP.man	XtSetLangP.3
    action	XtSetSens.man	XtSetSens.3
    action	XtSetSP.man	XtSetSP.3
    action	XtSetVal.man	XtSetVal.3
    action	XtSetWMC.man	XtSetWMC.3
    action	XtStrCW.man	XtStrCW.3
    action	XtThreadI.man	XtThreadI.3
    action	XtTransC.man	XtTransC.3
    action	XtVaCrArgL.man	XtVaCrArgL.3
}

function symlink_lib_xmu() {
    src_dir lib/Xmu
    dst_dir lib/Xmu/include/X11/Xmu

    action	Atoms.h
    action	CharSet.h
    action	CloseHook.h
    action	Converters.h
    action	CurUtil.h
    action	CvtCache.h
    action	DisplayQue.h
    action	Drawing.h
    action	Editres.h
    action	EditresP.h
    action	Error.h
    action	ExtAgent.h
    action	Initer.h
    action	Lookup.h
    action	Misc.h
    action	StdCmap.h
    action	StdSel.h
    action	SysUtil.h
    action	WhitePoint.h
    action	WidgetNode.h
    action	WinUtil.h
    action	Xct.h
    action	Xmu.h
    
    dst_dir lib/Xmu/src

    action	AllCmap.c
    action	Atoms.c
    action	ClientWin.c
    action	Clip.c
    action	CloseHook.c
    action	CmapAlloc.c
    action	CrCmap.c
    action	CrPixFBit.c
    action	CursorName.c
    action	CvtCache.c
    action	CvtStdSel.c
    action	DefErrMsg.c
    action	DelCmap.c
    action	DisplayQue.c
    action	Distinct.c
    action	DrawLogo.c
    action	DrRndRect.c
    action	EditresCom.c
    action	ExtAgent.c
    action	FToCback.c
    action	GetHost.c
    action	GrayPixmap.c
    action	Initer.c
    action	LocBitmap.c
    action	Lookup.c
    action	LookupCmap.c
    action	Lower.c
    action	RdBitF.c
    action	ScrOfWin.c
    action	ShapeWidg.c
    action	sharedlib.c
    action	StdCmap.c
    action	StrToBmap.c
    action	StrToBS.c
    action	StrToCurs.c
    action	StrToGrav.c
    action	StrToJust.c
    action	StrToLong.c
    action	StrToOrnt.c
    action	StrToShap.c
    action	StrToWidg.c
    action	UpdMapHint.c
    action	VisCmap.c
    action	WidgetNode.c
    action	Xct.c
}

function symlink_lib_xp() {
    src_dir lib/Xp
    dst_dir lib/Xp/src

    action	XpAttr.c
    action	XpContext.c
    action	XpDoc.c
    action	XpExtUtil.c
    action	XpExtVer.c
    action	XpGetData.c
    action	XpImageRes.c
    action	XpInput.c
    action	XpJob.c
    action	XpLocale.c
    action	XpNotifyPdm.c
    action	XpPage.c
    action	XpPageDim.c
    action	XpPrinter.c
    action	XpPutData.c
    action	XpScreens.c

    action	XpExtUtil.h

    # man pages
    src_dir doc/man/Xp
    dst_dir lib/Xp/man

    action	libXp.man			libXp.3
    action	XpCancelDoc.man			XpCancelDoc.3
    action	XpCancelJob.man			XpCancelJob.3
    action	XpCancelPage.man		XpCancelPage.3
    action	XpCreateContext.man		XpCreateContext.3
    action	XpDestroyContext.man		XpDestroyContext.3
    action	XpEndDoc.man			XpEndDoc.3
    action	XpEndJob.man			XpEndJob.3
    action	XpEndPage.man			XpEndPage.3
    action	XpFreePrinterList.man		XpFreePrinterList.3
    action	XpGetAttributes.man		XpGetAttributes.3
    action	XpGetContext.man		XpGetContext.3
    action	XpGetDocumentData.man		XpGetDocumentData.3
    action	XpGetImageResolution.man	XpGetImageResolution.3
    action	XpGetLocaleHinter.man		XpGetLocaleHinter.3
    action	XpGetOneAttribute.man		XpGetOneAttribute.3
    action	XpGetPageDimensions.man		XpGetPageDimensions.3
    action	XpGetPdmStartParams.man		XpGetPdmStartParams.3
    action	XpGetPrinterList.man		XpGetPrinterList.3
    action	XpGetScreenOfContext.man	XpGetScreenOfContext.3
    action	XpInputSelected.man		XpInputSelected.3
    action	XpPutDocumentData.man		XpPutDocumentData.3
    action	XpQueryExtension.man		XpQueryExtension.3
    action	XpQueryScreens.man		XpQueryScreens.3
    action	XpQueryVersion.man		XpQueryVersion.3
    action	XpRehashPrinterList.man		XpRehashPrinterList.3
    action	XpSelectInput.man		XpSelectInput.3
    action	XpSetAttributes.man		XpSetAttributes.3
    action	XpSetContext.man		XpSetContext.3
    action	XpSetImageResolution.man	XpSetImageResolution.3
    action	XpSetLocaleHinter.man		XpSetLocaleHinter.3
    action	XpStartDoc.man			XpStartDoc.3
    action	XpStartJob.man			XpStartJob.3
    action	XpStartPage.man			XpStartPage.3
}

function symlink_lib_xfont() {
    src_dir lib/font/FreeType
    dst_dir lib/Xfont/src/FreeType

    action      ft.h
    action      ftenc.c
    action      ftfuncs.c
    action      ftfuncs.h
    action      ftsystem.c
    action      fttools.c
    action      xttcap.c
    action      xttcap.h

    src_dir lib/font/bitmap
    dst_dir lib/Xfont/src/bitmap

    action      bdfint.h
    action      bdfread.c
    action      bdfutils.c
    action      bitmap.c
    action      bitmapfunc.c
    action      bitmaputil.c
    action      bitscale.c
    action      fontink.c
    action      pcf.h
    action      pcfread.c
    action      pcfwrite.c
    action      snfread.c
    action      snfstr.h

    src_dir lib/font/builtins
    dst_dir lib/Xfont/src/builtins

    action      buildfont
    action      builtin.h
    action      dir.c
    action      file.c
    action      fonts.c
    action      fpe.c
    action      render.c

    src_dir lib/font/fc
    dst_dir lib/Xfont/src/fc

    action      fsconvert.c
    action      fserve.c
    action      fserve.h
    action      fservestr.h
    action      fsio.c
    action      fsio.h
    action      fslibos.h

    src_dir lib/font/fontcache
    dst_dir lib/Xfont/src/fontcache

    action      fcqueue.h
    action      fontcache.c
    action      fontcache.h

    src_dir lib/font/fontfile
    dst_dir lib/Xfont/src/fontfile

    action      bitsource.c
    action      bufio.c
    action      decompress.c
    action      defaults.c
    action      dirfile.c
    action      encparse.c
    action      ffcheck.c
    action      fileio.c
    action      filewr.c
    action      fontdir.c
    action      fontenc.c
    action      fontencI.h
    action      fontencc.c
    action      fontfile.c
    action      fontscale.c
    action      gunzip.c
    action      printerfont.c
    action      register.c
    action      renderers.c

    src_dir lib/font/include
    dst_dir lib/Xfont/include

    action      bitmap.h
    action      bufio.h
    action      fntfil.h
    action      fntfilio.h
    action      fntfilst.h
    action      fontenc.h
    action      fontencc.h
    action      fontmisc.h
    action      fontmod.h
    action      fontshow.h
    action      fontutil.h
    action      fontxlfd.h

    src_dir lib/font/stubs
    dst_dir lib/Xfont/src/stubs

    action      cauthgen.c
    action      csignal.c
    action      delfntcid.c
    action      errorf.c
    action      fatalerror.c
    action      findoldfnt.c
    action      getcres.c
    action      getdefptsize.c
    action      getnewfntcid.c
    action      gettime.c
    action      initfshdl.c
    action      regfpefunc.c
    action      rmfshdl.c
    action      servclient.c
    action      setfntauth.c
    action      stfntcfnt.c
    action      stubs.h
    action      xpstubs.c

    src_dir lib/font/util
    dst_dir lib/Xfont/src/util

    action      atom.c
    action      fontaccel.c
    action      fontnames.c
    action      fontutil.c
    action      fontxlfd.c
    action      format.c
    action      miscutil.c
    action      patcache.c
    action      private.c
    action      utilbitmap.c
}

function symlink_lib() {
    symlink_lib_dmx
    symlink_lib_composite
    symlink_lib_damage
    symlink_lib_fixes 
    symlink_lib_xau
    symlink_lib_xtrans
    symlink_lib_xdmcp
    symlink_lib_x11
    symlink_lib_ice
    symlink_lib_sm
    symlink_lib_xt
    symlink_lib_xext
    symlink_lib_xmu
    symlink_lib_xp
    symlink_lib_xfont
#    symlink_lib_randr
#    symlink_lib_record
#    symlink_lib_render
#    symlink_lib_resource
#    symlink_lib_sm
#    symlink_lib_xaw
#    ...
}


#########
#
#	The app module
#
#########

function symlink_app_twm() {
    src_dir programs/twm
    dst_dir app/twm/src

    action	add_window.c
    action	add_window.h
    action	cursor.c
    action	deftwmrc.sed
    action	events.c
    action	events.h
    action	gc.c
    action	gc.h
    action	gram.y
    action	iconmgr.c
    action	iconmgr.h
    action	icons.c
    action	icons.h
    action	lex.l
    action	list.c
    action	list.h
    action	menus.c
    action	menus.h
    action	parse.c
    action	parse.h
    action	resize.c
    action	resize.h
    action	screen.h
    action	session.c
    action	session.h
    action	siconify.bm
    action	system.twmrc
    action	twm.c
    action	twm.h
    action	util.c
    action	util.h
    action	version.c
    action	version.h

    dst_dir app/twm/man

    action	twm.man

    src_dir programs/twm/sample-twmrc
    dst_dir app/twm/sample-twmrc

    action	jim.twmrc
    action	keith.twmrc
    action	lemke.twmrc
}

function symlink_app_xdpyinfo() {
    src_dir programs/xdpyinfo
    dst_dir app/xdpyinfo

    action	xdpyinfo.c
    action	xdpyinfo.man
}

function symlink_app() {
    symlink_app_twm
    symlink_app_xdpyinfo
#    ...
}


#########
#
#	The xserver module
#
#########

function symlink_xserver_dix() {
    src_dir programs/Xserver/dix
    dst_dir xserver/xorg/dix

    action	atom.c
    action	colormap.c
    action	cursor.c
    action	devices.c
    action	dispatch.c
    action	dispatch.h
    action	dixfonts.c
    action	dixutils.c
    action	events.c
    action	extension.c
    action	ffs.c
    action	gc.c
    action	globals.c
    action	glyphcurs.c
    action	grabs.c
    action	initatoms.c
    action	main.c
    action	pixmap.c
    action	privates.c
    action	property.c
    action	resource.c
    action	swaprep.c
    action	swapreq.c
    action	tables.c
    action	window.c
    action	xpstubs.c

    action	buildatoms
    action	BuiltInAtoms
    action	CHANGES
}

function symlink_xserver_include() {
    src_dir programs/Xserver/include
    dst_dir xserver/xorg/include

    action	bstore.h
    action	bstorestr.h
    action	closestr.h
    action	closure.h
    action	colormap.h
    action	colormapst.h
    action	cursor.h
    action	cursorstr.h
    action	dixevents.h
    action	dixfont.h
    action	dixfontstr.h
    action	dixgrabs.h
    action	dix.h
    action	dixstruct.h
    action	exevents.h
    action	extension.h
    action	extinit.h
    action	extnsionst.h
    action	gc.h
    action	gcstruct.h
    action	globals.h
    action	input.h
    action	inputstr.h
    action	misc.h
    action	miscstruct.h
    action	opaque.h
    action	os.h
    action	pixmap.h
    action	pixmapstr.h
    action	property.h
    action	propertyst.h
    action	region.h
    action	regionstr.h
    action	resource.h
    action	rgb.h
    action	screenint.h
    action	scrnintstr.h
    action	selection.h
    action	servermd.h
    action	site.h
    action	swaprep.h
    action	swapreq.h
    action	validate.h
    action	window.h
    action	windowstr.h
    action	XIstubs.h
}

function symlink_xserver() {
    symlink_xserver_dix
    symlink_xserver_include
#    ...
}


#########
#
#	The driver module
#
#########

function symlink_driver_ati() {
    src_dir programs/Xserver/hw/xfree86/drivers/ati
    dst_dir driver/xaa-ati/src

    action	atiaccel.c
    action	atiaccel.h
    action	atiadapter.c
    action	atiadapter.h
    action	atiadjust.c
    action	atiadjust.h
    action	atiaudio.c
    action	atiaudio.h
    action	atibank.c
    action	atibank.h
    action	atibus.c
    action	atibus.h
    action	ati.c
    action	atichip.c
    action	atichip.h
    action	aticlock.c
    action	aticlock.h
    action	aticonfig.c
    action	aticonfig.h
    action	aticonsole.c
    action	aticonsole.h
    action	aticrtc.h
    action	aticursor.c
    action	aticursor.h
    action	atidac.c
    action	atidac.h
    action	atidecoder.c
    action	atidecoder.h
    action	atidga.c
    action	atidga.h
    action	atidri.c
    action	atidri.h
    action	atidripriv.h
    action	atidsp.c
    action	atidsp.h
    action	atifillin.c
    action	atifillin.h
    action	ati.h
    action	atii2c.c
    action	atii2c.h
    action	atiident.c
    action	atiident.h
    action	atiio.h
    action	atiload.c
    action	atiload.h
    action	atilock.c
    action	atilock.h
    action	atimach64accel.c
    action	atimach64accel.h
    action	atimach64.c
    action	atimach64cursor.c
    action	atimach64cursor.h
    action	atimach64.h
    action	atimach64i2c.c
    action	atimach64i2c.h
    action	atimach64io.c
    action	atimach64io.h
    action	atimach64xv.c
    action	atimach64xv.h
    action	atimisc.c
    action	atimode.c
    action	atimode.h
    action	atimodule.c
    action	atimodule.h
    action	atimono.h
    action	atioption.c
    action	atioption.h
    action	atipreinit.c
    action	atipreinit.h
    action	atiprint.c
    action	atiprint.h
    action	atipriv.h
    action	atiprobe.c
    action	atiprobe.h
    action	atiregs.h
    action	atirgb514.c
    action	atirgb514.h
    action	atiscreen.c
    action	atiscreen.h
    action	atistruct.h
    action	atituner.c
    action	atituner.h
    action	atiutil.c
    action	atiutil.h
    action	ativalid.c
    action	ativalid.h
    action	ativersion.h
    action	ativga.c
    action	ativga.h
    action	ativgaio.c
    action	ativgaio.h
    action	atividmem.c
    action	atividmem.h
    action	atiwonder.c
    action	atiwonder.h
    action	atiwonderio.c
    action	atiwonderio.h
    action	atixv.c
    action	atixv.h
    action	generic_bus.h
    action	mach64_common.h
    action	mach64_dri.h
    action	mach64_sarea.h
    action	r128_accel.c
    action	r128_chipset.h
    action	r128_common.h
    action	r128_cursor.c
    action	r128_dga.c
    action	r128_dri.c
    action	r128_dri.h
    action	r128_dripriv.h
    action	r128_driver.c
    action	r128.h
    action	r128_misc.c
    action	r128_probe.c
    action	r128_probe.h
    action	r128_reg.h
    action	r128_sarea.h
    action	r128_version.h
    action	r128_video.c
    action	radeon_accel.c
    action	radeon_accelfuncs.c
    action	radeon_bios.c
    action	radeon_chipset.h
    action	radeon_common.h
    action	radeon_cursor.c
    action	radeon_dga.c
    action	radeon_dri.c
    action	radeon_dri.h
    action	radeon_dripriv.h
    action	radeon_driver.c
    action	radeon.h
    action	radeon_macros.h
    action	radeon_mergedfb.c
    action	radeon_mergedfb.h
    action	radeon_misc.c
    action	radeon_mm_i2c.c
    action	radeon_probe.c
    action	radeon_probe.h
    action	radeon_reg.h
    action	radeon_render.c
    action	radeon_sarea.h
    action	radeon_version.h
    action	radeon_video.c
    action	radeon_video.h
    action	radeon_vip.c
    action	theatre200.c
    action	theatre200.h
    action	theatre200_module.c
    action	theatre.c
    action	theatre_detect.c
    action	theatre_detect.h
    action	theatre_detect_module.c
    action	theatre.h
    action	theatre_module.c
    action	theatre_reg.h

    dst_dir driver/xaa-ati/man

    action	ati.man
    action	r128.man
    action	radeon.man
}

function symlink_driver_mouse() {
    src_dir programs/Xserver/hw/xfree86/input/mouse
    dst_dir driver/xf86input-mouse/src

    action	mouse.c
    action	mouse.h
    action	mousePriv.h
    action	pnp.c

    dst_dir driver/xf86input-mouse/man

    action	mouse.man
}

function symlink_driver() {
    symlink_driver_ati
    symlink_driver_mouse
#    symlink_driver_damage
#    symlink_driver_fixes
#    symlink_driver_ice
#    symlink_driver_randr
#    symlink_driver_record
#    symlink_driver_render
#    symlink_driver_resource
#    symlink_driver_sm
#    symlink_driver_x11
#    symlink_driver_xau
#    symlink_driver_xaw
#    ...
}


#########
#
#	The font module
#
#########

function symlink_font_100dpi() {
    src_dir fonts/bdf/100dpi
    dst_dir font/100dpi

    action	charB08.bdf
    action	charB10.bdf
    action	charB12.bdf
    action	charB14.bdf
    action	charB18.bdf
    action	charB24.bdf
    action	charBI08.bdf
    action	charBI10.bdf
    action	charBI12.bdf
    action	charBI14.bdf
    action	charBI18.bdf
    action	charBI24.bdf
    action	charI08.bdf
    action	charI10.bdf
    action	charI12.bdf
    action	charI14.bdf
    action	charI18.bdf
    action	charI24.bdf
    action	charR08.bdf
    action	charR10.bdf
    action	charR12.bdf
    action	charR14.bdf
    action	charR18.bdf
    action	charR24.bdf
    action	courB08.bdf
    action	courB08-L1.bdf
    action	courB10.bdf
    action	courB10-L1.bdf
    action	courB12.bdf
    action	courB12-L1.bdf
    action	courB14.bdf
    action	courB14-L1.bdf
    action	courB18.bdf
    action	courB18-L1.bdf
    action	courB24.bdf
    action	courB24-L1.bdf
    action	courBO08.bdf
    action	courBO08-L1.bdf
    action	courBO10.bdf
    action	courBO10-L1.bdf
    action	courBO12.bdf
    action	courBO12-L1.bdf
    action	courBO14.bdf
    action	courBO14-L1.bdf
    action	courBO18.bdf
    action	courBO18-L1.bdf
    action	courBO24.bdf
    action	courBO24-L1.bdf
    action	courO08.bdf
    action	courO08-L1.bdf
    action	courO10.bdf
    action	courO10-L1.bdf
    action	courO12.bdf
    action	courO12-L1.bdf
    action	courO14.bdf
    action	courO14-L1.bdf
    action	courO18.bdf
    action	courO18-L1.bdf
    action	courO24.bdf
    action	courO24-L1.bdf
    action	courR08.bdf
    action	courR08-L1.bdf
    action	courR10.bdf
    action	courR10-L1.bdf
    action	courR12.bdf
    action	courR12-L1.bdf
    action	courR14.bdf
    action	courR14-L1.bdf
    action	courR18.bdf
    action	courR18-L1.bdf
    action	courR24.bdf
    action	courR24-L1.bdf
    action	helvB08.bdf
    action	helvB08-L1.bdf
    action	helvB10.bdf
    action	helvB10-L1.bdf
    action	helvB12.bdf
    action	helvB12-L1.bdf
    action	helvB14.bdf
    action	helvB14-L1.bdf
    action	helvB18.bdf
    action	helvB18-L1.bdf
    action	helvB24.bdf
    action	helvB24-L1.bdf
    action	helvBO08.bdf
    action	helvBO08-L1.bdf
    action	helvBO10.bdf
    action	helvBO10-L1.bdf
    action	helvBO12.bdf
    action	helvBO12-L1.bdf
    action	helvBO14.bdf
    action	helvBO14-L1.bdf
    action	helvBO18.bdf
    action	helvBO18-L1.bdf
    action	helvBO24.bdf
    action	helvBO24-L1.bdf
    action	helvO08.bdf
    action	helvO08-L1.bdf
    action	helvO10.bdf
    action	helvO10-L1.bdf
    action	helvO12.bdf
    action	helvO12-L1.bdf
    action	helvO14.bdf
    action	helvO14-L1.bdf
    action	helvO18.bdf
    action	helvO18-L1.bdf
    action	helvO24.bdf
    action	helvO24-L1.bdf
    action	helvR08.bdf
    action	helvR08-L1.bdf
    action	helvR10.bdf
    action	helvR10-L1.bdf
    action	helvR12.bdf
    action	helvR12-L1.bdf
    action	helvR14.bdf
    action	helvR14-L1.bdf
    action	helvR18.bdf
    action	helvR18-L1.bdf
    action	helvR24.bdf
    action	helvR24-L1.bdf
    action	lubB08.bdf
    action	lubB08-L1.bdf
    action	lubB10.bdf
    action	lubB10-L1.bdf
    action	lubB12.bdf
    action	lubB12-L1.bdf
    action	lubB14.bdf
    action	lubB14-L1.bdf
    action	lubB18.bdf
    action	lubB18-L1.bdf
    action	lubB19.bdf
    action	lubB19-L1.bdf
    action	lubB24.bdf
    action	lubB24-L1.bdf
    action	lubBI08.bdf
    action	lubBI08-L1.bdf
    action	lubBI10.bdf
    action	lubBI10-L1.bdf
    action	lubBI12.bdf
    action	lubBI12-L1.bdf
    action	lubBI14.bdf
    action	lubBI14-L1.bdf
    action	lubBI18.bdf
    action	lubBI18-L1.bdf
    action	lubBI19.bdf
    action	lubBI19-L1.bdf
    action	lubBI24.bdf
    action	lubBI24-L1.bdf
    action	lubI08.bdf
    action	lubI08-L1.bdf
    action	lubI10.bdf
    action	lubI10-L1.bdf
    action	lubI12.bdf
    action	lubI12-L1.bdf
    action	lubI14.bdf
    action	lubI14-L1.bdf
    action	lubI18.bdf
    action	lubI18-L1.bdf
    action	lubI19.bdf
    action	lubI19-L1.bdf
    action	lubI24.bdf
    action	lubI24-L1.bdf
    action	luBIS08.bdf
    action	luBIS08-L1.bdf
    action	luBIS10.bdf
    action	luBIS10-L1.bdf
    action	luBIS12.bdf
    action	luBIS12-L1.bdf
    action	luBIS14.bdf
    action	luBIS14-L1.bdf
    action	luBIS18.bdf
    action	luBIS18-L1.bdf
    action	luBIS19.bdf
    action	luBIS19-L1.bdf
    action	luBIS24.bdf
    action	luBIS24-L1.bdf
    action	lubR08.bdf
    action	lubR08-L1.bdf
    action	lubR10.bdf
    action	lubR10-L1.bdf
    action	lubR12.bdf
    action	lubR12-L1.bdf
    action	lubR14.bdf
    action	lubR14-L1.bdf
    action	lubR18.bdf
    action	lubR18-L1.bdf
    action	lubR19.bdf
    action	lubR19-L1.bdf
    action	lubR24.bdf
    action	lubR24-L1.bdf
    action	luBS08.bdf
    action	luBS08-L1.bdf
    action	luBS10.bdf
    action	luBS10-L1.bdf
    action	luBS12.bdf
    action	luBS12-L1.bdf
    action	luBS14.bdf
    action	luBS14-L1.bdf
    action	luBS18.bdf
    action	luBS18-L1.bdf
    action	luBS19.bdf
    action	luBS19-L1.bdf
    action	luBS24.bdf
    action	luBS24-L1.bdf
    action	luIS08.bdf
    action	luIS08-L1.bdf
    action	luIS10.bdf
    action	luIS10-L1.bdf
    action	luIS12.bdf
    action	luIS12-L1.bdf
    action	luIS14.bdf
    action	luIS14-L1.bdf
    action	luIS18.bdf
    action	luIS18-L1.bdf
    action	luIS19.bdf
    action	luIS19-L1.bdf
    action	luIS24.bdf
    action	luIS24-L1.bdf
    action	luRS08.bdf
    action	luRS08-L1.bdf
    action	luRS10.bdf
    action	luRS10-L1.bdf
    action	luRS12.bdf
    action	luRS12-L1.bdf
    action	luRS14.bdf
    action	luRS14-L1.bdf
    action	luRS18.bdf
    action	luRS18-L1.bdf
    action	luRS19.bdf
    action	luRS19-L1.bdf
    action	luRS24.bdf
    action	luRS24-L1.bdf
    action	lutBS08.bdf
    action	lutBS08-L1.bdf
    action	lutBS10.bdf
    action	lutBS10-L1.bdf
    action	lutBS12.bdf
    action	lutBS12-L1.bdf
    action	lutBS14.bdf
    action	lutBS14-L1.bdf
    action	lutBS18.bdf
    action	lutBS18-L1.bdf
    action	lutBS19.bdf
    action	lutBS19-L1.bdf
    action	lutBS24.bdf
    action	lutBS24-L1.bdf
    action	lutRS08.bdf
    action	lutRS08-L1.bdf
    action	lutRS10.bdf
    action	lutRS10-L1.bdf
    action	lutRS12.bdf
    action	lutRS12-L1.bdf
    action	lutRS14.bdf
    action	lutRS14-L1.bdf
    action	lutRS18.bdf
    action	lutRS18-L1.bdf
    action	lutRS19.bdf
    action	lutRS19-L1.bdf
    action	lutRS24.bdf
    action	lutRS24-L1.bdf
    action	ncenB08.bdf
    action	ncenB08-L1.bdf
    action	ncenB10.bdf
    action	ncenB10-L1.bdf
    action	ncenB12.bdf
    action	ncenB12-L1.bdf
    action	ncenB14.bdf
    action	ncenB14-L1.bdf
    action	ncenB18.bdf
    action	ncenB18-L1.bdf
    action	ncenB24.bdf
    action	ncenB24-L1.bdf
    action	ncenBI08.bdf
    action	ncenBI08-L1.bdf
    action	ncenBI10.bdf
    action	ncenBI10-L1.bdf
    action	ncenBI12.bdf
    action	ncenBI12-L1.bdf
    action	ncenBI14.bdf
    action	ncenBI14-L1.bdf
    action	ncenBI18.bdf
    action	ncenBI18-L1.bdf
    action	ncenBI24.bdf
    action	ncenBI24-L1.bdf
    action	ncenI08.bdf
    action	ncenI08-L1.bdf
    action	ncenI10.bdf
    action	ncenI10-L1.bdf
    action	ncenI12.bdf
    action	ncenI12-L1.bdf
    action	ncenI14.bdf
    action	ncenI14-L1.bdf
    action	ncenI18.bdf
    action	ncenI18-L1.bdf
    action	ncenI24.bdf
    action	ncenI24-L1.bdf
    action	ncenR08.bdf
    action	ncenR08-L1.bdf
    action	ncenR10.bdf
    action	ncenR10-L1.bdf
    action	ncenR12.bdf
    action	ncenR12-L1.bdf
    action	ncenR14.bdf
    action	ncenR14-L1.bdf
    action	ncenR18.bdf
    action	ncenR18-L1.bdf
    action	ncenR24.bdf
    action	ncenR24-L1.bdf
    action	symb08.bdf
    action	symb10.bdf
    action	symb12.bdf
    action	symb14.bdf
    action	symb18.bdf
    action	symb24.bdf
    action	tech14.bdf
    action	techB14.bdf
    action	term14.bdf
    action	termB14.bdf
    action	timB08.bdf
    action	timB08-L1.bdf
    action	timB10.bdf
    action	timB10-L1.bdf
    action	timB12.bdf
    action	timB12-L1.bdf
    action	timB14.bdf
    action	timB14-L1.bdf
    action	timB18.bdf
    action	timB18-L1.bdf
    action	timB24.bdf
    action	timB24-L1.bdf
    action	timBI08.bdf
    action	timBI08-L1.bdf
    action	timBI10.bdf
    action	timBI10-L1.bdf
    action	timBI12.bdf
    action	timBI12-L1.bdf
    action	timBI14.bdf
    action	timBI14-L1.bdf
    action	timBI18.bdf
    action	timBI18-L1.bdf
    action	timBI24.bdf
    action	timBI24-L1.bdf
    action	timI08.bdf
    action	timI08-L1.bdf
    action	timI10.bdf
    action	timI10-L1.bdf
    action	timI12.bdf
    action	timI12-L1.bdf
    action	timI14.bdf
    action	timI14-L1.bdf
    action	timI18.bdf
    action	timI18-L1.bdf
    action	timI24.bdf
    action	timI24-L1.bdf
    action	timR08.bdf
    action	timR08-L1.bdf
    action	timR10.bdf
    action	timR10-L1.bdf
    action	timR12.bdf
    action	timR12-L1.bdf
    action	timR14.bdf
    action	timR14-L1.bdf
    action	timR18.bdf
    action	timR18-L1.bdf
    action	timR24.bdf
    action	timR24-L1.bdf
    action	UTB___10.bdf
    action	UTB___10-L1.bdf
    action	UTB___12.bdf
    action	UTB___12-L1.bdf
    action	UTB___14.bdf
    action	UTB___14-L1.bdf
    action	UTB___18.bdf
    action	UTB___18-L1.bdf
    action	UTB___24.bdf
    action	UTB___24-L1.bdf
    action	UTBI__10.bdf
    action	UTBI__10-L1.bdf
    action	UTBI__12.bdf
    action	UTBI__12-L1.bdf
    action	UTBI__14.bdf
    action	UTBI__14-L1.bdf
    action	UTBI__18.bdf
    action	UTBI__18-L1.bdf
    action	UTBI__24.bdf
    action	UTBI__24-L1.bdf
    action	UTI___10.bdf
    action	UTI___10-L1.bdf
    action	UTI___12.bdf
    action	UTI___12-L1.bdf
    action	UTI___14.bdf
    action	UTI___14-L1.bdf
    action	UTI___18.bdf
    action	UTI___18-L1.bdf
    action	UTI___24.bdf
    action	UTI___24-L1.bdf
    action	UTRG__10.bdf
    action	UTRG__10-L1.bdf
    action	UTRG__12.bdf
    action	UTRG__12-L1.bdf
    action	UTRG__14.bdf
    action	UTRG__14-L1.bdf
    action	UTRG__18.bdf
    action	UTRG__18-L1.bdf
    action	UTRG__24.bdf
    action	UTRG__24-L1.bdf

    action	fonts.alias

    action	LU_LEGALNOTICE
}

function symlink_font() {
    symlink_font_100dpi
#    symlink_font_75dpi
#    symlink_font_cyrillic
#    symlink_font_misc
#    symlink_font_CID
#    symlink_font_Ethiopic
#    symlink_font_Meltho
#    symlink_font_Speedo
#    symlink_font_TTF
#    symlink_font_Type1
#    symlink_font_encodings
#    symlink_font_util
}


#########
#
#	The doc module
#
#########

function symlink_doc_old() {
    src_dir doc/hardcopy
    dst_dir doc/old/hardcopy

    src_dir doc/hardcopy/BDF
    dst_dir doc/old/hardcopy/BDF

    action	bdf.PS.gz

    src_dir doc/hardcopy/CTEXT
    dst_dir doc/old/hardcopy/CTEXT

    action	ctext.PS.gz

    src_dir doc/hardcopy/FSProtocol
    dst_dir doc/old/hardcopy/FSProtocol

    action	fsproto.PS.gz

    src_dir doc/hardcopy/i18n
    dst_dir doc/old/hardcopy/i18n

    action	Framework.PS.gz
    action	LocaleDB.PS.gz
    action	Trans.PS.gz

    src_dir doc/hardcopy/ICCCM
    dst_dir doc/old/hardcopy/ICCCM

    action	icccm.PS.gz
    action	icccm.idx.PS.gz

    src_dir doc/hardcopy/ICE
    dst_dir doc/old/hardcopy/ICE

    action	ICElib.PS.gz
    action	ice.PS.gz

    src_dir doc/hardcopy/man
    dst_dir doc/old/hardcopy/man

    action	man.PS.gz

    src_dir doc/hardcopy/rstart
    dst_dir doc/old/hardcopy/rstart

    action	rstart.PS.gz

    src_dir doc/hardcopy/RX
    dst_dir doc/old/hardcopy/RX

    action	RX.PS.gz

    src_dir doc/hardcopy/saver
    dst_dir doc/old/hardcopy/saver

    action	saver.PS.gz

    src_dir doc/hardcopy/SM
    dst_dir doc/old/hardcopy/SM

    action	SMlib.PS.gz
    action	xsmp.PS.gz

    src_dir doc/hardcopy/X11
    dst_dir doc/old/hardcopy/X11

    action	xlib.PS.gz
    action	xlib.idx.PS.gz

    src_dir doc/hardcopy/Xaw
    dst_dir doc/old/hardcopy/Xaw

    action	widg.idx.PS.gz
    action	widgets.PS.gz

    src_dir doc/hardcopy/XDMCP
    dst_dir doc/old/hardcopy/XDMCP

    action	xdmcp.PS.gz

    src_dir doc/hardcopy/Xext
    dst_dir doc/old/hardcopy/Xext

    action	AppGroup.PS.gz
    action	DPMS.PS.gz
    action	DPMSLib.PS.gz
    action	bigreq.PS.gz
    action	buffer.PS.gz
    action	dbe.PS.gz
    action	dbelib.PS.gz
    action	evi.PS.gz
    action	lbx.PS.gz
    action	lbx.html
    action	lbxTOC.html
    action	lbxalg.PS.gz
    action	mit-shm.PS.gz
    action	record.PS.gz
    action	recordlib.PS.gz
    action	security.PS.gz
    action	shape.PS.gz
    action	shapelib.PS.gz
    action	sync.PS.gz
    action	synclib.PS.gz
    action	tog-cup.PS.gz
    action	xc-misc.PS.gz
    action	xtest.PS.gz
    action	xtestlib.PS.gz

    src_dir doc/hardcopy/xfs
    dst_dir doc/old/hardcopy/xfs

    action	design.PS.gz

    src_dir doc/hardcopy/Xi
    dst_dir doc/old/hardcopy/Xi

    action	lib.PS.gz
    action	port.PS.gz
    action	proto.PS.gz

    src_dir doc/hardcopy/XIM
    dst_dir doc/old/hardcopy/XIM

    action	xim.PS.gz

    src_dir doc/hardcopy/XKB
    dst_dir doc/old/hardcopy/XKB

    action	XKBlib.ps.gz
    action	XKBproto.ps.gz

    src_dir doc/hardcopy/XLFD
    dst_dir doc/old/hardcopy/XLFD

    action	xlfd.PS.gz

    src_dir doc/hardcopy/Xmu
    dst_dir doc/old/hardcopy/Xmu

    action	xmu.PS.gz

    src_dir doc/hardcopy/XPRINT
    dst_dir doc/old/hardcopy/XPRINT

    action	Xprint_FAQ.html
    action	Xprint_FAQ.txt
    action	Xprint_FAQ.xml
    action	Xprint_old_FAQ.txt
    action	docbook.css
    action	dtprint_fspec.PS.gz
    action	xp_library.PS.gz
    action	xp_proto.PS.gz

    src_dir doc/hardcopy/XProtocol
    dst_dir doc/old/hardcopy/XProtocol

    action	proto.PS.gz
    action	proto.idx.PS.gz

    src_dir doc/hardcopy/Xserver
    dst_dir doc/old/hardcopy/Xserver

    action	Xprt.PS.gz
    action	analysis.PS.gz
    action	appgroup.PS.gz
    action	ddx.PS.gz
    action	fontlib.PS.gz
    action	secint.PS.gz

    src_dir doc/hardcopy/Xt
    dst_dir doc/old/hardcopy/Xt

    action	intr.idx.PS.gz
    action	intrinsics.PS.gz

    src_dir doc/hardcopy/xterm
    dst_dir doc/old/hardcopy/xterm

    action	ctlseqs.PS.gz

    src_dir doc/hardcopy/xtrans
    dst_dir doc/old/hardcopy/xtrans

    action	Xtrans.PS.gz

    src_dir doc/hardcopy/Xv
    dst_dir doc/old/hardcopy/Xv

    action	video
    action	xv-protocol-v2.PS

    src_dir doc/man/general
    dst_dir doc/old/man/general

    action	Consortium.man
    action	security.man
    action	Standards.man
    action	X.man
    action	XOrgFoundation.man
    action	Xprint.man
    action	XProjectTeam.man

    # FIXME: other man pages should be moved to the appropriate library

    src_dir doc/misc
    dst_dir doc/old/misc

    action	xlogo.epsi

    src_dir doc/specs
    dst_dir doc/old/specs

    action	specindex.html

    src_dir doc/specs/BDF
    dst_dir doc/old/specs/BDF

    action	bdf.ms
    action	fig1.ps
    action	fig2.ps

    src_dir doc/specs/CTEXT
    dst_dir doc/old/specs/CTEXT

    action	ctext.tbl.ms

    src_dir doc/specs/FSProtocol
    dst_dir doc/old/specs/FSProtocol

    action	protocol.ms

    src_dir doc/specs/GL
    dst_dir doc/old/specs/GL

    action	libGL.txt

    src_dir doc/specs/i18n
    dst_dir doc/old/specs/i18n

    action	Framework.ms
    action	LocaleDB.ms
    action	Trans.ms

    src_dir doc/specs/ICCCM
    dst_dir doc/old/specs/ICCCM

    action	icccm.ms
    action	indexmacros.t

    src_dir doc/specs/ICE
    dst_dir doc/old/specs/ICE

    action	ICElib.ms
    action	ice.ms

    src_dir doc/specs/PM
    dst_dir doc/old/specs/PM

    action	PM_spec

    src_dir doc/specs/Randr
    dst_dir doc/old/specs/Randr

    action	protocol.txt

    src_dir doc/specs/Render
    dst_dir doc/old/specs/Render

    action	library
    action	protocol

    src_dir doc/specs/rstart
    dst_dir doc/old/specs/rstart

    action	fix.awk
    action	fix.nawk
    action	fix.sed
    action	rstart.ms
    action	rstartd.txt
    action	tmac.rfc

    src_dir doc/specs/RX
    dst_dir doc/old/specs/RX

    action	RX.mif

    src_dir doc/specs/saver
    dst_dir doc/old/specs/saver

    action	saver.ms

    src_dir doc/specs/SIAddresses
    dst_dir doc/old/specs/SIAddresses

    action	IPv6.txt
    action	README
    action	hostname.txt
    action	localuser.txt

    src_dir doc/specs/SM
    dst_dir doc/old/specs/SM

    action	SMlib.ms
    action	xsmp.ms

    src_dir doc/specs/X11
    dst_dir doc/old/specs/X11

    action	AppA
    action	AppB
    action	AppC
    action	AppD
    action	CH01
    action	CH02
    action	CH03
    action	CH04
    action	CH05
    action	CH06
    action	CH07
    action	CH08
    action	CH09
    action	CH10
    action	CH11
    action	CH12
    action	CH13
    action	CH14
    action	CH15
    action	CH16
    action	abstract.t
    action	credits.t
    action	glossary
    action	indexmacros.t
    action	postproc

    src_dir doc/specs/Xaw
    dst_dir doc/old/specs/Xaw

    action	AsciiSink
    action	AsciiSource
    action	AsciiText
    action	Box
    action	CH1
    action	CH2
    action	CH3.intro
    action	CH4.intro
    action	CH5.intro
    action	CH6.intro
    action	CH7.intro
    action	Command
    action	Dialog
    action	Form
    action	Grip
    action	Label
    action	List
    action	MenuButton
    action	Paned
    action	Panner
    action	Porthole
    action	Repeater
    action	Scrollbar
    action	Simple
    action	SimpleMenu
    action	Sme
    action	SmeBSB
    action	SmeLine
    action	StripChart
    action	TPage_Credits
    action	Template
    action	Text
    action	TextActions
    action	TextCustom
    action	TextFuncs
    action	TextSink
    action	TextSource
    action	Toggle
    action	Tree
    action	Viewport
    action	Xtk.widg.front
    action	Xtk.widgets
    action	block.awk
    action	fixindex.awk
    action	strings.mit
    action	strings.xaw
    action	widg.idxmac.t

    src_dir doc/specs/XDMCP
    dst_dir doc/old/specs/XDMCP

    action	xdmcp.ms

    src_dir doc/specs/Xext
    dst_dir doc/old/specs/Xext

    action	AppGroup.mif
    action	DPMS.ms
    action	DPMSLib.ms
    action	bigreq.ms
    action	buffer.ms
    action	dbe.tex
    action	dbelib.tex
    action	evi.ms
    action	lbx.book
    action	lbx.mif
    action	lbxalg.mif
    action	mit-shm.ms
    action	record.ms
    action	recordlib.ms
    action	security.tex
    action	shape.ms
    action	shapelib.ms
    action	sync.tex
    action	synclib.tex
    action	tog-cup.ms
    action	xc-misc.ms
    action	xtest.ms
    action	xtest1.info
    action	xtest1.mm
    action	xtestlib.ms

    src_dir doc/specs/xfs
    dst_dir doc/old/specs/xfs

    action	FSlib.doc
    action	design.ms

    src_dir doc/specs/Xi
    dst_dir doc/old/specs/Xi

    action	encoding.ms
    action	library.ms
    action	porting.ms
    action	protocol.ms

    src_dir doc/specs/XIM
    dst_dir doc/old/specs/XIM

    action	xim.ms

    src_dir doc/specs/XKB/Proto
    dst_dir doc/old/specs/XKB/Proto

    action	XKBproto.book
    action	dflttrns.fm5
    action	encoding.fm5
    action	keysyms.fm5
    action	protocol.fm5
    action	prototoc.doc
    action	title.fm5
    action	types.fm5

    src_dir doc/specs/XKB/XKBlib
    dst_dir doc/old/specs/XKB/XKBlib

    action	XKBlib.book
    action	allchaps.fm5
    action	allchaps.ix
    action	allchaps.lof
    action	allchaps.lot
    action	allchaps.ps
    action	allchaps.toc
    action	fonts.fm5
    action	title.fm5

    src_dir doc/specs/XLFD
    dst_dir doc/old/specs/XLFD

    action	xlfd.tbl.ms

    src_dir doc/specs/Xmu
    dst_dir doc/old/specs/Xmu

    action	Xmu.ms

    src_dir doc/specs/XPRINT
    dst_dir doc/old/specs/XPRINT

    action	xp_library.book
    action	xp_library.mif
    action	xp_libraryIX.doc
    action	xp_libraryTOC.doc
    action	xp_library_cov.mif
    action	xp_proto.book
    action	xp_proto.mif
    action	xp_protoIX.doc
    action	xp_protoTOC.doc
    action	xp_proto_cov.mif

    src_dir doc/specs/XProtocol
    dst_dir doc/old/specs/XProtocol

    action	X11.encoding
    action	X11.keysyms
    action	X11.protocol
    action	glossary
    action	indexmacros.t
    action	postproc

    src_dir doc/specs/Xserver
    dst_dir doc/old/specs/Xserver

    action	Xprt.book
    action	Xprt.mif
    action	XprtIX.doc
    action	XprtTOC.doc
    action	Xprt_cov.mif
    action	analysis.tex
    action	appgroup.ms
    action	ddx.tbl.ms
    action	fontlib.ms
    action	secint.tex

    src_dir doc/specs/Xt
    dst_dir doc/old/specs/Xt

    action	CH01
    action	CH02
    action	CH03
    action	CH04
    action	CH05
    action	CH06
    action	CH07
    action	CH08
    action	CH09
    action	CH10
    action	CH11
    action	CH12
    action	CH13
    action	Xtk.intr.front
    action	appA
    action	appB
    action	appC
    action	appD
    action	appE
    action	appF
    action	intr.idxmac.t
    action	postproc
    action	strings.mit

    src_dir doc/specs/xterm
    dst_dir doc/old/specs/xterm

    action	ctlseqs.ms

    src_dir doc/specs/xtrans
    dst_dir doc/old/specs/xtrans

    action	Xtrans.mm

    src_dir doc/specs/Xv
    dst_dir doc/old/specs/Xv

    action	xv-protocol-v2.txt

    src_dir doc/specs/XvMC
    dst_dir doc/old/specs/XvMC

    action	XvMC_API.txt

    src_dir doc/util
    dst_dir doc/old/util

    action	block.awk
    action	fixindex.awk
    action	indexmacros.t
    action	macros.t
}

function symlink_doc() {
    symlink_doc_old
#    symlink_doc_man
#    ...
}


#########
#
#	The util module
#
#########

function symlink_util_cf() {
    src_dir config/cf
    dst_dir util/cf

    action	Amoeba.cf
    action	apollo.cf
    action	bsd.cf
    action	bsdi.cf
    action	bsdiLib.rules
    action	bsdiLib.tmpl
    action	bsdLib.rules
    action	bsdLib.tmpl
    action	cde.rules
    action	cde.tmpl
    action	convex.cf
    action	cray.cf
    action	cross.def
    action	cross.rules
    action	cygwin.cf
    action	cygwin.rules
    action	cygwin.tmpl
    action	darwin.cf
    action	darwinLib.rules
    action	darwinLib.tmpl
    action	DGUX.cf
    action	dmx.cf
    action	DragonFly.cf
    action	FreeBSD.cf
    action	fujitsu.cf
    action	generic.cf
    action	gnu.cf
    action	gnuLib.rules
    action	gnuLib.tmpl
    action	hp.cf
    action	hpLib.rules
    action	hpLib.tmpl
    action	ibm.cf
    action	ibmLib.rules
    action	ibmLib.tmpl
    action	Imake.cf
    action	Imake.rules
    action	Imake.tmpl
    action	isc.cf
    action	Library.tmpl
    action	linux.cf
    action	lnxdoc.rules
    action	lnxdoc.tmpl
    action	lnxLib.rules
    action	lnxLib.tmpl
    action	luna.cf
    action	lynx.cf
    action	mach.cf
    action	macII.cf
    action	mingw.cf
    action	mingw.rules
    action	mingw.tmpl
    action	minix.cf
    action	Mips.cf
    action	Motif.rules
    action	Motif.tmpl
    action	moto.cf
    action	ncr.cf
    action	nec.cf
    action	necLib.rules
    action	necLib.tmpl
    action	NetBSD.cf
    action	noop.rules
    action	nto.cf
    action	nto.rules
    action	Oki.cf
    action	oldlib.rules
    action	OpenBSD.cf
    action	OpenBSDLib.rules
    action	OpenBSDLib.tmpl
    action	os2.cf
    action	os2def.db
    action	os2Lib.rules
    action	os2Lib.tmpl
    action	os2.rules
    action	osf1.cf
    action	osfLib.rules
    action	osfLib.tmpl
    action	pegasus.cf
    action	QNX4.cf
    action	QNX4.rules
    action	README
    action	sco5.cf
    action	sco.cf
    action	scoLib.rules
    action	sequent.cf
    action	sequentLib.rules
    action	ServerLib.tmpl
    action	Server.tmpl
    action	sgi.cf
    action	sgiLib.rules
    action	sgiLib.tmpl
    action	site.def
    action	site.sample
    action	sony.cf
    action	sun.cf
    action	sunLib.rules
    action	sunLib.tmpl
    action	sv3Lib.rules
    action	sv3Lib.tmpl
    action	sv4Lib.rules
    action	sv4Lib.tmpl
    action	svr3.cf
    action	svr4.cf
    action	Threads.tmpl
    action	ultrix.cf
    action	usl.cf
    action	Win32.cf
    action	Win32.rules
    action	WinLib.tmpl
    action	X11.rules
    action	X11.tmpl
    action	x386.cf
    action	xf86.rules
    action	xf86site.def
    action	xf86.tmpl
    action	xfree86.cf
    action	xorg.cf
    action	xorgsite.def
    action	xorg.tmpl
    action	xorgversion.def
    action	xprint_host.def
}

function symlink_util_imake() {
    src_dir config/imake
    dst_dir util/imake

    action	ccimake.c
    action	imake.c
    action	imake.man
    action	imakemdep.h
    action	imakesvc.cmd
    action	Makefile.ini
}

function symlink_util_makedepend() {
    src_dir config/makedepend
    dst_dir util/makedepend

    action	cppsetup.c
    action	def.h
    action	ifparser.c
    action	ifparser.h
    action	include.c
    action	main.c
    action	mkdepend.man
    action	parse.c
    action	pr.c

    src_dir config/imake
    dst_dir util/makedepend

    action	imakemdep.h
}

function symlink_util() {
    symlink_util_cf
    symlink_util_imake
    symlink_util_makedepend
#    ...
}


#########
#
#    Helper functions
#
#########

function error() {
	echo
	echo \ \ \ error:\ \ \ $1
	exit
}

# Function printing out what's going on
function run_module() {
    # $1 module
    # $2 explanation
    echo -n $EXPLANATION for $1 module ...\ 
    symlink_$1
    echo DONE
}

function run() {
    # $1 what to do
    # $2 explanation

    ACTION=$1 EXPLANATION=$2 run_module proto
    ACTION=$1 EXPLANATION=$2 run_module lib
    ACTION=$1 EXPLANATION=$2 run_module app
    ACTION=$1 EXPLANATION=$2 run_module xserver
    ACTION=$1 EXPLANATION=$2 run_module driver
    ACTION=$1 EXPLANATION=$2 run_module font
    ACTION=$1 EXPLANATION=$2 run_module doc
    ACTION=$1 EXPLANATION=$2 run_module util
}

function src_dir() {
    REAL_SRC_DIR=$SRC_DIR/$1
    if [ ! -d $REAL_SRC_DIR ] ; then
	error "Source directory $REAL_SRC_DIR does not exist"
    fi
}

function dst_dir() {
    REAL_DST_DIR=$DST_DIR/$1
    if [ ! -d $REAL_DST_DIR ] ; then
	mkdir -p $REAL_DST_DIR
    fi
}

function action() {
    if [ -z $2 ] ; then
	$ACTION	$REAL_SRC_DIR/$1	$REAL_DST_DIR/$1
    else
	$ACTION	$REAL_SRC_DIR/$1	$REAL_DST_DIR/$2
    fi
}

function usage() {
    echo symlink.sh src-dir dst-dir
    echo src-dir: the xc directory of the monolithic source tree
    echo dst-dir: the modular source tree containing proto, app, lib, ...
}

# Check commandline args
function check_args() {
    if [ -z $1 ] ; then
	echo Missing source dir
	usage
	exit
    fi

    if [ -z $2 ] ; then
	echo Missing destination dir
	usage
	exit
    fi
     
    if [ ! -d $1 ] ; then
	echo $1 is not a dir
	usage
	exit
    fi

    if [ ! -d $2 ] ; then
	echo $2 is not a dir
	usage
	exit
    fi

    if [ $1 = $2 ] ; then
	echo source and destination can\'t be the same
	usage
	exit
    fi

    D=`dirname "$relpath"`
    B=`basename "$relpath"`
    abspath="`cd \"$D\" 2>/dev/null && pwd || echo \"$D\"`/$B"

    SRC_DIR=`( cd $1 ; pwd )`
    DST_DIR=`(cd $2 ; pwd )`
}

main $1 $2

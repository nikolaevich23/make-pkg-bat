<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Current Directory: %folder%</title>
<style type="text/css">\n%style%\n</style>
</head>
<body>
%login-link%
%loggedin%
%upload-link%
<div style="float:right; padding:15px;"><a href="/~progress" class=button><img border=0 align=bottom src="/~img26" alt="Active Transfers"> Active Transfers</a></div>
<div style="float:right; padding:15px;"><a href="%encoded-folder%~files.lst" class=button><img border=0 align=bottom src="/~img4" alt="File Listing"> File Listing</a></div>
<div class=little>Current Directory:</div>
<div class=big>%folder%</div>
<div class=body>
%folder-comment%
%up%
%files%
</div>
<div align="center"><div style="background:#F5F5EE; color:#2F4F4F; border:outset; width:65%;"><br><b>Server Status</b><br><img style="border: thin solid #9999AA; padding: 1px;" src="/~img_graph600x50" alt="Server Bandwidth"><br><br><img src="/~img4" alt=""> Current Server Outbound: %speed-out%KB/s<br><img src="/~img4" alt=""> Current Server Inbound: %speed-in%KB/s<br><img src="/~img5" alt=""> Connections Connected: %connections%<br><br><a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-html401" alt="Valid HTML 4.01!"></a><br><br></div><br></div>
</body>
</html>

[style]
body, .row { color: #2F4F4F }
body, .button, .big, .little, th, comment { font-family:tahoma, verdana, arial, helvetica, sans; font-weight:normal; font-size:9pt; color:#2F4F4F; }
body { margin:0; background-color:#E8E8CE; padding:10px; color:#9999AA; }
p { margin:0 }
.big { font-size:13pt; font-weight:bold; color:#2F4F4F; }
.little { font-size: 8pt; color:#2F4F4F; }
div.body {
  border-bottom: 4px solid #9ACD32;
     border-top: 4px solid #9ACD32;
    border-left: 1px dotted #BBBBFF;
   border-right: 1px dotted #BBBBFF;
  background:#F5F5EE; padding:15px; margin:15px;
}
a { text-decoration:none;  background-color:Transparent; color:#2F4F4F; font-weight:bold; }
a:visited { color:#2F4F4F; }
a:hover { background-color:#E1E1E1; }
img { border-style:none }
.row { font-size:10pt; background:#E8E8CE; border:1px solid #9999AA }
.comment { font-size:7pt; color:#000000; background:#F5F5EE; padding:3px; border:1px solid #9ACD32; margin-top:2px; }
.column { color:#FA9334; font-size:13pt; font-weight:bold; padding-bottom:0; }
.button { padding:5px; padding-top:7px; border:1px outset gray; background-color:#F5F5EE; font-size:8pt; font-weight:bold; }
.flag { font-weight:bold; font-size:8pt; background:white; color:red; text-align:center; border:1px solid red; }
.text { color:#000000; }

[login-link]
<div style="float:right; padding:15px;"><a href="%encoded-folder%~login" class=button><img align=bottom src="/~img27" alt="Login"> Login Here</a></div>

[loggedin]
<div style="float:right; padding:15px;"><div class=text><span class=button><img align=bottom src="/~img27" alt="Logged In"> Logged in as: %user%</span></div></div>

[upload-link]
<div style="float:right; padding:15px;"><a href="%encoded-folder%~upload" class=button><img align=bottom src="/~img32" alt="Upload"> Upload Files</a></div>

[up]
<a class=big href="%parent-folder%"><img src="/~img14" alt="Parent Directory"> Parent Directory</a>

[nofiles]
<div class=little>This folder is empty.</div>

[files]
<div class=little><b>%number-folders% Folders,  %number-files% Files - Total Size: %total-size%</b></div>
<table width="90%">
<tr>
<th><a href="%encoded-folder%?sort=n"><span class=column>Filename</span></a>
<th><a href="%encoded-folder%?sort=s"><span class=column>Filesize</span></a>
<th><a href="%encoded-folder%?sort=t"><span class=column>Filetime</span></a>
</tr>
%list%
</table>

[file]
<tr><td class=row>%new% <a href="%item-url%"><img align=top src="/~img_file" alt="File"> %item-name%</a>%comment%<td align=center class=row>%item-size%<td align=center class=row>%item-modified%

[folder]
<tr><td class=row>%new% <a href="%item-url%"><img align=top src="/~img_folder" alt="Folder"> <b>%item-name%</b></a>%comment%<td align=center class=row>Folder<td align=center class=row>%item-modified%

[link]
<tr><td class=row>%new% <a href="%item-url%"><img align=top src="/~img_link" alt="Hyperlink"> <b>%item-name%</b></a>%comment%<td colspan=3 align=center class=row>Hyperlink

[comment]
<div class=comment>%item-comment%</div>

[folder-comment]
<div style='font-size:10pt; color:#888888; background:#EEEEEE; padding:3px; border:1px solid #DDDDDD; border-bottom:3px solid #DDDDDD; margin-top:2px;'>
%item-comment%</div>

[error-page]
<html><head><style>\n%style%\n</style></head><body>
%content%
<hr>
</body>
</html>

[not found]
<div class=text>
<h1>HTTP 404 -  Not Found</h1>
<a href="/">Main Page - Index</a>
</div>

[overload]
<div class=text>
<h1>Server Busy</h1>
Please try again later.
</div>

[max contemporary downloads]
<h1>Download limit</h1>
On this server there is a limit on the number of <b>contemporary</b> downloads.
<br>This limit has been reached. Retry later.

[unauthorized]
<div class=text>
<h1>Unauthorized</h1>
This is a protected resource.
<br>Your username/password cannot be verified.
</div>

[deny]
<div class=text>
<h1>Unallowed</h1>
This resource is not accessible.
</div>

[ban]
<div class=text>
<h1>Banned!</h1>
You are banned from this server with the reason of: %reason%
</div>

[upload]
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload to: %folder%</title>
<style type="text/css">\n%style%\n</style>
</head>
<body>
%login-link%
%loggedin%
<div style="float:right; padding:15px;"><a target="_top" href="%encoded-folder%~upload" class=button><img border=0 align=bottom src="/~img21" alt="Close Progress Frame"> Close Progress Frame</a></div>
<div style="float:right; padding:15px;"><a target="_top" href="%encoded-folder%~upload+progress" class=button><img border=0 align=bottom src="/~img10" alt="Progress Frame"> Open Progress Frame</a></div>
<div style="float:right; padding:15px;"><a href="%encoded-folder%" target=_parent class=button><img border=0 align=bottom src="/~img21" alt="Cancel"> Cancel Upload</a></div>
<div class=little>Upload to:</div>
<div class=big>%folder%</div>
<div class=body>
<div class=text><b>Free Space Available For Upload: %diskfree%</b></div>
<br>
<form name=frm action="%encoded-folder%" target=_parent method=post enctype="multipart/form-data" onSubmit="frm.upbtn.disabled=true; return true;">
%upload-files%
<br>
<input name=upbtn type=submit value="Upload Selected Files" style="border-style:dashed; border-width:1px; font-weight: bold; color: #000; background-color: #FFFFFF">
</form>
<div class=text><br><img src="/~img9" alt=""> Please do not open the active transfers frame while the upload is in progress or the upload will be corrupted.</div>
<div class=text><br><img src="/~img9" alt=""> WARNING: Uploading a file with a same filename will overwrite the existing file.</div>
<br><div align="center"><a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-html401" alt="Valid HTML 4.01!"></a></div>
</div>
</body>
</html>

[upload-file]
<input name=fileupload%idx% size=70 type=file><br>

[upload-results]
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Results for: %folder%</title>
<style type="text/css">\n%style%\n</style>
</head>
<body>
%loggedin%
<div class=little>Upload Results for:</div>
<div class=big>%folder%</div>
<div class=body>
%uploaded-files%
<br><br>
<a href="%encoded-folder%" target=_parent class=big><img border=0 align=bottom src="/~img14" alt="Back"> Go Back</a>
</div>
</body>
</html>

[upload-success]
<li><b>SUCCESS!</b> Uploaded: %item-name% --- %item-size% (Speed: %speed% KB/s)

[upload-failed]
<li><b>FAILED!</b> Error while uploading: %item-name%: ---  %reason%

[upload+progress]
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload to: %folder%</title>
<frameset cols=250,*>
  <frame name=progress src="/~progress" scrolling=auto marginwidth=0>
  <frame src="%encoded-folder%~upload-no-progress" scrolling=auto>
</frameset>
</head>
<body>
</body>
</html>

[progress]
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="Refresh" CONTENT="3;URL=/~progress">
<title>Active Transfers</title>
<style type="text/css">
%style%
.filename { font-weight:bold; font-size:8pt; }
.bytes { font-size:7pt; }
.perc { font-size:14px; vertical-align:middle; }
.out_bar { width:100px; font-size:15px; background:black; border:black 1px solid; margin-right:5px; }
.in_bar { height:16px; background:white; color:white;  }
div.body { margin-left:0; margin-right:0; }
body { padding:2px; }
</style>
</head>
<body>
<div class=big>Active Transfers</div>
<div class=text>Auto-Refresh: 3 Seconds</div>
<br><div align="center"><img src="/~img_graph190x40" style="border:white outset 2px;" alt="Bandwidth Graph"></div>
<div class=body>
%progress-files%
</div>
<div align="center"><a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-html401" alt="Valid HTML 4.01!"></a></div>
</body>
</html>

[progress-nofiles]
<div align="center" class=big>No Active Transfers</div>

[progress-upload-file]
<span class=flag>&nbsp;UP&nbsp;</span>
<div class=text><span class=filename>%filename%</span></div>
<div class=text><div class=bytes>%done-bytes% / %total-bytes% bytes<br>Current Upload Speed: %speed-kb% KB/s</div></div>
<div style="margin-top:5px; margin-bottom:20px;">
  <span class=out_bar><span class=in_bar style="width:%perc%px"></span></span> <div class=text><span class=perc>%perc%%</span></div>
</div>

[progress-download-file]
<span class=flag>&nbsp;DOWN&nbsp;</span>
<div class=text><span class=filename>%filename%</span></div>
<div class=text><div class=bytes>%done-bytes% / %total-bytes% bytes<br>Current Download Speed: %speed-kb% KB/s</div></div>
<div style="margin-top:5px; margin-bottom:20px;">
  <span class=out_bar><span class=in_bar style="width:%perc%px"></span></span><div class=text><span class=perc> %perc%%</span></div>
</div>

[newfile]
<span class=flag>&nbsp;NEW&nbsp;</span>
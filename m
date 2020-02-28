Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ED99F1737CF
	for <lists+linux-audit@lfdr.de>; Fri, 28 Feb 2020 14:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582895043;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=igj4kUmLM6L39lXwPZBakkHVS68G0MlJn+p9qkkB/xM=;
	b=I+8CXgrdH51XJNsV6wjPTpTyhaLICGrZVBBuu22Nty9HiD6JtAK+vAOSz36ChuPcLaqP56
	e0EEDC7q8M0huAjGwSQpMbCge/3ydfed/buG8XOhTvGHx6fhr6WGtNikmg9otj4nGYFIF6
	RdGrU3x8noHCp3egXKYRwfL9BhwuWmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-G48y4C_LPOmeT4nmjokVWA-1; Fri, 28 Feb 2020 08:04:00 -0500
X-MC-Unique: G48y4C_LPOmeT4nmjokVWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B73BD18C35A0;
	Fri, 28 Feb 2020 13:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBAFE60C18;
	Fri, 28 Feb 2020 13:03:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D35B6860D7;
	Fri, 28 Feb 2020 13:03:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SD2ngW023006 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 08:02:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A12C22166B2D; Fri, 28 Feb 2020 13:02:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AE512166B2B
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 13:02:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A79B9185A794
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 13:02:46 +0000 (UTC)
Received: from icp-osb-irony-out8.external.iinet.net.au
	(icp-osb-irony-out8.external.iinet.net.au [203.59.1.225]) by
	relay.mimecast.com with ESMTP id us-mta-351-iXGmD2U9Ov6uGdzlpOl0YA-1;
	Fri, 28 Feb 2020 08:02:42 -0500
X-MC-Unique: iXGmD2U9Ov6uGdzlpOl0YA-1
X-SMTP-MATCH: 1
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CbAgAAD1le/1yWq3xmHAEBAQEBBwE?=
	=?us-ascii?q?BEQEEBAEBgWoEAQELAYEkWCxsVCESKoQUiQOFegGCEIQQlUcMgVYFCQEBAQE?=
	=?us-ascii?q?BAQEBASABCgkBAgQBAYQ6BAICggcnNwYOAhABAQEFAQEBAQEFAwFthQogBSc?=
	=?us-ascii?q?MhWQBAQEDAQEhCikYGwsIEBwOAgInMAYBEoJbTIJKAQEuEK4FgTKFOhGCKAa?=
	=?us-ascii?q?BDIE4BoE4AYwzgUw/gUeCKTU+gmQBgTEBEgEJgymCXgSNUEuCRooqlRAHgj9?=
	=?us-ascii?q?4BIVRkBgcgkmIH5BJjnCdWCMqPXEzGh9UgUIYgRJQGA1WjHpZF4EEAQKCSYp?=
	=?us-ascii?q?pMDCBBgEBjjYBAQ?=
X-IPAS-Result: =?us-ascii?q?A2CbAgAAD1le/1yWq3xmHAEBAQEBBwEBEQEEBAEBgWoEA?=
	=?us-ascii?q?QELAYEkWCxsVCESKoQUiQOFegGCEIQQlUcMgVYFCQEBAQEBAQEBASABCgkBA?=
	=?us-ascii?q?gQBAYQ6BAICggcnNwYOAhABAQEFAQEBAQEFAwFthQogBScMhWQBAQEDAQEhC?=
	=?us-ascii?q?ikYGwsIEBwOAgInMAYBEoJbTIJKAQEuEK4FgTKFOhGCKAaBDIE4BoE4AYwzg?=
	=?us-ascii?q?Uw/gUeCKTU+gmQBgTEBEgEJgymCXgSNUEuCRooqlRAHgj94BIVRkBgcgkmIH?=
	=?us-ascii?q?5BJjnCdWCMqPXEzGh9UgUIYgRJQGA1WjHpZF4EEAQKCSYppMDCBBgEBjjYBA?=
	=?us-ascii?q?Q?=
X-IronPort-AV: E=Sophos;i="5.70,496,1574092800"; 
	d="scan'208,217";a="286406987"
Received: from 124-171-150-92.dyn.iinet.net.au (HELO swtf.swtf.dyndns.org)
	([124.171.150.92]) by icp-osb-irony-out8.iinet.net.au with ESMTP;
	28 Feb 2020 21:02:39 +0800
Message-ID: <518a5eba6ef9ef8087c3693139a577574ca6ff9a.camel@iinet.net.au>
Subject: Re: corrupted checkpoint
From: Burn Alting <burn.alting@iinet.net.au>
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Date: Sat, 29 Feb 2020 00:02:37 +1100
In-Reply-To: <5F4EE10832231F4F921A255C1D9542982AC13B@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D9542982AC13B@DEERLM99EX7MSX.ww931.my-it-solutions.net>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: burn@swtf.dyndns.org
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7636662338100339652=="

--===============7636662338100339652==
Content-Type: multipart/alternative; boundary="=-t3vGTaAeqiGpoN/KEOD+"

--=-t3vGTaAeqiGpoN/KEOD+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Phillippe,
>From man ausearch ..     -ts, --start [start-date] [start-time]           =
   Search
for events with time stamps equal to or after the given start time. The for=
mat of
start time depends on your locale. You can check the format of your locale =
by
running  date  '+%x'.   If  the              date  is  omitted,  today  is =
 assumed.
  If  the  time  is  omitted,  midnight is assumed. Use 24 hour clock time =
rather
than AM or PM to specify time. An example date using the en_US.utf8 locale
is              09/03/2009. An example of time is 18:00:00. The date format=
 accepted
is influenced by the LC_TIME environmental variable.
              You may also use the word: now, recent, boot, today, yesterda=
y, this-
week, week-ago, this-month, this-year, or checkpoint. Boot means the time o=
f day to
the second when the system last booted.
Today              means  starting  at  1  second  after midnight. Recent i=
s 10
minutes ago. Yesterday is 1 second after midnight the previous day. This-we=
ek means
starting 1 second after midnight on day 0 of the week              determin=
ed by
your locale (see localtime). Week-ago means starting 1 second after midnigh=
t exactly
7 days ago. This-month means 1 second after midnight on day 1 of the month.=
 This-
year means  the  1              second after midnight on the first day of t=
he first
month.
              checkpoint  means  ausearch  will  use the timestamp found wi=
thin a
valid checkpoint file ignoring the recorded inode, device, serial, node and=
 event
type also found within a checkpoint file. Essen=E2=80=90              tiall=
y, this is the
recovery action should an invocation of ausearch with a checkpoint option f=
ail with
an exit status of 10, 11 or 12. It could be used in a shell script somethin=
g like:
                   ausearch --checkpoint /etc/audit/auditd_checkpoint.txt
-i                   _au_status=3D$?                   if test ${_au_status=
} eq 10 -o
${_au_status} eq 11 -o ${_au_status} eq
12                   then                     ausearch --checkpoint
/etc/audit/auditd_checkpoint.txt --start checkpoint -i                   fi

That said, rather than sending events from multiple hosts to a single combi=
ned file,
I would strongly recommend one maintain multiple files, one per host. The m=
ost
recent change to the ausearch checkpoint code addressed this. Sogiven a dir=
ectory
structure like say,   repository/  repository/year/  repository/year/month=
=20
repository/year/month/day  repository/year/month/day/hosta/auditd.log=20
repository/year/month/day/hostb/auditd.log=20
repository/year/month/day/hostc/auditd.log  ...=20
repository/year/month/day/hostN/auditd.log
one could orchestrate a script that run's multiple ausearch commands along =
the lines
of=09ausearch -if repository/year/month/day/hosta/auditd.log  --checkpoint
.../hosta.chkpt ...        ausearch -if
repository/year/month/day/hostb/auditd.log  --checkpoint .../hostb.chkpt ..=
.
etc
On Fri, 2020-02-28 at 10:46 +0000, MAUPERTUIS, PHILIPPE wrote:
> Hi=20
> I set a cron job script to perform ausearch every 5 minutes  on a central=
 log
> server.
> The logs from various hosts are received together in the same file
> The logs are rotated on a daily basis
> Everything ran fine for several days, then suddently I got :
> Corrupted checkpoint file. Inode match, but newer complete event
> (1582684501.003:48035) found before loaded checkpoint 1582684346.999:4803=
4
> The events are :
> checkpoint
> audit.log.3: node=3Dxxxxxxxx type=3DUSER_END msg=3Daudit(1582684346.999:4=
8034):
> pid=3D15666 uid=3D0 auid=3D0
> newer event
> audit.log.2: node=3D xxxxxxxx type=3DUSER_ACCT msg=3Daudit(1582684501.003=
:48035):
> pid=3D16000
> I  guess the problem is due to the log rotation since the two messages ar=
e coming
> from the same host.
> I have a few  questions
> When it happens how can I restart the process ?
> Is there a way to restart ausearch from the newer event ?
> How could I extract the events between the checkpoint and the newer event=
 ?
> The checkpoint file contains :
> dev=3D0xFD03
> inode=3D1048581
> output=3Dxxxxxxxx 1582770601.342:380885 0x456
> =20
> What is this : 0x456 ?
> How can I find the value for a given event ?
> =20
> Philippe
> =20
>=20
>=20
> Worldline and equensWorldline are a registered trademarks and trading nam=
es owned
> by Worldline Group.
>=20
> This e-mail and the documents attached are confidential and intended sole=
ly for
> the addressee. If you receive this e-mail in error, you are not authorize=
d to
> copy, disclose, use or retain it. Please notify the sender immediately an=
d delete
> this email from your
>  systems. As emails may be intercepted, amended or lost, they are not sec=
ure.
> EquensWorldline and the Worldline Group therefore can accept no liability=
 for any
> errors or their content. Although equensWorldline and the Worldline Group
> endeavours to maintain
>  a virus-free network, we do not warrant that this transmission is virus-=
free and
> can accept no liability for any damages resulting from any virus transmit=
ted. The
> risks are deemed to be accepted by everyone who communicates with equensW=
orldline
> and the Worldline
>  Group by email
>=20
>=20
>=20
>=20
>=20
> --Linux-audit mailing listLinux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

--=-t3vGTaAeqiGpoN/KEOD+
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40" dir=3D"ltr"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR" style=3D"text-align:left; direction:ltr;"><div>Phillippe,=
</div><div><br></div><div>From man ausearch ..</div><div>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;-ts, --start [start-date] [start-time]</div><div>&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Searc=
h for events with time stamps equal to or after the given start time. The f=
ormat of start time depends on your locale. You can check the format of you=
r locale by running&nbsp;&nbsp;date&nbsp;&nbsp;'+%x'.&nbsp;&nbsp;&nbsp;If&n=
bsp;&nbsp;the</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;date&nbsp;&nbsp;is&nbsp;&nbsp;omitted,&nbs=
p;&nbsp;today&nbsp;&nbsp;is&nbsp;&nbsp;assumed.&nbsp;&nbsp;If&nbsp;&nbsp;th=
e&nbsp;&nbsp;time&nbsp;&nbsp;is&nbsp;&nbsp;omitted,&nbsp;&nbsp;midnight is =
assumed. Use 24 hour clock time rather than AM or PM to specify time. An ex=
ample date using the en_US.utf8 locale is</div><div>&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;09/03/2009. An=
 example of time is 18:00:00. The date format accepted is influenced by the=
 LC_TIME environmental variable.</div><div><br></div><div>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You may =
also use the word: now, recent, boot, today, yesterday, this-week, week-ago=
, this-month, this-year, or checkpoint. Boot means the time of day to the s=
econd when the system last booted. Today</div><div>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;means&nbsp;&nbs=
p;starting&nbsp;&nbsp;at&nbsp;&nbsp;1&nbsp;&nbsp;second&nbsp;&nbsp;after mi=
dnight. Recent is 10 minutes ago. Yesterday is 1 second after midnight the =
previous day. This-week means starting 1 second after midnight on day 0 of =
the week</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;determined by your locale (see localtime). Week=
-ago means starting 1 second after midnight exactly 7 days ago. This-month =
means 1 second after midnight on day 1 of the month. This-year means&nbsp;&=
nbsp;the&nbsp;&nbsp;1</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;second after midnight on the first=
 day of the first month.</div><div><br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;checkpoint&nbsp;=
&nbsp;means&nbsp;&nbsp;ausearch&nbsp;&nbsp;will&nbsp;&nbsp;use the timestam=
p found within a valid checkpoint file ignoring the recorded inode, device,=
 serial, node and event type also found within a checkpoint file. Essen=E2=
=80=90</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;tially, this is the recovery action should an inv=
ocation of ausearch with a checkpoint option fail with an exit status of 10=
, 11 or 12. It could be used in a shell script something like:</div><div><b=
r></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ausearch --checkpoint /=
etc/audit/auditd_checkpoint.txt -i</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;_au_status=3D$?</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i=
f test ${_au_status} eq 10 -o ${_au_status} eq 11 -o ${_au_status} eq 12</d=
iv><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;then</div><div>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ausearch --checkpoint /etc/audit/audi=
td_checkpoint.txt --start checkpoint -i</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;fi</div><div></div><div><br></div><div><br></div><div>That sa=
id, rather than sending events from multiple hosts to a single combined fil=
e, I would strongly recommend one maintain multiple files, one per host. Th=
e most recent change to the ausearch checkpoint code addressed this. So</di=
v><div>given a directory structure like say, </div><div>&nbsp; repository/<=
/div><div>&nbsp; repository/year/</div><div>&nbsp; repository/year/month</d=
iv><div>&nbsp; repository/year/month/day</div><div>&nbsp; repository/year/m=
onth/day/hosta/auditd.log</div><div>&nbsp; repository/year/month/day/hostb/=
auditd.log</div><div>&nbsp; repository/year/month/day/hostc/auditd.log</div=
><div>&nbsp; ...</div><div>&nbsp; repository/year/month/day/hostN/auditd.lo=
g</div><div></div><div><br></div><div>one could orchestrate a script that r=
un's multiple ausearch commands along the lines of</div><div>=09ausearch -i=
f repository/year/month/day/hosta/auditd.log  --checkpoint .../hosta.chkpt =
...</div><div>        ausearch -if repository/year/month/day/hostb/auditd.l=
og  --checkpoint .../hostb.chkpt ...</div><div><br></div><div>etc</div><div=
><br></div><div><br></div><div>On Fri, 2020-02-28 at 10:46 +0000, MAUPERTUI=
S, PHILIPPE wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8e=
x; border-left:2px #729fcf solid;padding-left:1ex">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I set a cron job script to perf=
orm ausearch every 5 minutes &nbsp;on a central log server.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The logs from various hosts are=
 received together in the same file<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The logs are rotated on a daily=
 basis<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Everything ran fine for several=
 days, then suddently I got :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Corrupted checkpoint file. Inod=
e match, but newer complete event (1582684501.003:48035) found before loade=
d checkpoint 1582684346.999:48034<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The events are :<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">checkpoint<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">audit.log.3: node=3Dxxxxxxxx ty=
pe=3DUSER_END msg=3Daudit(1582684346.999:48034): pid=3D15666 uid=3D0 auid=
=3D0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">newer event<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">audit.log.2: node=3D xxxxxxxx t=
ype=3DUSER_ACCT msg=3Daudit(1582684501.003:48035): pid=3D16000<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I &nbsp;guess the problem is du=
e to the log rotation since the two messages are coming from the same host.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a few &nbsp;questions<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When it happens how can I resta=
rt the process ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there a way to restart ausea=
rch from the newer event ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How could I extract the events =
between the checkpoint and the newer event ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The checkpoint file contains :<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">dev=3D0xFD03<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">inode=3D1048581<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">output=3Dxxxxxxxx 1582770601.34=
2:380885 0x456<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What is this : 0x456 ?<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How can I find the value for a =
given event ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Philippe<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<p>Worldline and equensWorldline are a registered trademarks and trading na=
mes owned by Worldline Group.<br>
This e-mail and the documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this email from your
 systems. As emails may be intercepted, amended or lost, they are not secur=
e. EquensWorldline and the Worldline Group therefore can accept no liabilit=
y for any errors or their content. Although equensWorldline and the Worldli=
ne Group endeavours to maintain
 a virus-free network, we do not warrant that this transmission is virus-fr=
ee and can accept no liability for any damages resulting from any virus tra=
nsmitted. The risks are deemed to be accepted by everyone who communicates =
with equensWorldline and the Worldline
 Group by email<br>
</p>


<pre>--</pre><pre>Linux-audit mailing list</pre><a href=3D"mailto:Linux-aud=
it@redhat.com"><pre>Linux-audit@redhat.com</pre></a><pre><br></pre><a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-audit"><pre>https://www.r=
edhat.com/mailman/listinfo/linux-audit</pre></a></blockquote></body></html>

--=-t3vGTaAeqiGpoN/KEOD+--

--===============7636662338100339652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7636662338100339652==--


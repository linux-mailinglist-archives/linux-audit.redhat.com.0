Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B3F65F5834
	for <lists+linux-audit@lfdr.de>; Fri,  8 Nov 2019 21:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573245634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3176GNQnK66lxEf53iGJ8PWmNdhY7DO/iCoJ3lPQ7Vs=;
	b=b8NI7xKIIlOzvb2ESqLZTLuoqMSxPg1s69kpbcRfqK0AwCQHE76x13X2eyNXUSW4KOdgWq
	ru6NZ+QFQSavD21f/7UDrW9EN5LU8Xdbpm3lgYXUOIqHZdtN9BjTSZdhOSBMs9jwhfE8RF
	zF/DJUGO7CBfzO3z2bdTgYaTOxYGSxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-MFU__PRYP--f__fT_wg9bQ-1; Fri, 08 Nov 2019 15:40:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA86F1800DFD;
	Fri,  8 Nov 2019 20:40:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D69C560F9F;
	Fri,  8 Nov 2019 20:40:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEE3818034EA;
	Fri,  8 Nov 2019 20:40:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8KeAQ6002570 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 15:40:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 993CC60856; Fri,  8 Nov 2019 20:40:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92898608B3
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 20:40:06 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC10289B0E8
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 20:40:05 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	xA8KXLlk108161
	for <linux-audit@redhat.com>; Fri, 8 Nov 2019 15:40:05 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
	[192.155.248.66])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2w5d5ycyf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Fri, 08 Nov 2019 15:40:05 -0500
Received: from localhost
	by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
	for <linux-audit@redhat.com> from <jtolson@us.ibm.com>;
	Fri, 8 Nov 2019 20:40:04 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
	by smtp.notes.na.collabserv.com (10.106.227.127) with
	smtp.notes.na.collabserv.com ESMTP; Fri, 8 Nov 2019 20:40:01 -0000
Received: from us1a3-mail32.a3.dal06.isc4sb.com ([10.146.6.51])
	by us1a3-smtp04.a3.dal06.isc4sb.com
	with ESMTP id 2019110820400117-919176 ;
	Fri, 8 Nov 2019 20:40:01 +0000
MIME-Version: 1.0
Subject: Not seeing access denied audit messages in restricted subdirectories
To: linux-audit@redhat.com
From: "John T Olson" <jtolson@us.ibm.com>
Date: Fri, 8 Nov 2019 13:39:58 -0700
X-KeepSent: 3C0EFCFA:EE160C73-002584AC:006EBA93;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 14711
X-TNEFEvaluated: 1
x-cbid: 19110820-4409-0000-0000-000001167CB1
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
	SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.157871
X-IBM-SpamModules-Versions: BY=3.00012077; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000292; SDB=6.01287320; UDB=6.00682614;
	IPR=6.01069492; 
	MB=3.00029442; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-08 20:40:02
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-08 18:52:15 - 6.00010625
x-cbparentid: 19110820-4410-0000-0000-00001854C6E1
Message-Id: <OF3C0EFCFA.EE160C73-ON002584AC.006EBA93-072584AC.0071860C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-11-08_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Fri, 08 Nov 2019 20:40:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Fri, 08 Nov 2019 20:40:06 +0000 (UTC) for IP:'148.163.156.1'
	DOMAIN:'mx0a-001b2d01.pphosted.com'
	HELO:'mx0a-001b2d01.pphosted.com' FROM:'jtolson@us.ibm.com' RCPT:''
X-RedHat-Spam-Score: -0.699  (HTML_MESSAGE, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 148.163.156.1 mx0a-001b2d01.pphosted.com
	148.163.156.1 mx0a-001b2d01.pphosted.com <jtolson@us.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
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
X-MC-Unique: MFU__PRYP--f__fT_wg9bQ-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============3697123203310344573=="

--===============3697123203310344573==
Content-type: multipart/alternative; 
	Boundary="0__=8FBB0E3FDFFD3C038f9e8a93df938690918c8FBB0E3FDFFD3C03"
Content-Disposition: inline

--0__=8FBB0E3FDFFD3C038f9e8a93df938690918c8FBB0E3FDFFD3C03
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=WINDOWS-1252



Greetings,

I have the following 2 audit rules set up:

-a always,exit -F arch=3Db64 -S all -F exit=3D-EACCES -F dir=3D/gpfs/fs1
-a always,exit -F arch=3Db64 -S all -F exit=3D-EPERM -F dir=3D/gpfs/fs1

I have a directory structure like the following:

(13:15:26) zippleback-vm1:~ # ls -la /gpfs/fs1/test/
total 257
drwx------.  3 root root   4096 Nov  7 12:46 .
drwxr-xr-x. 15 root root 262144 Nov  7 12:50 ..
drwx------.  2 root root   4096 Nov  7 12:46 test2

Essentially, directory "/gpfs/fs1/test/" is owned by root and has
permissions 700.  The subdirectory underneath it (with
path /gpfs/fs1/test/test2) is also owned by root and has permissions 700.

When I have a non-root user attempt to list the contents of directory
"/gpfs/fs1/test/" I receive an audit message for the denied access.
However, when the non-root user attempts to list the contents of the
subdirectory (/gpfs/fs1/test/test2), there is no audit message generated.
Does anyone know why this is and how I get audit messages in both cases?


Thanks,

John

John T. Olson, Ph.D., MI.C., K.EY.
Master Inventor, Software Defined Storage
957/9032-1 Tucson, AZ, 85744
(520) 799-5185, tie 321-5185 (FAX: 520-799-4237)
Email: jtolson@us.ibm.com
Follow me on twitter:  @John_T_Olson

"Do or do not.  There is no try." - Yoda

Olson's Razor:
Any situation that we, as humans, can encounter in life
can be modeled by either an episode of The Simpsons
or Seinfeld.

--0__=8FBB0E3FDFFD3C038f9e8a93df938690918c8FBB0E3FDFFD3C03
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=WINDOWS-1252
Content-Disposition: inline

<html><body><p><font size=3D"2">Greetings,</font><br><br><font size=3D"2">I=
 have the following 2 audit rules set up:</font><br><br><font size=3D"2">-a=
 always,exit -F arch=3Db64 -S all -F exit=3D-EACCES -F dir=3D/gpfs/fs1</fon=
t><br><font size=3D"2">-a always,exit -F arch=3Db64 -S all -F exit=3D-EPERM=
 -F dir=3D/gpfs/fs1</font><br><br><font size=3D"2">I have a directory struc=
ture like the following:</font><br><br><font size=3D"2">(13:15:26) zippleba=
ck-vm1:~ # ls -la /gpfs/fs1/test/</font><br><font size=3D"2">total 257</fon=
t><br><font size=3D"2">drwx------.  3 root root   4096 Nov  7 12:46 .</font=
><br><font size=3D"2">drwxr-xr-x. 15 root root 262144 Nov  7 12:50 ..</font=
><br><font size=3D"2">drwx------.  2 root root   4096 Nov  7 12:46 test2</f=
ont><br><br><font size=3D"2">Essentially, directory &quot;/gpfs/fs1/test/&q=
uot; is owned by root and has permissions 700.  The subdirectory underneath=
 it (with path /gpfs/fs1/test/test2) is also owned by root and has permissi=
ons 700.</font><br><br><font size=3D"2">When I have a non-root user attempt=
 to list the contents of directory &quot;/gpfs/fs1/test/&quot; I receive an=
 audit message for the denied access.  However, when the non-root user atte=
mpts to list the contents of the subdirectory (/gpfs/fs1/test/test2), there=
 is no audit message generated.  Does anyone know why this is and how I get=
 audit messages in both cases?</font><br><font size=3D"2"><br><br>Thanks,<b=
r><br>John<br><br>John T. Olson, Ph.D., MI.C., K.EY.<br>Master Inventor, So=
ftware Defined Storage<br>957/9032-1 Tucson, AZ, 85744<br>(520) 799-5185, t=
ie 321-5185 (FAX: 520-799-4237)<br>Email: jtolson@us.ibm.com<br>Follow me o=
n twitter:  @John_T_Olson<br><br>&quot;Do or do not.  There is no try.&quot=
; - Yoda<br><br>Olson's Razor:<br>Any situation that we, as humans, can enc=
ounter in life<br>can be modeled by either an episode of The Simpsons<br>or=
 Seinfeld.</font><BR>
</body></html>

--0__=8FBB0E3FDFFD3C038f9e8a93df938690918c8FBB0E3FDFFD3C03--

--===============3697123203310344573==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============3697123203310344573==--


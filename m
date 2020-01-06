Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 836C2130FB8
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 10:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578303890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PPmmmI7yc5QCCYYhKWb5u9napPxVSzMoVOPphwNONFk=;
	b=KpvpgAbws016GIhBBwSAPACp6RZOv7lPtQD2gyjRd0B2xvo9MCgWeepQqsf39g1KqcSZUH
	SOgCK2xaFWulbMxybFo+KzmyuQ56PP1jSHwN4fRXvJaxHwuSuINla4yql7zvGYXcaIukyD
	347cRPHZu5CddGYLcSB8HSOlyG2XWas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-s8WpiZCeMTScGV9xhQM5XA-1; Mon, 06 Jan 2020 04:44:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4161800D48;
	Mon,  6 Jan 2020 09:44:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32645D9E1;
	Mon,  6 Jan 2020 09:44:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43DCE81C61;
	Mon,  6 Jan 2020 09:44:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0069iGiR026479 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 04:44:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 606FE2166B2A; Mon,  6 Jan 2020 09:44:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C5242166B29
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 09:44:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20512185B0AC
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 09:44:14 +0000 (UTC)
IronPort-SDR: 4nPtPPKu85gDJDdL2v7qzWR8hequME8rqIvED8wlpTdQBO0eg47Zo9BNZ/hSNMDZQmqn42jc5U
	6TAfb3849rSc6qRBdq33eyKnhYUPzZS9YQVCtmLFrvx1gjeUBABii1dkd5Bd5BH1Aw7OV50uuh
	+yE7IL7T0Uo51eCnfsxKiSrpyZSwIj0NS1bp6PAYNwaDk+v0K60bLrLTu9S7kaRrDNI4sj3RUp
	mMtEAvLEaToOa6AwsSFQbNGtMe0qGBovCSM6GY2+rxJ7LZRQ0+2aFFbCwI6wkYlbw8jlw33K0K
	cHbqAisY10YYzT6+Pv5mNYic
X-IronPort-AV: E=Sophos;i="5.69,402,1571695200"; 
   d="scan'208";a="9375168"
X-MGA-submission: =?us-ascii?q?MDGBpGsEdtUoCuhf8jDBjJLhmzIOuPZTXUCoFQ?=
	=?us-ascii?q?u1MJ/EQ84ognIJyaMBiotakOfy8Yoe4OhKDFNJyExsX6hhKqrdCAbCdo?=
	=?us-ascii?q?fO41Do0iUczZcBwH5lJE+eOP5VqAsaSSOU4UPpknee+///Vcssd+PHNp?=
	=?us-ascii?q?t9?=
Received: from smarthost1.atos.net (smtppost.atos.net [193.56.114.176])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-167-JKdForInNF-LPOrb8rW6gQ-1; Mon, 06 Jan 2020 04:44:09 -0500
Received: from unknown (HELO DEERLM99ETUMSX.ww931.my-it-solutions.net)
	([10.86.142.96])
	by smarthost1.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	06 Jan 2020 10:44:08 +0100
Received: from DEERLM99EX7MSX.ww931.my-it-solutions.net ([169.254.9.149]) by
	DEERLM99ETUMSX.ww931.my-it-solutions.net ([10.86.142.96]) with mapi id
	14.03.0468.000; Mon, 6 Jan 2020 10:44:07 +0100
From: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: RE: USER_MGMT  event
Thread-Topic: USER_MGMT  event
Thread-Index: AdW/Ne3RocIDKekYRQSxKeXWlP620AEBURiAAE1PtkA=
Date: Mon, 6 Jan 2020 09:44:07 +0000
Message-ID: <5F4EE10832231F4F921A255C1D95429825ABCF@DEERLM99EX7MSX.ww931.my-it-solutions.net>
References: <5F4EE10832231F4F921A255C1D954298252E49@DEERLM99EX7MSX.ww931.my-it-solutions.net>
	<1686247.kkT0hDcqUl@x2>
In-Reply-To: <1686247.kkT0hDcqUl@x2>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.86.142.14]
MIME-Version: 1.0
X-MC-Unique: JKdForInNF-LPOrb8rW6gQ-1
X-MC-Unique: s8WpiZCeMTScGV9xhQM5XA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0069iGiR026479
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
Below is the complete log of the session where I did :
1) remove all rules
2) change root's shell using chsh
3) ausearch
4) change root's shell  using usermod
4 ausearch

There is no event at all for the chsh

Philippe

[root@xxxxxxxxx ~]# auditctl -D
No rules
[root@xxxxxxxxx ~]# getent passwd root
root:x:0:0:root@xxxxxxxxx:/root:/bin/bash
[root@xxxxxxxxx ~]# chsh -l
/bin/sh
/bin/bash
/usr/bin/sh
/usr/bin/bash
/usr/bin/tlog-rec-session
[root@xxxxxxxxx ~]# chsh -s /usr/bin/tlog-rec-session root
Changing shell for root.
Shell changed.
[root@xxxxxxxxx ~]# ausearch -ts recent -i
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.516:9=
514) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.516:9=
515) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.516:9=
516) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
517) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
518) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
519) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D32bit-abi list=3Dexi=
t res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
520) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3Dignore_chrony list=
=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
521) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.1-cardholder-ac=
cess list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
522) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
523) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
524) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
525) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
526) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
527) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
528) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-session list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
529) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-session list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
530) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-setuid list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
531) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-cmd list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
532) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
533) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
534) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
535) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
536) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
537) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.4.2b-time-change =
list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
538) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.4.2b-time-change =
list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
539) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.4.2b-time-change =
list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
540) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.5.5-modification-=
audit list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
541) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-load l=
ist=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
542) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-load l=
ist=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
543) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-unload=
 list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
544) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-unload=
 list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
545) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3Dexternal-access list=
=3Dexit res=3Dyes
[root@xxxxxxxxx ~]# usermod -s /bin/bash root
[root@xxxxxxxxx ~]# ausearch -ts recent -i
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.516:9=
514) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.516:9=
515) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.516:9=
516) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
517) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
518) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D(null) list=3Dexit r=
es=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
519) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D32bit-abi list=3Dexi=
t res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
520) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3Dignore_chrony list=
=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
521) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.1-cardholder-ac=
cess list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
522) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
523) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
524) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
525) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
526) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.521:9=
527) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.3-access-audit-=
trail list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
528) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-session list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
529) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-session list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
530) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-setuid list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
531) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.b-elevated-pr=
ivs-cmd list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
532) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
533) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
534) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
535) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
536) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.5.c-accounts li=
st=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
537) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.4.2b-time-change =
list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
538) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.4.2b-time-change =
list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
539) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.4.2b-time-change =
list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
540) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.5.5-modification-=
audit list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
541) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-load l=
ist=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
542) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-load l=
ist=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
543) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-unload=
 list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
544) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3D10.2.7-module-unload=
 list=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DCONFIG_CHANGE msg=3Daudit(01/06/2020 10:00:53.535:9=
545) :  auid=3Du12345 ses=3D104 op=3Dremove_rule key=3Dexternal-access list=
=3Dexit res=3Dyes
----
node=3Dxxxxxxxxx type=3DUSER_MGMT msg=3Daudit(01/06/2020 10:04:22.552:9546)=
 : pid=3D6937 uid=3Droot auid=3Du12345 ses=3D104 msg=3D'op=3Dchanging-shell=
 id=3Droot exe=3D/usr/sbin/usermod hostname=3Dxxxxxxxxx addr=3D? terminal=
=3Dpts/0 res=3Dsuccess'

-----Message d'origine-----
De : Steve Grubb [mailto:sgrubb@redhat.com]
Envoy=E9 : samedi 4 janvier 2020 22:12
=C0 : linux-audit@redhat.com
Cc : MAUPERTUIS, PHILIPPE
Objet : Re: USER_MGMT event

On Monday, December 30, 2019 12:29:13 PM EST MAUPERTUIS, PHILIPPE wrote:
> On a RHEL8 server, when playing around with usermod and  chsh, I noticed
> that usermod -c 'root@xxx' root generates a user_mgmt event
> But
> chsh -s /usr/bin/tlog-rec-session root didn't.
> Is that the expected behavior ?

It depends. Did you get any event at all? There is a chance that you just
have mismatching events.

> I was expecting an event for both.

There should be an event for both.

> Should I open a ticket at redhat for this ?

Let's see what the answer is for the above. But potentially yes. And if the=
re
is any change we'll be sure to get this into upstream shadow-utils so its
uniform across all distros.

-Steve


equensWorldline is a registered trade mark and trading name owned by the Wo=
rldline Group through its holding company.
This e-mail and the documents attached are confidential and intended solely=
 for the addressee. If you receive this e-mail in error, you are not author=
ized to copy, disclose, use or retain it. Please notify the sender immediat=
ely and delete this email from your systems. As emails may be intercepted, =
amended or lost, they are not secure. EquensWorldline and the Worldline Gro=
up therefore can accept no liability for any errors or their content. Altho=
ugh equensWorldline and the Worldline Group endeavours to maintain a virus-=
free network, we do not warrant that this transmission is virus-free and ca=
n accept no liability for any damages resulting from any virus transmitted.=
 The risks are deemed to be accepted by everyone who communicates with eque=
nsWorldline and the Worldline Group by email


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


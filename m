Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF946BFF34
	for <lists+linux-audit@lfdr.de>; Sun, 19 Mar 2023 04:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679195473;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ePBB7C1/U2ZVZMbW7o9Ag27/TyijYGcCCstJBPzWcmU=;
	b=N1CxuuwktY/5RY16es6Ikrc5YVBixKpBfvP87en2edipa2NAxnlyxkhPjzHN7R9wlKPlSC
	lLF2IgriVtMzquU1CczjmLVGtMFL6Vt8ixy1q2gi3rsbq1z8URTM+o1T/fJYRjl13WaMg3
	4D01IeT+kUncELrgObA0VB0gSc2sbXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-OpzG_mW1PRyei_wQV1MEGQ-1; Sat, 18 Mar 2023 23:11:09 -0400
X-MC-Unique: OpzG_mW1PRyei_wQV1MEGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5CCF85A588;
	Sun, 19 Mar 2023 03:11:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBA51483EC0;
	Sun, 19 Mar 2023 03:11:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 098701946A52;
	Sun, 19 Mar 2023 03:11:05 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D60B1946588 for <linux-audit@listman.corp.redhat.com>;
 Sun, 19 Mar 2023 03:11:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42606492B02; Sun, 19 Mar 2023 03:11:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A340492B00
 for <linux-audit@redhat.com>; Sun, 19 Mar 2023 03:11:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D65C91C05B00
 for <linux-audit@redhat.com>; Sun, 19 Mar 2023 03:11:03 +0000 (UTC)
Received: from icp-osb-irony-out3.external.iinet.net.au
 (icp-osb-irony-out3.external.iinet.net.au [203.59.1.153]) by
 relay.mimecast.com with ESMTP id us-mta-265-aCkUrKsJNeeH2ZPmfeGlew-1; Sat,
 18 Mar 2023 21:28:53 -0400
X-MC-Unique: aCkUrKsJNeeH2ZPmfeGlew-1
X-SMTP-MATCH: 1
IronPort-Data: A9a23:otxqZ6C1PRwC2BVW/3Tiw5YqxClBgxIJ4kV8jS/XYbTApGkggz1Sx
 mtNCz+Ba/7ZZWWnKtkkPIqzpEoHuJbWn9M1TANkpHpgcSlH+JHPbTi7wuccHM8zwunrFh8PA
 xA2M4GYRCwMZiaA4E3raNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtcAbeORXkXc6
 bsen+WFYAX+g2UtYjpOg06+gEgHUMra6WtwUmMWOKgjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iG9Y+CTOzZk9+AMBOtPTjShsaic7XPNJEAateo2nSxYgpk
 L2hv7ToIesiFvWkdOg1D0ICS3kmVUFL0OevHJSxjSCc50vWY3/lk8dKNV0vELY8w8sqJz8U5
 ONNfVjhbjjb7w636KmkVucqnds/Io/nLYUTvGomyivWZRokacqaEuObvZkBjGp235kRdRrdT
 5NxhT5HZgnaZVtGPksWDp0Wneaui2W5dTBE7luIzUYyyzSJkFctj+m0brI5fPS1TMtQzxi+r
 1nc+nygKS4xbd6+7gaspyfEaujn2HmTtJgpPLC06fdwjFa7wmhVDRwKE1a3vJGRjk+4RsIaI
 lEY+zYGt6U+9EW3CNL6WnWFTGWs5EdNHosIVrRqtUTUk/WS4h7fD2QNS3hKb9lgvdJeqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:CRjFMqpDbv3BU2m03cUvBvsaV5rfeYIsimQD101hICG9Ffbo8/
 xG/c5rsCMc7Qx7ZJhOo7y90da7MBThHPJOjrX5RI3SOjUO4VHYVb2KjrGSoQEIeRefygc178
 4JGZSWJ+efMbEQt7eY3ODXKbcdKA3uytHRuQ8Gok0dMT2CE5sM0+6PMHfkLqUnLDM2eqYRJd
 6n6s1Lpz2vPVgRYMS9ChA+LpX+juyOq5L8fAIPAloC9QHmt0LT1FYGeyLopSsjbw==
X-IronPort-AV: E=Sophos;i="5.98,272,1673884800"; 
 d="scan'208,217";a="424347916"
Received: from 219-90-185-117.ip.adam.com.au (HELO swtf.swtf.dyndns.org)
 ([219.90.185.117])
 by icp-osb-irony-out3.iinet.net.au with ESMTP; 19 Mar 2023 09:25:47 +0800
Message-ID: <c1a23e6bbb140660a5de48f89e9b8b7723d66ea8.camel@iinet.net.au>
Subject: Re: run script after auditd rotates logs
From: Burn Alting <burn.alting@iinet.net.au>
To: "Christiansen, Edward - 0992 - MITLL" <edwardc@ll.mit.edu>, 
 "linux-audit@redhat.com" <linux-audit@redhat.com>
Date: Sun, 19 Mar 2023 12:25:46 +1100
In-Reply-To: <BN0P110MB1210873AA2E95F81D143AD299C829@BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB1210873AA2E95F81D143AD299C829@BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Reply-To: burn@swtf.dyndns.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5620758371853911036=="

--===============5620758371853911036==
Content-Type: multipart/alternative; boundary="=-lqY9CV2Z/AHyHItW97xR"

--=-lqY9CV2Z/AHyHItW97xR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ed,
One indirect way of achieving this is to author a script that	- sends SIGUSR1 to
the auditd process (which causes auditd to immediately rotate the logs. It will
consult the max_log_file_action to see if it should keep the logs or not.)	- do
whatever you need to do with the rolled over audit.log files
Clearly you only have access to the rolled over log files (given that's what you
want).
Rgds

On Sat, 2023-03-18 at 14:36 +0000, Christiansen, Edward - 0992 - MITLL wrote:
> I would like to know if there is a way to tell auditd to run a script or command
> after it rotates its logs.  I can do this with logrotate, but would much prefer
> something native to auditd.  I spent some toime with Google and found only
> logrotate solutions.
> Thanks,
> Ed ChristiansenMillstone Hill SysAdmin--Linux-audit mailing 
> listLinux-audit@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-audit

--=-lqY9CV2Z/AHyHItW97xR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Ed,</div><div><br></div><div>One indirect way of achieving this is=
 to author a script that</div><div>=09- sends SIGUSR1 to the auditd process=
 (which causes auditd to immediately rotate the logs. It will consult the m=
ax_log_file_action to see if it should keep the logs or not.)</div><div>=09=
- do whatever you need to do with the rolled over audit.log files</div><div=
><br></div><div>Clearly you only have access to the rolled over log files (=
given that's what you want).</div><div><br></div><div>Rgds</div><div><br></=
div><div><br></div><div>On Sat, 2023-03-18 at 14:36 +0000, Christiansen, Ed=
ward - 0992 - MITLL wrote:</div><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>I would lik=
e to know if there is a way to tell auditd to run a script or </pre><pre>co=
mmand after it rotates its logs.  I can do this with logrotate, but would <=
/pre><pre>much prefer something native to auditd.  I spent some toime with =
Google and </pre><pre>found only logrotate solutions.</pre><pre><br></pre><=
pre>Thanks,</pre><pre><br></pre><pre>Ed Christiansen</pre><pre>Millstone Hi=
ll SysAdmin</pre><pre>--</pre><pre>Linux-audit mailing list</pre><a href=3D=
"mailto:Linux-audit@redhat.com"><pre>Linux-audit@redhat.com</pre></a><pre><=
br></pre><a href=3D"https://listman.redhat.com/mailman/listinfo/linux-audit=
"><pre>https://listman.redhat.com/mailman/listinfo/linux-audit</pre></a><pr=
e><br></pre></blockquote></body></html>

--=-lqY9CV2Z/AHyHItW97xR--

--===============5620758371853911036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============5620758371853911036==--


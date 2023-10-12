Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD387C6C1A
	for <lists+linux-audit@lfdr.de>; Thu, 12 Oct 2023 13:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697109357;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=86KM5BZF/1dzT98RpAlUfDDbvMF7r/WkWAANB5A+Z2k=;
	b=Y05B/a7zyBbsKDw/Cx4PXCEhgwmlyGbnMhYYyN21MbBk51bxv0Gve6qZznzpLmbng347sR
	9QkguS2U3JJco8MxrPxv9G4KHJF0c0sQ3dbt8mlG1SKQW6U7rQxx2mEpMX4ElCIkSAb/ed
	JNDD26uml4B9/IshWEjEp/gjvSNfpv0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-FGLChddMOEqcDb6FKW_FMQ-1; Thu, 12 Oct 2023 07:15:51 -0400
X-MC-Unique: FGLChddMOEqcDb6FKW_FMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9B885A5BA;
	Thu, 12 Oct 2023 11:15:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 191DF1065667;
	Thu, 12 Oct 2023 11:15:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E1B6419465B8;
	Thu, 12 Oct 2023 11:15:41 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 51DBD1946586 for <linux-audit@listman.corp.redhat.com>;
 Thu, 12 Oct 2023 10:46:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 389EA2026D68; Thu, 12 Oct 2023 10:46:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 315D72026D4B
 for <linux-audit@redhat.com>; Thu, 12 Oct 2023 10:46:48 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEA63281294E
 for <linux-audit@redhat.com>; Thu, 12 Oct 2023 10:46:48 +0000 (UTC)
Received: from icp-osb-irony-out6.external.iinet.net.au
 (icp-osb-irony-out6.external.iinet.net.au [203.59.1.106]) by
 relay.mimecast.com with ESMTP id us-mta-127-QJ7wmoa8MkqKv48mLv2dZg-1; Thu,
 12 Oct 2023 06:46:45 -0400
X-MC-Unique: QJ7wmoa8MkqKv48mLv2dZg-1
Received: from gateway.pc5.atmailcloud.com (HELO mqr.i-0be12b36c1a091075)
 ([54.206.88.211])
 by icp-osb-irony-out6.iinet.net.au with ESMTP; 12 Oct 2023 18:43:39 +0800
Received: from CMR-KAKADU03.i-072794d2dc0418b9c by MQR.i-0be12b36c1a091075
 with esmtps (envelope-from <burn.alting@iinet.net.au>)
 id 1qqtAJ-0003gS-0V for linux-audit@redhat.com;
 Thu, 12 Oct 2023 10:43:39 +0000
Received: from [203.214.43.215] (helo=swtf.swtf.dyndns.org)
 by CMR-KAKADU03.i-072794d2dc0418b9c with esmtpsa
 (envelope-from <burn.alting@iinet.net.au>) id 1qqtAI-00038H-35
 for linux-audit@redhat.com; Thu, 12 Oct 2023 10:43:39 +0000
Message-ID: <ed3201164673f4da5a9bdca78f924687aeaa4c80.camel@iinet.net.au>
Subject: Re: [linux-audit/audit-userspace] Aureport on stream of data (Issue
 #324)
From: Burn Alting <burn.alting@iinet.net.au>
To: linux-audit@redhat.com
Date: Thu, 12 Oct 2023 21:43:37 +1100
Mime-Version: 1.0
X-Atmail-Id: burn.alting@iinet.net.au
X-atmailcloud-spam-action: no action
X-atmailcloud-spam-report: Action: no action
X-Cm-Analysis: v=2.4 cv=M7qLaQ8s c=1 sm=1 tr=0 ts=6527cddb
 a=JRKI/gKiTVZNUCbuWNW1VQ==:117 a=JRKI/gKiTVZNUCbuWNW1VQ==:17
 a=bhdUkHdE2iEA:10 a=x7bEGLp0ZPQA:10 a=frCt6Gu7YEBs-T7PhIsA:9
 a=QEXdDO2ut3YA:10 a=jRLJA9BTng8ZOQAMSwIA:9 a=sxl5kNb3FcnRBwbZ:21
 a=_W_S_7VecoQA:10
X-Cm-Envelope: MS4xfL2XvVvRmkH8CyCB+m0N7VTmwwRvYzSLn40eJTniFi/1ksGz45W8E4Q+AmzWMPk/1LYESNtC0+GBuaIj7j8HAdrlRUTkfsPHGBhAz4+kzlIxcUivbBLl
 0WFCFarb1Pp11pP/LGmd05ORWKcEpxGs8EdYX0WAcOwpM0ZxtHcTT7yz8rXoVbk4J5tklhq7bLKgLQ==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: iinet.net.au
Content-Type: multipart/mixed; boundary="===============2943934298631581196=="

--===============2943934298631581196==
Content-Type: multipart/alternative; boundary="=-DRFLLIKxebCl6nIXU0V5"

--=-DRFLLIKxebCl6nIXU0V5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Yes please, 2 questions : 

1) Is there a way to run aureport on updating auditd logs ? That is, not 
running aureport on all logs, just updating the last aureport with the 
recent addition of logs ? 
2) Could aureport run on combined auditd logs from more than one computor 
and produce multiple outputs ? 

Thank you 


To answer the above
For 1. use the -checkpoint option of ausearch to generate the events.
For 2. assuming you disseminate the source hosts on  the aggregating host, again
multiple invocations of ausearch will work with the -checkpoint option.

Rgds

--=-DRFLLIKxebCl6nIXU0V5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div style=3D"margin-left: 3ch;"><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);">Yes please, 2 questions :&nbsp;</span></div><div =
style=3D"margin-left: 3ch;"><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0);"><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
);">1) Is there a way to run aureport on updating auditd logs ? That is, no=
t&nbsp;</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"=
><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">running au=
report on all logs, just updating the last aureport with the&nbsp;</span><b=
r style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style=3D"=
caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">recent addition of logs ?&=
nbsp;</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><=
span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">2) Could aur=
eport run on combined auditd logs from more than one computor&nbsp;</span><=
br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style=3D=
"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">and produce multiple outp=
uts ?&nbsp;</span><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);"><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span st=
yle=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Thank you&nbsp;</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><div><span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><br></span></div=
></div><div>To answer the above</div><div>For 1. use the -checkpoint option=
 of ausearch to generate the events.</div><div>For 2. assuming you dissemin=
ate the source hosts on  the aggregating host, again multiple invocations o=
f ausearch will work with the -checkpoint option.</div><div><br></div><div>=
Rgds</div></body></html>

--=-DRFLLIKxebCl6nIXU0V5--

--===============2943934298631581196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2943934298631581196==--


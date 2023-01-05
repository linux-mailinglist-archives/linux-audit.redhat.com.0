Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BE65ED3C
	for <lists+linux-audit@lfdr.de>; Thu,  5 Jan 2023 14:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672925928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=g16JfSLaRVW9nJKLWJBmMFq+bUoUcybbmqqq1TDbHrA=;
	b=BGX0aYz+ME2ibeL2ZGJE4SoTYkFRfuiyA6LNOWvKxEEqCjt2sexzUvVMgCGzMDOvDq25W+
	6LXgNyelUfikBw00a1GZlajTPKptrj/Rne3GFAiC7Q5JMXqGZA8engDAYN0/0W1Ixcs9CY
	qXR6WRg2pjbvKqh++4s3ffJ3HtKMJsA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-TdYuXdBYOJK4UOMuux6K6Q-1; Thu, 05 Jan 2023 08:38:46 -0500
X-MC-Unique: TdYuXdBYOJK4UOMuux6K6Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B68A7281DE73;
	Thu,  5 Jan 2023 13:38:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 936FE492D8B;
	Thu,  5 Jan 2023 13:38:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B11BF1946597;
	Thu,  5 Jan 2023 13:38:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3F6C1946586 for <linux-audit@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 09:46:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1C08B53AA; Thu,  5 Jan 2023 09:46:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1419B53A0
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 09:46:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E83008027FE
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 09:46:20 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-I9RwrraHPR2KSPCUINesuQ-1; Thu, 05 Jan 2023 04:46:18 -0500
X-MC-Unique: I9RwrraHPR2KSPCUINesuQ-1
Received: by mail-ej1-f49.google.com with SMTP id x22so88767857ejs.11
 for <linux-audit@redhat.com>; Thu, 05 Jan 2023 01:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VPh+dQC0skT7aUCV6do3cnhwGGLyBZ0i5ZaDpln1SkA=;
 b=3X1ujLfrAxCxK/dg4AGm6DbTU1FIqfHO+Xu2Y6C5WCcoP0xX8EC0mW/7uWjF1IIMU6
 tG96UeWRGo9OGgarxXaU8+IU3mWY8+Ou+cirBPVr7rDdBHBBmtNAqW9+QmSoBoWnKiC9
 WpBGAe5FBj7ACPUv29+CyECKnNpHTP7vvZ1UaMq4d6liYRtxg87bSNQlMS/+4eyJ4q4/
 WU/a0dW5FTtvtx9RecVwcu2Bs8dWFQQQ5q0tZiM49nzwZk1G8XNTi92CTVpa+Q6yMsfw
 iCKZ1IKYQkZHdWFDfz2A0SampMfGyzk883MONfBy5hVQmMOiUx/7ecxgSpKfndfyeLg2
 ndNg==
X-Gm-Message-State: AFqh2ko2fddYooZ8G2DiiE4A7ctag00dF7yVQTYaWxHfjJy0CGLDkBHn
 Zl/Tgly676bINZbRhCbPC2dXyrZelpCSZky1tNdl2QZOyBC7tA==
X-Google-Smtp-Source: AMrXdXsjoC8Xjr/SwxH6L0KQwrJRO/UcZcjX6R5rtmuetcocht4bOiqHWB5Ss5GMufohcDmVrPIw2lsLs14tIPi8du0=
X-Received: by 2002:a17:906:8614:b0:7c1:29e3:8159 with SMTP id
 o20-20020a170906861400b007c129e38159mr5044342ejx.208.1672911977101; Thu, 05
 Jan 2023 01:46:17 -0800 (PST)
MIME-Version: 1.0
From: Ariel Silver <arielsilver77@gmail.com>
Date: Thu, 5 Jan 2023 11:46:06 +0200
Message-ID: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
Subject: New bug in Audit
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 05 Jan 2023 13:38:37 +0000
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3660009656084715684=="

--===============3660009656084715684==
Content-Type: multipart/alternative; boundary="00000000000022c01805f1812ce4"

--00000000000022c01805f1812ce4
Content-Type: text/plain; charset="UTF-8"

I found the following bug:


OS version = Red Hat Enterprise Linux release 8.6 (Ootpa)
Kernel version = 4.18.0-425.3.1.el8.x86_64
auditctl version = 3.0.7

Scenario 1:
When I load the configurations :
*auditctl -a always,exit -S all -F dir=/ -F perm=w -F success=1*
And run the command:
*cp /tmp/1  /tmp/2*
No new log is created in: /var/log/audit/audit.log
But the file is indeed copied.

Scenario 2:
When I load the configurations :
*auditctl -a always,exit -S all -F dir=/ -F perm=w -F success=0*
And run the command:
*cp /tmp/1  /tmp/2*
No new log is created in: /var/log/audit/audit.log
But the file is indeed copied.

Scenario 3:
When I load the configurations :
*auditctl -a always,exit -S all -F dir=/ -F perm=w*
And run the command:
*cp /tmp/1  /tmp/2*
Yes new log is created in: /var/log/audit/audit.log
File was indeed copied.

Conclusion:
Only when I don't use the -F success  new logs are created.
Why is that?
Any alternative ?

--00000000000022c01805f1812ce4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div style=3D"text-align:left" dir=3D"ltr">I found the fol=
lowing bug:<br><br><br></div><div style=3D"text-align:left">OS version =3D =
Red Hat Enterprise Linux release 8.6 (Ootpa)</div><div style=3D"text-align:=
left">Kernel version =3D 4.18.0-425.3.1.el8.x86_64</div><div style=3D"text-=
align:left">auditctl version =3D 3.0.7</div><div style=3D"text-align:left">=
<br></div><div style=3D"text-align:left">Scenario 1:</div><div style=3D"tex=
t-align:left">When I load the configurations :</div><div style=3D"text-alig=
n:left"><b>auditctl -a always,exit -S all -F dir=3D/ -F perm=3Dw -F success=
=3D1</b></div><div style=3D"text-align:left">And run the command:</div><div=
 style=3D"text-align:left"><b>cp /tmp/1 =C2=A0/tmp/2</b></div><div style=3D=
"text-align:left">No new log is created in: /var/log/audit/audit.log</div><=
div style=3D"text-align:left">But the file is indeed copied.</div><div styl=
e=3D"text-align:left"><br></div><div style=3D"text-align:left">Scenario 2:<=
/div><div style=3D"text-align:left">When I load the configurations :</div><=
div style=3D"text-align:left"><b>auditctl -a always,exit -S all -F dir=3D/ =
-F perm=3Dw -F success=3D0</b></div><div style=3D"text-align:left">And run =
the command:</div><div style=3D"text-align:left"><b>cp /tmp/1 =C2=A0/tmp/2<=
/b></div><div style=3D"text-align:left">No new log is created in: /var/log/=
audit/audit.log</div><div style=3D"text-align:left">But the file is indeed =
copied.</div><div style=3D"text-align:left"><br></div><div style=3D"text-al=
ign:left">Scenario 3:</div><div style=3D"text-align:left">When I load the c=
onfigurations :</div><div style=3D"text-align:left"><b>auditctl -a always,e=
xit -S all -F dir=3D/ -F perm=3Dw</b></div><div style=3D"text-align:left">A=
nd run the command:</div><div style=3D"text-align:left"><b>cp /tmp/1 =C2=A0=
/tmp/2</b></div><div style=3D"text-align:left">Yes new log is created in: /=
var/log/audit/audit.log</div><div style=3D"text-align:left">File was indeed=
 copied.</div><div style=3D"text-align:left"><br></div><div style=3D"text-a=
lign:left">Conclusion:</div><div style=3D"text-align:left">Only when I don&=
#39;t use the -F success =C2=A0new logs are created.</div><div style=3D"tex=
t-align:left">Why is that?</div><div style=3D"text-align:left">Any alternat=
ive ?</div></div>

--00000000000022c01805f1812ce4--

--===============3660009656084715684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============3660009656084715684==--


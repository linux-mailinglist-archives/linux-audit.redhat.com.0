Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD4A525DA16
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 15:39:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-KOqLppcRMlWbBOhlH4AStg-1; Fri, 04 Sep 2020 09:39:44 -0400
X-MC-Unique: KOqLppcRMlWbBOhlH4AStg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A364D89BAB3;
	Fri,  4 Sep 2020 13:39:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB115D9CC;
	Fri,  4 Sep 2020 13:39:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C031879DAE;
	Fri,  4 Sep 2020 13:39:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084Dcp5M005439 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 09:38:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2E882156A2D; Fri,  4 Sep 2020 13:38:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD14D2166B27
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 13:38:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C190680121C
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 13:38:48 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-537--QqWrVeSPXOVOZk41cObRQ-1; Fri, 04 Sep 2020 09:38:45 -0400
X-MC-Unique: -QqWrVeSPXOVOZk41cObRQ-1
Received: by mail-ed1-f45.google.com with SMTP id l17so6080057edq.12
	for <linux-audit@redhat.com>; Fri, 04 Sep 2020 06:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=b5ogMM3srJqt8thWMGryRGCFfd0MPQmVqaP4BGw4oBk=;
	b=p3pihcD9Gzs+hiUPLBoPjtZb0UAqMH+4Bjai25r2wSr25VgkIDX+LtsKavad4O7Kym
	7Abnri5H7fD+T2rQxtQm212SU1r4lOr0n182hz7iLwGpkkWlfWji67vO85T9CcAE+CC5
	+kuvaksV0+fSFPecUNATPEOHDpHhEofeQLWz0ExwSGZLGhrJN18ys/t73J5phGxbp7po
	Q7psTkg89bptSvkd5BZQ0dwMRSqVqQyIsqjhprMEXs5ROFErqCjwlqtZ11DpcVLA/vsd
	05Wx7/mV7Iy5rTaymPkaGwNgU4DiiNzJxC8TFf1/2xT2mewDjwR5bO7IjE6bQKWvHaQK
	659A==
X-Gm-Message-State: AOAM531ccA9t0WFL6jQvkbpF8BY5Rj2Kd87E2bCd22Y8SX6gYUNeLA8A
	vHjF8UdRIRJVgQvIN4zWbV3StKbU68lLH1KqNfp+DBkycg5cQg==
X-Google-Smtp-Source: ABdhPJx6tNipUaJOT1WGSrDcqsQpPfAEofL3E4SfcZlph+iB+8XwI6kUoI8D2r1xdvZTQVZt8TUor0GSuWSRDxA+nTY=
X-Received: by 2002:a05:6402:1548:: with SMTP id
	p8mr8987883edx.65.1599226724272; 
	Fri, 04 Sep 2020 06:38:44 -0700 (PDT)
MIME-Version: 1.0
From: Rohit Nambiar <cola.vn@gmail.com>
Date: Fri, 4 Sep 2020 19:08:33 +0530
Message-ID: <CAHvE9BK5+oRZrUCOkJ+Ong8z-R2ZVOmi-CZfddXJboRqWOGRkA@mail.gmail.com>
Subject: Security Auditd Config for Enterprises
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7121735316203420085=="

--===============7121735316203420085==
Content-Type: multipart/alternative; boundary="000000000000d0e78405ae7cfcad"

--000000000000d0e78405ae7cfcad
Content-Type: text/plain; charset="UTF-8"

Hi all!

Apologies if this topic has already been discussed before, I couldn't find
an easy way to sift through older archives.

Is there an auditd rule set which offers a reasonable level of security
visibility and has been tested on enterprise production systems? And if
such a rule set can be shared here?

I'm looking for a base document to deploy/modify for use within my
organization. Many thanks in advance.

Regards

--000000000000d0e78405ae7cfcad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all!<br><div dir=3D"auto"><br></div><div dir=3D"auto">A=
pologies if this topic has already been discussed before, I couldn&#39;t fi=
nd an easy way to sift through older archives.</div><div dir=3D"auto"><br><=
/div><div>Is there an auditd rule set which offers a reasonable level of se=
curity visibility and has been tested on enterprise production systems? And=
 if such a rule set can be shared here? <br></div><div><br></div><div>I&#39=
;m looking for a base document to deploy/modify for use within my organizat=
ion. Many thanks in advance.<br></div><div><br></div><div>Regards<br></div>
</div>

--000000000000d0e78405ae7cfcad--

--===============7121735316203420085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============7121735316203420085==--


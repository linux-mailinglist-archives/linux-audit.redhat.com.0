Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F89228E66E
	for <lists+linux-audit@lfdr.de>; Wed, 14 Oct 2020 20:31:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-rIoJtG3YOFiYz01b6OPBpQ-1; Wed, 14 Oct 2020 14:31:20 -0400
X-MC-Unique: rIoJtG3YOFiYz01b6OPBpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF98B1021203;
	Wed, 14 Oct 2020 18:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB9A6EF5E;
	Wed, 14 Oct 2020 18:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 473FE180B657;
	Wed, 14 Oct 2020 18:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EIV72b010385 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 14:31:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F15622166BCC; Wed, 14 Oct 2020 18:31:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBC182166BB3
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 18:31:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93051811E83
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 18:31:04 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-68-dpDkxo9HP9-Oerkdy4V7HQ-1; Wed, 14 Oct 2020 14:31:01 -0400
X-MC-Unique: dpDkxo9HP9-Oerkdy4V7HQ-1
Received: by mail-il1-f182.google.com with SMTP id j13so399990ilc.4
	for <linux-audit@redhat.com>; Wed, 14 Oct 2020 11:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AHt5tLF5gWmQ5vGayog3CxCfpSkRrhMnQQmslnhaOlA=;
	b=FAxFwvhX9LpJHgnxyoaibCmZqyiv2F05dAhyEhvgpxD5NXv2efSWhCZgRpdG6P1/X9
	ShZhkd6N4hn8u2S73jXEr+T0QpJyDkoEud8aXNw970FIX5Q9hr9JK9gH9kMZJ1LXi0YC
	DGStywQIcva9N+uputcM3zyLUBPHrdMCTR2njeQJ1y0NAy3oz49q1vn02a1wwe0RP4rM
	4KD02uv4inUipznedYk8QdirJuBXHQHC8+vszzUoCqhOR9Fk395vegWAJHHnnIyagCQL
	ekNFaqbJz8uAhjtnZFcjAHFWFmNzaD2kbhWP3wsp6jxTowNlNoebE8iaw8IaSSjiqRlD
	A6RQ==
X-Gm-Message-State: AOAM533teOdNneidtbdFo5lWL0JKIbn5H9dWSTLnV0AFt9DkbJU37EeC
	FCnW5DlCGP739fQ3em8TNKziug2RqoKNy14cTnLZFpS/
X-Google-Smtp-Source: ABdhPJycS9XSLAf99alljYjNcJtXiCjamzEF8msFUN8jh9r9cwMsGFJiqtfpkMkBrXMJNF3BzKNVn935eEXzeqJYpgM=
X-Received: by 2002:a92:481d:: with SMTP id v29mr428081ila.300.1602700260053; 
	Wed, 14 Oct 2020 11:31:00 -0700 (PDT)
MIME-Version: 1.0
From: "warron.french" <warron.french@gmail.com>
Date: Wed, 14 Oct 2020 14:30:48 -0400
Message-ID: <CAJdJdQmPhUY0fSUp5eakf_up3nnGB1_4FLHexLvtbkCuEo-e2g@mail.gmail.com>
Subject: How to confirm AUDITD is immutable
To: Linux Audit <linux-audit@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0574808097741817651=="

--===============0574808097741817651==
Content-Type: multipart/alternative; boundary="000000000000ae97f205b1a5bb8e"

--000000000000ae97f205b1a5bb8e
Content-Type: text/plain; charset="UTF-8"

Hello, I just wanted to confirm for my memory that if I wanted to confirm
that the auditd process running on my system was configured correctly and
intended to be
*immutable (*setting *-e 2*) I would do so easily by executing:

*auditctl  -s*

When I execute that command I get back in the results that have:
*enabled 1*
*loginuid_immutable 0 unlocked*
*among a few other lines.*

Shouldn't I actually see *enabled 2*?
I have in one of our .rules files under /etc/audit/rules.d/ the syntax
"-e 2".


Thanks,
--------------------------
Warron French

--000000000000ae97f205b1a5bb8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, I just wanted to confirm=C2=A0for my memory th=
at if I wanted to confirm that the auditd process=C2=A0running on my system=
 was configured=C2=A0correctly and intended to be</div><div><b>immutable (<=
/b>setting <b>-e 2</b>)=C2=A0I would do so easily by executing:</div><div><=
br></div><div><b><font color=3D"#ff0000">auditctl=C2=A0 -s</font></b></div>=
<div><br></div><div>When I execute that command I get back in the results t=
hat have:</div><div><b>enabled 1</b></div><div><b>loginuid_immutable 0 unlo=
cked</b></div><div><i>among a few other lines.</i></div><div><i><br></i></d=
iv><div>Shouldn&#39;t I actually see <b>enabled 2</b>?</div><div>I have in =
one of our .rules files under /etc/audit/rules.d/ the syntax=C2=A0 =C2=A0 &=
quot;-e 2&quot;.</div><div><br></div><div><br></div><div>Thanks,</div><div>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr">--------------------------<br><font color=3D"#000099" s=
ize=3D"4">Warron French<br><font size=3D"4"><font size=3D"4"><font size=3D"=
4"><br></font></font></font></font></div></div></div></div>

--000000000000ae97f205b1a5bb8e--

--===============0574808097741817651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0574808097741817651==--

